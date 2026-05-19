## Gemini Execution Constraints
- Use relative paths only.
- Do NOT access parent directories or absolute paths outside the current working directory.
- Do NOT use enter_plan_mode or any planning-only flow. Stay in execution mode.
- If you need to inspect files, use read-only tools first.
- When editing code, prefer replace or write_file.
- Use run_shell_command only for repo-local commands inside the current working directory.

Available Gemini tools in this environment:
- list_directory
- read_file
- grep_search
- glob
- replace
- write_file
- run_shell_command
- cli_help

If a tool fails, adjust and continue using the available tools in this workspace.