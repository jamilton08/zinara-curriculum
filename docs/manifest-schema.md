# Zinara Lesson Manifest — Schema v0.1

The manifest is the contract. The **dashboard** reads it to build the module tree, gate unlocks, and compute progress. The **editor** reads it to configure feature profiles and attach watchers. The **test runner** reads it to know what to check. Lessons are data, never code.

## Lesson pack layout

One lesson = one zip (`.zlesson`), extracted by the dashboard into the student workspace:

```
lesson_2_2_stacks/
├── manifest.json        # this schema
├── project/             # the Godot starter project (project.godot inside)
├── media/               # local videos, images (or manifest points to hosted URLs)
└── tests/               # behavioral test scenes/scripts, run headless
```

Reset = delete workspace copy, re-extract. Nothing precious lives in the pack after extraction; student work lives in the workspace copy, progress lives in the local store.

## Top-level schema

```json
{
  "schema_version": 1,
  "id": "m2.l2",
  "content_version": 3,
  "module": "data-structures",
  "title": "Stacks — Undo",
  "thesis": "Why would 'last in, first out' ever be the right choice?",
  "prerequisites": ["m2.l1"],

  "editor": {
    "feature_profile": "profiles/module2.profile",
    "open_scene": "project/main.tscn",
    "locked_files": ["project/engine_helpers.gd"]
  },

  "content": [
    { "type": "video",  "id": "v1", "title": "What is a stack?", "src": "media/stacks_intro.mp4", "minutes": 6 },
    { "type": "text",   "id": "t1", "src": "media/instructions.md" }
  ],

  "assessments": [ ...typed items, below... ],

  "completion": {
    "required": ["v1", "a1", "a2", "a3"],
    "rule": "all_required"
  },

  "reset": { "restores": ["project/"] }
}
```

`id` + `content_version` key everything: progress records store both, so you can update a lesson mid-year and know which version a student completed.

## Assessment item types

Every item: `{ "id", "type", "title", "required": true|false, "points": n }` plus type-specific fields.

### `mc` — multiple choice (dashboard UI, no project needed)
```json
{ "id": "a1", "type": "mc", "title": "Check: LIFO",
  "question": "You press Undo three times. Which edit reverts first?",
  "choices": ["The first edit you made", "The most recent edit", "A random edit", "All three at once"],
  "answer": 1, "shuffle": true }
```

### `written` — free response (dashboard UI → teacher review queue)
```json
{ "id": "a4", "type": "written", "title": "Justify the structure",
  "prompt": "Name one real app feature besides undo that needs a stack. Why a stack and not a queue?",
  "min_words": 40, "review": "teacher" }
```
Written items are never auto-completed; they mark the lesson "pending review" until the teacher signs off.

### `in_editor` — structural watchers (live checkmarks while editing)
```json
{ "id": "a2", "type": "in_editor", "title": "Build the history node",
  "checks": [
    { "assert": "node_exists",      "path": "Main/UndoHistory" },
    { "assert": "node_class",       "path": "Main/UndoHistory", "class": "Node" },
    { "assert": "script_attached",  "path": "Main/UndoHistory", "script": "undo_history.gd" },
    { "assert": "signal_connected", "from": "Main/UndoButton", "signal": "pressed", "to": "Main/UndoHistory" }
  ] }
```

**Structural check vocabulary v1** (deliberately small — grow only when a lesson demands it):
`node_exists` · `node_class` · `node_count` · `script_attached` · `property_equals` · `signal_connected` · `resource_exists` · `scene_saved`

### `cad` — character editor checks
```json
{ "id": "a5", "type": "cad", "title": "Rig the runner",
  "checks": [
    { "assert": "skeleton_exists", "scene": "project/runner.tscn" },
    { "assert": "min_bones", "count": 12 },
    { "assert": "bind_pose_valid" },
    { "assert": "weights_painted", "min_coverage": 0.9 }
  ] }
```
(Backed by the validation machinery already in `zinara_characters` / `zinara_game`.)

### `code` — behavioral tests (headless run of the student's project)
```json
{ "id": "a3", "type": "code", "title": "Undo actually undoes",
  "entry": "tests/test_undo.tscn",
  "timeout_sec": 20,
  "tests": [
    { "name": "push_then_undo_restores_state" },
    { "name": "undo_on_empty_history_is_safe" },
    { "name": "three_edits_undo_in_reverse_order" }
  ] }
```
The test scene loads the student's scripts, runs assertions, exits with a JSON verdict on stdout: `{"a3": {"passed": ["..."], "failed": [{"name": "...", "hint": "Your undo() crashed on an empty history — what should happen when there's nothing to undo?"}]}}`. **Every failing test ships a human hint.** The hint IS the pedagogy; a red X without one is a support ticket.

## Progress record (local store, synced by student ID)

```json
{ "student": "brave-otter-41", "lesson": "m2.l2", "content_version": 3,
  "items": { "v1": "done", "a1": "done", "a2": "done", "a3": "failed", "a4": "pending_review" },
  "status": "in_progress", "updated": "2026-11-14T15:02:11Z" }
```

Dashboard aggregates these across manifests → module tree with checkmarks. Sync payload is this record, nothing else. No names, no motion data, ever.

## Module index

A tiny per-module `module.json` orders lessons and names the marking period:
```json
{ "id": "data-structures", "title": "Data Structures — Every Structure Is a Decision",
  "marking_period": 2, "lessons": ["m2.l1", "m2.l2", "..."] }
```

## Open decisions

1. **Video hosting** — bundle in packs (big zips, fully offline, no infra) vs. hosted/streamed (small packs, needs network + a domain DOE doesn't block). Hybrid likely: bundle by default, `src` accepts URLs.
2. **Teacher review flow** — where written responses land: export file the teacher opens vs. ID-keyed sync to a teacher dashboard. Decide before Module 1 (lesson 1.1 has a WR item).
3. **Points → grades** — export a per-MP CSV keyed by student ID that the teacher merges with their roster mapping. Format TBD but trivial.
4. **Pack signing** — sign `.zlesson` files so the workstation only loads packs from you (and later, approved authors). Cheap now, hard to retrofit.
