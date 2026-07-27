# Standards Alignment Map

**Frameworks targeted:**
- **2026 CSTA PK–12 Computer Science Standards** (published July 2026) — High School Foundational band (all 46 standards reviewed), plus on-ramps to the **Game Development (GMD)** and **Artificial Intelligence (AIN)** high-school specialty areas
- **NYSED K–12 Computer Science & Digital Fluency Learning Standards** — 9–12 band (strand-level; pin exact numbers before public lesson-level claims)

> **Alignment status.** Self-declared alignment ("designed to address"), not a CSTA-validated crosswalk or endorsement. Every CSTA identifier below is quoted from the published 2026 standards. Markers: **✓** = lesson squarely addresses the standard · **○** = partial/supporting. Standards not claimed are listed in **Gaps** — an honest map beats an inflated one.

## Coverage at a glance (HS Foundational, 46 standards)

| Concept | Standards | Addressed (✓ or ○) | Primary home |
|---|---|---|---|
| Algorithms & Design (11) | HS-ALG-PS-01…IM-11 | 11 | Everywhere; the "Decision of the Day" device |
| Programming (9) | HS-PRO-PD-12…TR-20 | 8 | M1–M4 + capstone (gap: RD-18, see Gaps) |
| Data & Analysis (8) | HS-DAT-DC-21…IM-28 | 6 | M5, on students' own motion data |
| Systems & Security (9) | HS-SYS-HW-29…IM-37 | 7 | Miscellaneous module |
| Computing & Society (9) | HS-SOC-HI-38…CE-46 | 8 | Mission framing, M4/M5, misc |

## Lesson-by-lesson map

### Module 1 — Basics
| Lesson | CSTA 2026 | Notes |
|---|---|---|
| 1.1 Algorithms | ○ HS-ALG-PS-03 | Precision/correctness at intro level; MS-band review by design, builds toward PS-01 |
| 1.2 If/Else | ✓ HS-PRO-RD-17 | check_number(): parameters, return values, tracing |
| 1.3 Loops | ○ HS-ALG-PS-02, ○ HS-PRO-RD-17 | Control structures |
| 1.4 Variables & State | ○ HS-PRO-VD-16 | Builds toward data structures |
| 1.5 Functions | ✓ HS-ALG-PS-02, ✓ HS-PRO-PD-12 | Procedural abstraction; modularity |
| 1.6 Screen Grid | ○ HS-PRO-RD-17 | |
| 1.7 Events & Signals | ✓ HS-PRO-RD-17 | Event-driven flow analysis |
| 1.8 Mini-project | ✓ HS-PRO-TR-19, ✓ HS-PRO-TR-20 | The autograder loop = testing/refining, practiced all year |

### Module 2 — Data Structures
| Lesson | CSTA 2026 | Notes |
|---|---|---|
| 2.1–2.4 Lists/Stacks/Queues/Dicts | ✓ HS-ALG-PS-01, ✓ HS-PRO-VD-16 | Selecting + using appropriate structures |
| 2.5 Trees (scene tree) | ✓ HS-ALG-PS-01, ✓ HS-PRO-RD-17 | Reading a structure they've been using |
| 2.6 Graphs | ✓ HS-ALG-PS-01 | |
| 2.7 Searching & Traversal | ✓ HS-ALG-PS-02, ✓ HS-ALG-PS-03 | Efficiency via test cases |
| 2.8 Mini-project | ✓ HS-ALG-PS-01, ✓ HS-PRO-TR-20 | Written justification of structure choices |

### Module 3 — 2D & 3D Space
| Lesson | CSTA 2026 | Notes |
|---|---|---|
| 3.1–3.6 Vectors → transforms | ○ HS-PRO-VD-16, ○ HS-PRO-RD-17 | Deep CCSS-Math interdisciplinary connections (a CSTA 2026 design feature) |
| 3.7 Skeletons = trees of transforms | ✓ HS-ALG-PS-01 (applied) | GMD specialty on-ramp |
| 3.8 Mini-project | ✓ HS-PRO-TR-19, ✓ HS-PRO-TR-20 | |

### Module 4 — Character Intelligence
| Lesson | CSTA 2026 | Notes |
|---|---|---|
| 4.1 Pac-Man ghosts (1980) | ✓ HS-SOC-HI-38, ○ HS-ALG-PS-04 | Historical trajectory of a computing technology |
| 4.2 State machines | ✓ HS-ALG-PS-01, ○ HS-ALG-PS-02 | |
| 4.3 Decision trees | ✓ HS-ALG-PS-01, ○ HS-ALG-ML-06 | Decision tree as transparent AI algorithm type |
| 4.4 Pathfinding I (BFS) | ✓ HS-ALG-PS-01, ✓ HS-ALG-PS-03 | |
| 4.5 Pathfinding II (A*) | ✓ HS-ALG-PS-02, ✓ HS-ALG-PS-03 | |
| 4.6 Sensing | ○ HS-PRO-PD-12 | |
| 4.7 Personality via parameters | ✓ HS-ALG-PS-04, ✓ HS-ALG-IM-11 | Values embedded in an algorithmic system — tuning IS design |
| 4.8 Mini-project | ✓ HS-PRO-TR-19/20, ○ HS-SOC-HU-44 | "Does it *think*?" debate: human vs. artificial intelligence |

