# Standards Alignment Map

**Frameworks targeted:**
- **2026 CSTA PK–12 Computer Science Standards** (published July 2026) — high school foundational band (`HS-*`), plus on-ramp to the **Game Development (GMD)** and **Artificial Intelligence (AIN)** high-school specialty areas
- **NYSED K–12 Computer Science & Digital Fluency Learning Standards** — 9–12 band

> **Alignment status & honesty note.** This map is a self-declared alignment ("designed to address"), not a CSTA-validated crosswalk or endorsement. CSTA 2026 identifiers follow `HS-<CONCEPT>-<SUBCONCEPT>-<##>`. Where an exact standard number has been verified against the published PDF it is listed in full; where the row is mapped at the **subconcept** level (e.g., `HS-PRO-TR`), pin the exact number using CSTA's interactive display (csteachers.org/pk12standards/view) — marked **[pin #]**. NYSED rows are mapped at strand level (CT, NSD, CY, DL, IC) — **[pin #]** likewise.

## CSTA 2026 concept coverage at a glance

| CSTA Concept | Where this curriculum hits it |
|---|---|
| **Algorithms & Design (ALG)** | Everywhere — the "Decision of the Day" device *is* this concept. M1 (algorithmic problem solving), M2 (data-structure selection), M4 (rule-based approaches), M5 (data-driven approaches, ML) |
| **Programming (PRO)** | M1–M4 coding lessons: program development, variables & data storage, reading/modifying starter code, testing & refining via the autograder loop |
| **Data & Analysis (DAT)** | M5: collection, labeling, cleaning, investigation, impacts — using students' own motion data |
| **Systems & Security (SYS)** | **Primary home: Miscellaneous module** (hardware/software, networks, security & privacy-by-design) |
| **Computing & Society (SOC)** | Mission framing throughout; Misc lessons on history of computing/games and careers; M4.1 & M5.6 (humans & computing, AI relationship) |

## Verified CSTA 2026 anchors (exact IDs from the published standards)

These high-school Algorithms & Design standards are quoted-by-ID from the 2026 publication and anchor the modules shown:

| CSTA ID | Standard (gist) | Lessons |
|---|---|---|
| HS-ALG-PS-01 | Design an algorithm using appropriate data structures | M2 throughout; 2.8 capstone |
| HS-ALG-PS-02 | Optimize algorithm design w/ procedural abstraction & control structures | 1.5, 2.7, 4.4–4.5 |
| HS-ALG-PS-03 | Evaluate algorithms for efficiency, correctness, clarity via metrics/test cases | 2.7, 4.5; the autograder habit itself |
| HS-ALG-PS-04 | Deterministic vs. probabilistic algorithms | 4.7 (personality via parameters), 5.4 |
| HS-ALG-PS-05 | Evaluate AI-generated output for bias, accuracy, harms | 5.6 |
| HS-ALG-ML-06 | Justify selection of an AI algorithm type for a task | 5.1, 5.4 |
| HS-ALG-ML-07 | Evaluate training data: source, quality, representativeness, bias, privacy | 5.5 |
| HS-ALG-ML-08 | Develop a machine learning model for a chosen task w/ appropriate data & tools | 5.4–5.7 |

## Lesson-by-lesson map

Legend: CSTA subconcepts — ALG-PS (Algorithmic Problem Solving), ALG-ML (Machine Learning), ALG-IM (Impacts), PRO-PD (Program Development), PRO-VD (Variables & Data Storage), PRO-RD (Reading & Documenting), PRO-TR (Testing & Refining), DAT-DC (Collection & Prep), DAT-DI (Investigation), DAT-IM (Impacts), SYS-HW/SE/NT/IM, SOC-HI/ET/HU/CE.

