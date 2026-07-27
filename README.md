# Zinara Curriculum

**Computers don't think. People taught them to.** A free, open-source, full-year high-school CS curriculum where students learn how humans embed logic into machines — from a first if-statement to game characters that play on their own to motion-driven intelligence — building real, playable games on [Zinara Studio](https://zinara.gg) along the way.

**This curriculum and the classroom tools are free, forever.** For every school, every teacher, every student.

## Who this is for

- **Teachers** — including teachers who aren't computer scientists. Lessons are self-paced and self-grading: videos explain the concepts, live checks and automated test cases (with human hints) grade the building work, and you review only the written responses. You facilitate; the curriculum carries the CS.
- **Students** learning solo — every lesson works without a classroom.

## How it works

- Each lesson is a **folder**: a complete Godot project + a `manifest.json` that drives the Classroom tab in Zinara Studio (videos, multiple choice, written responses, live in-editor checks, auto-graded coding tasks).
- Lessons are **pure data** — one Studio binary opens them all.
- Progress is stored **locally, keyed to an anonymous student ID**. No accounts, no names, no data leaves the machine.

## Structure

```
modules/
  m1-basics/            MP1 — Human Logic Becomes Computer Logic (8 lessons)
  m2-data-structures/   MP2 — Every Structure Is a Decision        (coming)
  m3-space/             MP3 — The World Becomes Math               (coming)
  m4-character-intel/   MP4 — AI Before AI                         (coming)
  m5-motion-intel/      MP5 — You Are the Data                     (coming)
  capstone/             MP6 — Ship a Game                          (coming)
addon/                  Classroom editor addon (until baked into Zinara Studio)
profiles/               Editor feature profiles per module
tools/                  pack + dev scripts
```

One module per school marking period; each module ends in a mini-project that anchors the grade.

## Try lesson 1.2 right now

1. `tools/dev-install-addon.sh modules/m1-basics/m1.l2-if-else`
2. Open `modules/m1-basics/m1.l2-if-else/` as a project in Godot 4.2+ (or Zinara Studio)
3. Click the **Classroom** tab and work the lesson top to bottom

## Status

- ✅ Lesson format + Classroom addon validated end-to-end (video → MC → live scene checks → headless autograded code → written response)
- ✅ Module 1 scaffolded (m1.l2 complete; l1, l3–l8 stubbed with manifests)
- 🔜 Module 1 content fill-in, dashboard/lesson picker, Modules 2–5, capstone

## Contributing

Teacher-authored lessons will be supported via signed `.zlesson` packs. Until then: issues and PRs welcome — especially from teachers piloting lessons. See `CONTRIBUTING.md`.

## License

MIT for all code. Curriculum content (lesson text, questions) may additionally be offered under CC BY 4.0 — attribution appreciated either way.