### Module 5 — Motion Intelligence
| Lesson | CSTA 2026 | Notes |
|---|---|---|
| 5.1 From rules to data | ✓ HS-ALG-ML-06, ○ HS-SOC-HU-44 | |
| 5.2 Your body as vectors | ○ HS-DAT-DC-22 | Landmark schema = a data dictionary |
| 5.3 Features | ✓ HS-DAT-DC-23, ○ HS-DAT-DI-25 | |
| 5.4 Classification | ✓ HS-ALG-ML-06, ✓ HS-ALG-ML-08, ○ HS-ALG-PS-04 | |
| 5.5 Data Science I | ✓ HS-ALG-ML-07, ✓ HS-DAT-DC-23, ✓ HS-DAT-DC-24 | Source, quality, representativeness, privacy — on their own data |
| 5.6 Data Science II | ✓ HS-ALG-PS-05, ✓ HS-DAT-IM-27, ✓ HS-ALG-IM-10 | AI outputs, bias, large-scale data collection, LLM bridge |
| 5.7 Motion mini-game | ✓ HS-ALG-ML-08, ✓ S1-AIN-DD-03 | Literally "create an application using a prebuilt supervised learning model" — AIN Specialty I on-ramp |

### Capstone — Ship a Game
| Element | CSTA 2026 | Notes |
|---|---|---|
| Design doc + human-centered design | ✓ HS-ALG-IM-09 | Design a computing technology using HCD principles |
| Build sprints | ✓ HS-PRO-PD-12, ✓ HS-PRO-PD-13 | Libraries/APIs = Zinara primitives + docs |
| Attribution & opt-in publish | ✓ HS-PRO-PD-14 | IP attribution; students keep their IP |
| Playtest & iterate | ✓ HS-PRO-TR-19, ✓ HS-PRO-TR-20, ✓ HS-ALG-PS-03 | Real user feedback loop |
| Team workflow (if teamed) | ✓ HS-PRO-PD-15 | Defined workflow, roles, docs |
| Demo day | ✓ HS-SOC-CE-46, ○ HS-SOC-CE-45 | Connect computing to personal goals |
| Practices | CT6–9, IC3–5, HCD10–12, ESR1–2 | The capstone is where all four practice categories converge |

### Miscellaneous module
| Lesson | CSTA 2026 | Notes |
|---|---|---|
| misc.1 Binary | ○ HS-SYS-HW-30 | MS review; supports HW understanding |
| misc.2 How the internet works | ✓ HS-SYS-NT-34, ✓ HS-SYS-NT-35 | Network of networks |
| misc.3 Version control | ✓ HS-PRO-PD-15, ✓ HS-PRO-PD-13 | Defined workflow + tooling |
| misc.4 Your data, your machine | ✓ HS-SYS-SE-31, ✓ HS-SYS-SE-33, ○ HS-DAT-IM-27 | Security trade-offs + formulate a fix, taught through the platform's own privacy-by-design |
| misc.5 Debugging mindset | ✓ HS-PRO-TR-19/20 | |
| misc.6 Hardware | ✓ HS-SYS-HW-29, ✓ HS-SYS-HW-30, ○ HS-SYS-IM-37 | |
| misc.7 History of computing & games | ✓ HS-SOC-HI-38, ○ HS-SOC-ET-40 | |
| misc.8 Careers | ✓ HS-SOC-CE-45, ✓ HS-SOC-CE-46 | |

## Gaps (deliberate, tracked)
- **HS-PRO-RD-18** (evaluate AI-generated code): not yet in the spine — *recommended addition*: a short activity where students critique Claude/ChatGPT-generated GDScript against requirements. Perfectly on-mission ("understand what's underneath"); candidate for M1.8 or misc.
- **HS-DAT-DC-21** (generate simulated data): not covered; possible M5 extension (simulate motion data, compare with real).
- **HS-DAT-DI-26** (evaluate a visualization/simulation): partial at best in 5.6; strengthen with an explicit visualization-critique step.
- **HS-DAT-IM-28 / HS-SYS-IM-36 / HS-SOC-HI-39** (policy & regulation debates): out of core scope; strong candidates for a misc.9 "Who governs computing?" discussion lesson.
- **HS-SOC-ET-41/42** (emerging tech impacts/design): ○ via 5.6/5.7; could be made explicit in capstone design docs.
- **NYSED pin-pass**: CT/NSD/CY/DL/IC strand mapping needs exact 9–12 numbers from the NYSED band document — the one remaining manual pass.

## Sources & attribution

Standard identifiers and text are quoted from the *2026 CSTA PK–12 Computer
Science Standards* — © 2026 Computer Science Teachers Association, licensed
CC BY-NC-SA 4.0. https://csteachers.org/pk12standards/
Full standards PDF and interactive display available at that address.

NYSED K–12 Computer Science & Digital Fluency Learning Standards:
https://www.nysed.gov/curriculum-instruction/computer-science-and-digital-fluency-learning-standards

This map is a self-declared alignment and does not imply endorsement by
CSTA or NYSED.
