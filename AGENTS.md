# Frontend completion workflow

Read and follow `../invoiceninja/AGENTS.md` for the shared Invoice Ninja build,
copy, and verification instructions. After frontend changes, compile macOS,
Flutter web (including FOSS), and React web, and copy both web builds into the
backend using that workflow unless the user explicitly narrows the scope.

Use the Flutter version in `.flutter-version`. Run Flutter build/codegen/test
commands sequentially: `build_web.sh` temporarily swaps FOSS sources and
dependencies. Preserve unrelated worktree changes.
