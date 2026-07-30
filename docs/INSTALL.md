# Installing Zinara Studio (students, teachers, and IT)

Zinara Studio is a customized Godot editor. It runs locally, requires **no accounts, no server, and no network access** for lessons (videos are watched on YouTube in a browser). It writes only to its own user-data folder.

## macOS
1. Download the latest `.dmg`/`.zip` from the Releases page.
2. Drag Zinara Studio to Applications.
3. First launch: right-click → Open (Gatekeeper prompt appears once for notarized builds).
4. Open a lesson folder (e.g., `modules/m1-basics/m1.l2-if-else/`) → click the **Classroom** tab.

## Windows
Build in progress — track the "Windows build" issue on the repository.

## For IT administrators
- No installer services, no background processes, no elevated privileges required.
- No student PII is collected or stored; progress is local, keyed to anonymous IDs (see `docs/teacher-guide.md` §6).
- Outbound network: only user-initiated YouTube links in the default browser. Safe to run fully offline.
- The application and curriculum are open source for inspection.

## Verify it works (2 minutes)
Open `modules/m1-basics/m1.l0-welcome/`, click **Classroom**, enter a test ID, answer the two questions. If the progress bar reaches 100%, the machine is ready.
