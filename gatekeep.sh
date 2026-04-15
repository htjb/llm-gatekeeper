# LLM usage gatekeeper
opencode() {
    _llm_gatekeeper "opencode" "$@"
}

claude() {
    _llm_gatekeeper "claude" "$@"
}

ollama() {
    _llm_gatekeeper "ollama" "$@"
}

_llm_gatekeeper() {
    local cmd=$1
    shift
    
    # Days of week: 0=Sun, 1=Mon, ..., 6=Sat
    local dow=$(date +%w)  # 0-6, where 1=Monday
    local day_name=$(date +%A)
    
    # BLOCKED DAYS: Example - no LLMs on Mon/Wed/Fri (adjust as needed)
    # Set LLM_BLOCKED_DAYS="1 3 5" in your .bashrc to block Mon/Wed/Fri
    if [[ " ${LLM_BLOCKED_DAYS:-} " =~ " $dow " ]]; then
        echo "🚫 LLM commands are blocked on ${day_name}s."
        return 1
    fi
    
    if [[ " ${LLM_FRICTION_DAYS:-} " =~ " $dow " ]]; then
        echo "⚠️  It's $day_name. Are you sure you need the LLM for this?"
        echo "   Command: $cmd $@"
        read -p "   Run anyway? [y/N] " confirm
        if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
            echo "   Aborted. Try it yourself first!"
            return 1
        fi
    fi
    
    # Pass through to actual command
    command $cmd "$@"
}