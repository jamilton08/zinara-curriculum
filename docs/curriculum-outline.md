# Zinara Curriculum — Master Outline (v0.1)

**Mission:** Computers don't think — people taught them to. This course teaches how humans embed logic into machines, from a first if-statement to characters that play on their own, so that in a world full of AI, students are the people who understand what's underneath it.

**Format:** 5 modules + capstone. Each lesson = one independent Godot project loaded from the dashboard, with its own test cases. Every lesson has a **Decision of the Day** — the human engineering judgment it exposes.

**Assessment key:** MC = multiple choice · WR = written response · IE = in-editor actions · CAD = character editor · CODE = coding w/ test cases

---

## Module 1 — Basics: Human Logic Becomes Computer Logic (~8 lessons)

*Thesis: you already think in algorithms — code is just notation for thought you possess.*

1. **You Already Think in Algorithms** — daily routines as step sequences; ambiguity breaks machines. *Decision: how precise is precise enough?* (WR, MC)
2. **If/Else — Formalizing Decisions** — first script: a scene reacts to a condition. *Decision: what conditions matter?* (CODE, IE)
3. **Loops — Repetition with Purpose** — spawn a row of objects; infinite loop = frozen game. *Decision: when do we stop?* (CODE)
4. **Variables & State** — what the program "knows"; a health bar that remembers. *Decision: what's worth remembering?* (CODE, IE)
5. **Functions** — name logic once, use it everywhere. *Decision: where do you draw the boundary?* (CODE)
6. **The Screen Is a Grid** — first coordinates; move a sprite with code (2D). *Decision: who defines (0,0)?* (IE, CODE)
7. **Events & Signals** — programs that react instead of run top-to-bottom. *Decision: push or poll?* (IE, CODE)
8. **Mini-project: Interactive Scene** — button + character + reaction, all concepts combined. (CODE, IE)

## Module 2 — Data Structures: Every Structure Is a Decision (~8 lessons)

*Thesis: choosing how to organize data IS engineering — every choice trades something for something.*

1. **Lists/Arrays — The Inventory** — build a game inventory. *Decision: ordered by what?* (CODE, MC)
2. **Stacks — Undo** — last-in-first-out; implement undo for scene edits. *Decision: why would "last first" ever be right?* (CODE)
3. **Queues — The Waiting Line** — turn order / matchmaking. *Decision: fairness vs. priority.* (CODE)
4. **Dictionaries — Instant Lookup** — item database by id. *Decision: speed costs memory.* (CODE, MC)
5. **Trees — You've Been Using One** — Godot's scene tree revealed as a data structure; build a dialogue tree. *Decision: hierarchy vs. flat.* (IE, CODE)
6. **Graphs — Worlds Are Graphs** — rooms/maze as nodes + edges. *Decision: what's a connection?* (CODE, IE)
7. **Searching & Traversal** — find things in lists vs. trees vs. graphs; feel the difference. *Decision: brute force or structure?* (CODE)
8. **Mini-project: Inventory + Dialogue Character** — one NPC using 3+ structures, justified in writing. (CODE, WR)

## Module 3 — 2D & 3D Space: The World Becomes Math (~8 lessons)

*Thesis: vectors are the bridge between your physical intuition and computation.*

1. **Vectors Are Arrows** — position vs. direction; draw them, then code them. *Decision: point or arrow?* (MC, CODE)
2. **Vector Math = Movement** — add/subtract to move and aim. *Decision: teleport or travel?* (CODE)
3. **Magnitude & Normalization** — speed separated from direction; fix diagonal speed-boost bug. *Decision: how fast is fair?* (CODE)
4. **Enter the Z-Axis** — 2D→3D; cameras and what "forward" means. *Decision: where does the eye go?* (IE, CODE)
5. **Rotation & Transforms** — spinning, orbiting, degrees vs. radians. *Decision: rotate the object or the world?* (CODE, IE)
6. **Local vs. Global Space** — parent/child transforms; the turret on the moving tank. *Decision: whose coordinates?* (IE, CODE)
7. **Skeletons Are Trees of Transforms** — CAD unit: rig a character; bones = Module 2 trees + Module 3 transforms. *Decision: how many bones is enough?* (CAD)
8. **Mini-project: 3D Obstacle Course** — moving platforms, camera, a rigged character to run it. (CODE, IE, CAD)

## Module 4 — Character Intelligence: AI Before AI (~8 lessons)

*Thesis: video games had artificial intelligence decades before ChatGPT — intelligence as designed behavior.*

