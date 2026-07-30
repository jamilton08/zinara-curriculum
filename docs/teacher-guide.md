# Teacher Guide

You do **not** need to be a computer scientist to run this course. The lessons are self-paced and self-grading: videos explain concepts, live checks and automated test cases grade the building work (with human hints when something fails), and your job is facilitation, discussion, and reviewing written responses. This guide covers everything operational.

## 1. What you need

- **Computers**: Mac or Windows machines that can run Zinara Studio (a customized Godot editor). One per student or per pair — pair programming works well for most lessons.
- **Zinara Studio**: download from the Releases page. If your machines are district-managed, forward `docs/INSTALL.md` to your IT contact — it has everything they need, and the app requires no server, no accounts, and no network access to run lessons.
- **A webcam** (Module 5 only): any built-in or USB camera. All motion processing happens on the device; nothing is recorded and nothing is uploaded. See §6.
- **The lessons**: download the module packs (or clone this repository). Each lesson is a folder students open from the dashboard.

## 2. Student IDs (do this before day one)

Students are identified **only** by anonymous IDs — no names, no emails, no accounts.

1. Generate one ID per student in the form `word-word-number` (e.g., `brave-otter-41`). Any generator or a spreadsheet formula works; avoid letting students choose their own (they will type their real names).
2. Keep the **ID → student mapping** yourself: on paper, or in your school's own gradebook system. It never goes into Zinara, and it never leaves your control.
3. Students enter their ID once in the Classroom tab; all progress is stored on the machine under that ID.

If a student forgets their ID, you have the mapping. If students share machines across periods, IDs keep their progress separate on the same computer.

## 3. Classroom rhythm

Each lesson is designed for roughly **3–4 class sessions**:

- **Concept day**: watch the lesson video (whole-class or individually), discuss the "Decision of the Day," answer the multiple-choice checks.
- **Build days (1–2)**: students work in the editor; live checks turn green as they complete structural tasks; the test-case button grades coding work and gives hints on failure. Circulate — the hints handle syntax; you handle frustration and "why."
- **Assessment day**: finish remaining items, write the written response, reach 100% on the progress bar.

One module fills one marking period (~6 weeks); the module's mini-project is the natural marking-period grade anchor.

## 4. Reviewing written responses

Written responses are the one thing that isn't auto-graded — by design. They're where students justify decisions, and they're your best window into understanding. Responses save on the student's machine and mark the item "pending teacher review." Have students show you their response in class or export it (see §5); mark it reviewed in your own records. A 2-minute read per student per lesson is typical.

## 5. Grades

Progress maps cleanly to grading: each lesson's required items are the completion record, and mini-projects carry rubrics in their lesson folders. A per-marking-period export (CSV keyed by student ID) is on the roadmap; until then, the progress bar + your written-response review are the gradebook inputs. Because you hold the ID mapping, converting ID-keyed records to named grades happens only in your gradebook, never in the software.

## 6. Privacy — talking points for parents, admin, and IT

- The software collects **no personal information**: no names, no emails, no accounts.
- All progress is stored **locally on the school machine**, keyed to an anonymous ID only the teacher can map to a student.
- Nothing requires an internet connection except watching videos (hosted on YouTube) — lessons, checks, and grading are fully offline.
- In the motion module, the camera feed is processed **entirely on the device, in real time**. No video is recorded, stored, or transmitted — the software has no capability to upload it.
- The curriculum is free and open source; anyone can inspect exactly what the software does.

## 7. Troubleshooting (the four things that actually happen)

| Symptom | Cause | Fix |
|---|---|---|
| "My code is right but tests fail" | Unsaved file — the grader reads from disk | Save (Cmd/Ctrl+S), rerun. Teach "save before test" as a habit week one |
| A live check stays red | Exact-name mismatch (`Status Label` ≠ `StatusLabel`) or wrong parent | Names are exact — this is Lesson 1.1's precision point in the wild |
| Scene is a mess / student deleted something vital | Kids | Reset the assignment from the Classroom tab (restores starter files; keeps their progress record) |
| Mouse wheel won't scroll a section | Hovering a text box that captures scrolling | Move the cursor to the page margin and scroll there |

Anything else: open an issue on the repository — include the lesson ID and what the terminal/Output panel says.

## 8. Beyond your classroom

- Lessons are data — you can edit any lesson's `manifest.json` (questions, prompts, videos) without touching code. See `CONTRIBUTING.md`.
- Piloting this curriculum? Open an issue and say hi — teacher feedback drives the roadmap.