### Module 1 — Basics
| Lesson | CSTA 2026 | NYSED 9–12 |
|---|---|---|
| 1.1 Algorithms | HS-ALG-PS [pin #] | CT [pin #] |
| 1.2 If/Else | HS-PRO-PD, HS-ALG-PS [pin #] | CT [pin #] |
| 1.3 Loops | HS-PRO-PD [pin #] | CT [pin #] |
| 1.4 Variables & State | HS-PRO-VD [pin #] | CT [pin #] |
| 1.5 Functions | HS-ALG-PS-02; HS-PRO-PD [pin #] | CT [pin #] |
| 1.6 Screen Grid | HS-PRO-PD [pin #] | CT [pin #] |
| 1.7 Events & Signals | HS-PRO-PD, HS-PRO-RD [pin #] | CT [pin #] |
| 1.8 Mini-project | HS-PRO-PD, HS-PRO-TR [pin #] | CT, DL [pin #] |

### Module 2 — Data Structures
| Lesson | CSTA 2026 | NYSED 9–12 |
|---|---|---|
| 2.1–2.4 Lists/Stacks/Queues/Dicts | HS-ALG-PS-01; HS-PRO-VD [pin #] | CT [pin #] |
| 2.5 Trees (scene tree) | HS-ALG-PS-01; HS-PRO-RD [pin #] | CT [pin #] |
| 2.6 Graphs | HS-ALG-PS-01 | CT [pin #] |
| 2.7 Searching & Traversal | HS-ALG-PS-02, HS-ALG-PS-03 | CT [pin #] |
| 2.8 Mini-project | HS-ALG-PS-01; HS-PRO-PD, HS-PRO-TR [pin #] | CT [pin #] |

### Module 3 — 2D & 3D Space
| Lesson | CSTA 2026 | NYSED 9–12 |
|---|---|---|
| 3.1–3.6 Vectors → transforms | HS-PRO-PD, HS-PRO-VD [pin #] (math interdisciplinary connections are a CSTA design feature — cite CCSS-M vectors where your school requires) | CT [pin #] |
| 3.7 Skeletons = trees of transforms | HS-ALG-PS-01 applied; GMD specialty on-ramp | CT [pin #] |
| 3.8 Mini-project | HS-PRO-PD, HS-PRO-TR [pin #] | CT [pin #] |

### Module 4 — Character Intelligence
| Lesson | CSTA 2026 | NYSED 9–12 |
|---|---|---|
| 4.1 Pac-Man ghosts (1980) | HS-ALG-PS-04; SOC-HI [pin #] | CT, IC [pin #] |
| 4.2 State machines | HS-ALG-PS [pin #] | CT [pin #] |
| 4.3 Decision trees | HS-ALG-PS [pin #] | CT [pin #] |
| 4.4–4.5 Pathfinding I–II | HS-ALG-PS-02, HS-ALG-PS-03 | CT [pin #] |
| 4.6 Sensing | HS-PRO-PD [pin #] | CT [pin #] |
| 4.7 Personality via parameters | HS-ALG-PS-04 | CT [pin #] |
| 4.8 Mini-project | HS-PRO-PD, HS-PRO-TR; HS-ALG-PS-03 | CT [pin #] |

### Module 5 — Motion Intelligence
| Lesson | CSTA 2026 | NYSED 9–12 |
|---|---|---|
| 5.1 From rules to data | HS-ALG-ML-06 | CT [pin #] |
| 5.2 Your body as vectors | HS-ALG-ML [pin #]; DAT-DC [pin #] | CT [pin #] |
| 5.3 Features | DAT-DC, DAT-DI [pin #] | CT [pin #] |
| 5.4 Classification | HS-ALG-ML-06, HS-ALG-ML-08; HS-ALG-PS-04 | CT [pin #] |
| 5.5 Data Science I (collect/label/clean) | HS-ALG-ML-07; DAT-DC [pin #] | CT [pin #] |
| 5.6 Data Science II (accuracy/overfit/LLM bridge) | HS-ALG-PS-05; DAT-IM [pin #] | CT, DL [pin #] |
| 5.7 Motion mini-game | HS-ALG-ML-08; GMD + AIN specialty on-ramp | CT [pin #] |

### Capstone — Ship a Game
Practices-heavy by design (CSTA 2026 practice categories): Computational Thinking 6–9 (define, abstract, create, test/refine), Inclusive Collaboration 3–5 (communicate, manage projects, act responsibly), Human-Centered Design 10–12 (involve users — the playtest lesson), Ethics & Social Responsibility 1–2 (opt-in publishing, attribution, respecting players' data). Concept anchors: HS-PRO-PD/TR [pin #]; SOC [pin #]. GMD Specialty I on-ramp.

### Miscellaneous module (optional lessons — also the Systems & Security + Computing & Society patch)
| Lesson | CSTA 2026 | NYSED 9–12 |
|---|---|---|
| misc.1 Binary & how computers count | SYS-HW [pin #] | NSD [pin #] |
| misc.2 How the internet works | SYS-NT [pin #] | NSD [pin #] |
| misc.3 Version control (git) | PRO-PD (collaboration workflows) [pin #] | CT, DL [pin #] |
| misc.4 Your data, your machine (privacy by design — why pose data never leaves the device; CIA triad) | SYS-SE [pin #]; ESR2 practice | CY [pin #] |
| misc.5 The debugging mindset | PRO-TR [pin #] | CT [pin #] |
| misc.6 Hardware: what runs your game | SYS-HW, SYS-IM [pin #] | NSD [pin #] |
| misc.7 History of computing & games | SOC-HI [pin #] | IC [pin #] |
| misc.8 Careers in computing | SOC-CE [pin #] | IC [pin #] |

## Known gaps (tracked deliberately)
- **SYS-NT/SE depth**: misc.2 + misc.4 cover fundamentals; a full networking/cybersecurity treatment is out of scope for this course — noted so nobody claims otherwise.
- **DAT-DI breadth**: data investigations are motion-centric; a general-datasets investigation could strengthen 5.3 or live in misc.
- **Pin-# pass**: replace every [pin #] from the CSTA interactive display and the NYSED 9–12 band document before claiming lesson-level alignment publicly.
