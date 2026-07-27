# Contributing

- **Lesson content**: each lesson lives in `modules/<module>/<lesson>/` — a Godot project with `manifest.json` at its root. Copy `m1.l2-if-else` as the reference pattern.
- **Golden rules**: lessons are data (no addon code inside lesson folders); every failing test ships a human hint; lessons stay fully self-contained (duplicate assets rather than share them).
- **Manifest schema**: see `docs/manifest-schema.md`.
- Keep student-facing text at a high-school reading level; every lesson names its "decision of the day."