1. **The Pac-Man Ghosts (1980)** — four personalities from a handful of rules; case study + play session. *Decision: what makes behavior feel alive?* (WR, MC)
2. **State Machines** — idle/patrol/chase/flee; build one. *Decision: what triggers a change of mind?* (CODE, IE)
3. **Decision Trees** — an NPC that weighs options. *Decision: order of questions = personality.* (CODE)
4. **Pathfinding I — Search the Graph** — BFS on the Module 2 maze; the character finds its own way. *Decision: shortest or smartest?* (CODE)
5. **Pathfinding II — A\*** — adding cost and heuristics. *Decision: what does "expensive" mean in your world?* (CODE, MC)
6. **Sensing — Vision Cones & Raycasts** — dot product returns; the guard that sees you. *Decision: how much should the enemy know?* (CODE, IE)
7. **Personality Through Parameters** — same logic, different numbers → different characters (the ghost lesson, proven). *Decision: tuning is design.* (CODE, WR)
8. **Mini-project: A Character That Plays Its Own Way** — autonomous NPC in an arena; students present and defend its decisions. (CODE, WR)

## Module 5 — Motion Intelligence: You Are the Data (~7 lessons)

*Thesis: learned intelligence is the same human-logic embedding — the rules are just discovered from data instead of hand-written. Modern AI is the ghost's rules, learned at scale.*

*(All pose work live and on-device — nothing recorded, nothing uploaded.)*

1. **From Rules to Data** — why some behavior can't be hand-written; where Module 4 hits its limit. *Decision: write the rule or learn it?* (WR, MC)
2. **Your Body as Vectors** — live pose: 33 landmarks on screen; you are coordinates now. *Decision: what should the machine see?* (IE)
3. **Features — Extracting Meaning** — from raw landmarks to cadence, lean, gesture; threshold-based detection. *Decision: which measurements matter?* (CODE)
4. **Classification** — from thresholds to trained models (concept level); walk/jog/run as classes. *Decision: where do categories come from?* (CODE, MC)
5. **Data Science I — Collect, Label, Clean** — students label motion samples (local only); garbage in, garbage out. *Decision: what counts as a "walk"?* (IE, WR)
6. **Data Science II — Accuracy, Error, Overfitting** — evaluate a classifier; connect explicitly to how LLMs are trained. *Decision: when is "good enough" good enough?* (MC, WR)
7. **Mini-project: Motion Mini-Game** — a game mechanic driven by their own movement, full pipeline. (CODE, IE)

## Capstone — Ship a Game (~4–6 sessions)

*Thesis: engineering ends in something real people use.*

1. **Design doc** — pitch the game, name the structures/intelligence it uses. (WR)
2–4. **Build sprints** — milestones checked by test cases + teacher review.
5. **Playtest & iterate** — classmates play, feedback loop. (WR)
6. **Demo day + opt-in publish** — present; publishing to the class arcade is voluntary, parent-signed, never graded.

---

## Calendar mapping (school year Sept 9, 2026 → June 10, 2027)

Two semesters × three marking periods = **6 MPs of ~6 weeks → one module per marking period, mini-project = the MP grade anchor.**

| MP | Window (approx.) | Module | Notes |
|----|------------------|--------|-------|
| MP1 | Sep 9 – mid Nov | 1 — Basics | Includes onboarding/IDs week 1 |
| MP2 | mid Nov – late Jan | 2 — Data Structures | Holiday breaks land here — has slack |
| MP3 | late Jan – early Mar* | 3 — 2D & 3D Space | 3.8 project = semester milestone |
| MP4 | Mar – mid Apr | 4 — Character Intelligence | |
| MP5 | mid Apr – late May | 5 — Motion Intelligence | Camera setup logistics first week |
| MP6 | late May – Jun 10 | Capstone | **Demo day ~first week of June** — June is chaos (exams, senior activities); don't plan real teaching past it |

*Adjust MP boundaries to the official DOE calendar once posted; Regents week (late Jan) is the semester seam.

**Pace check:** ~8 lessons per 6-week MP ≈ 1.3/week → each lesson spans ~3–4 class days (concept+video day, build days, assessment day) with slack for assemblies/PSAT/snow.

**Build runway (the real deadlines):** only Module 1 + dashboard + manifest must exist by Sept 9. Then rolling: M2 by ~Nov, M3 by ~Jan, M4 by ~Mar, M5 by ~Apr. The curriculum can be built one marking period ahead of the students all year.

## Open questions
- **Where does web/CSS fit?** Currently cut from the core spine (it dilutes the mission). Option: an appendix/elective where students build a web page for their capstone game.
- **Prerequisites per lesson** need mapping once sequence is confirmed (e.g., 4.4 requires 2.6).
- **Which lessons need video vs. text-only** — mark during downstream pass.
- **Test-case difficulty per lesson** — structural (IE) checks are cheap; behavioral (CODE) graders are the build cost. Flag the expensive ones early.
