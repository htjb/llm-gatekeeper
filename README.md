# LLM Gatekeeper

Adding friction to the command line to make you think again about whether you should be turning to `ollama`, `claude` or `opencode`.

Fend off skill atrophy and over reliance on LLMs by blocking the commands on specific days and adding friction on others.

Add the contents of gatekeep.sh to your `.zshrc` and `.bashrc` then source it or alternatively save it somewhere on your computer and just source it in `.zshrc` or `.bashrc`.

You can set your preferences with something like 

```bash
# Block entirely on certain days (e.g., Mon/Wed for deep work)
export LLM_BLOCKED_DAYS="1 3"

# Add friction (confirmation) on other days
export LLM_FRICTION_DAYS="2 4 5"  # Tue/Thu/Fri
```

where days of the week start on Sunday with 0.