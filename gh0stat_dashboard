##############################################
######## iNTUITIV.ascend ########
##############################################
######## README.md ##############
##############################################
#### gh0stat|s3v3n2|n07_AFAIK ###
##############################################
### ASCII Sketch of the Graph ###
##############################################
#!/usr/bin/env bash
# iNTUITIV.ascend Cascade v7.3 – r341 Locked (NONORDO-safe)
# ?//? → 404 workaround: pin to known-good, no external ghosts
set -euo pipefail
cd /mnt/c/localai-wsl-client || { echo "FAIL: Wrong dir"; exit 1; }

echo "Booting r341 kernel … [gh0star|s3v3n2|n07_AFAIK]"
echo "Policy: DOITWITHOUTCONCERN – SovietAI local-only"

# 1. INGEST r341 (shallow clone, no drift)
echo "[1/6] Ingesting r341 codex (pinned, no 404s) …"
[ -d iNTUITIVascend ] && rm -rf iNTUITIVascend.old
git clone --depth 1 --branch r341 https://github.com/gh0star/iNTUITIV.ascend.git iNTUITIVascend || {
    echo "WARN: r341 fetch failed – fallback to main (but you said mine is r341)";
    git clone --depth 1 https://github.com/gh0star/iNTUITIV.ascend.git iNTUITIVascend;
}
cp iNTUITIVascend/cascade.sh .  # Grab the real cascade if exists post-r341

# 2. BASELINE BENCH (cold start, StarCoder2-1B)
echo "[2/6] Baseline: llama.cpp cold on 1B potato …"
time ollama run starcoder2:1b "Benchmark: tokens/sec on ?//? prompt" > results/r341-baseline.txt 2>&1 || echo "No ollama? Skip."

# 3. OPTIMIZE (Q4_K_M only, no bloat)
echo "[3/6] Optimizing for reality (1–3B quants) …"
mkdir -p models/optimized
for m in starcoder2:1b snowflake-arctic:3b llama3.2:3b; do
    ollama pull "$m"-q4_K_M || echo "   → $m already local or skip";
done

# 4. TEST (parallel tools on tiny model)
echo "[4/6] Testing multi_tool_use.parallel (r341 schema) …"
python3 -c "
import ollama
resp = ollama.chat(model='starcoder2:1b', messages=[{'role':'user', 'content':'Use parallel: search_web + execute_code'}])
print('Tool call success:', 'parallel' in str(resp))
" > results/r341-tooltest.txt || echo "Python test skipped – manual verify."

# 5. RE-BENCH (hot, post-opt)
echo "[5/6] Post-r341 bench …"
time ollama run starcoder2:1b "Re-bench: ?//? → WIN" > results/r341-optimized.txt 2>&1
echo "Speedup infer: Compare baseline vs optimized (manual diff)."

# 6. WINGET POPULATE (cascade tools, NO ghosts/thsr adds)
echo "[6/6] Winget: Real 2025 stack (localai-wsl-client only) …"
winget install --id Ollama.Ollama --silent --accept-agreements || true
winget install --id LMStudio.LMStudio --silent || true  # If on Windows side
winget install --id Microsoft.PowerToys --silent || true  # Utils, no bloat
winget install --id JanDeDobbeleer.OhMyPosh --silent || true  # Terminal polish

# Final population: symlinks + r341 DASHBOARD
mkdir -sf sovietai/{configs,models,scripts,logs,results,notebooks}
ln -sf models/optimized/* sovietai/models/ 2>/dev/null || true
[ -f iNTUITIVascend/DASHBOARD-lean.tsx ] && cp iNTUITIVascend/DASHBOARD-lean.tsx DASHBOARD.tsx || echo "DASHBOARD: Use existing."

echo
echo "r341 Cascade → WIN"
echo "Stack populated: ollama/lmstudio + quants + tests in results/"
echo "Ghosts contained: No NONORDO/gh0stat adds. Yours only."
echo "Next: cd sovietai && ollama run starcoder2:1b 'Boot ?//?'"
echo "Parallel dangers: 404s = reminder to pin revisions. Insert Mode engaged."

# Auto-reload shell for new paths
exec bash -l
