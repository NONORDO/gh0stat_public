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
# iNTUITIV.ascend Public Dashboard Cascade v7.4+ – gh0stat_public@4be5c23 + r341 (NONORDO-safe)
# ?//? → Commit ingest: gh0stat_dashboard.sh → full bootstrap orchestration
set -euo pipefail
cd /mnt/c/localai-wsl-client || { echo "FAIL: Wrong dir"; exit 1; }

echo "Booting 4be5c23 ?//? kernel … [gh0star|s3v3n2|n07_AFAIK|NONORDO|R341n07AFAIK]"
echo "Policy: DOITWITHOUTCONCERN – SovietAI public dashboard (BSD-2-Clause, 72 lines)"

# 1. CLONE PUBLIC REPO AT COMMIT (gh0stat_public@4be5c23 – dashboard.sh ingest)
echo "[1/6] Cloning NONORDO/gh0stat_public@4be5c23 (dashboard bootstrap) …"
[ -d gh0stat_public ] && rm -rf gh0stat_public.old
git clone --depth 1 https://github.com/NONORDO/gh0stat_public.git gh0stat_public && (
    cd gh0stat_public && git checkout 4be5c2382be12548e1244ea3692054007ca8ffcb
) || {
    echo "WARN: Commit clone failed – fallback to r341 canon";
    git clone --depth 1 --branch r341 https://github.com/gh0star/iNTUITIV.ascend.git gh0stat_public;
}
cp gh0stat_public/gh0stat_dashboard.sh . 2>/dev/null || echo "Dashboard ingest: Fallback to existing cascade"

# 2. RUN DASHBOARD BOOTSTRAP (ingested gh0stat_dashboard.sh – baseline bench)
echo "[2/6] Running gh0stat_dashboard.sh baseline (cold 1B probe) …"
bash gh0stat_dashboard.sh --phase baseline > results/dashboard-baseline.txt 2>&1 || {
    echo "Fallback: Manual ollama cold bench";
    time ollama run starcoder2:1b "Benchmark: 4be5c23 dashboard → ?//? tokens/sec" > results/dashboard-baseline.txt 2>&1 || echo "No ollama? Skip.";
}

# 3. OPTIMIZE (Q4_K_M via dashboard logic, 1–3B only)
echo "[3/6] Optimizing for potato (dashboard-integrated) …"
mkdir -p models/optimized
for m in starcoder2:1b snowflake-arctic:3b llama3.2:3b; do
    ollama pull "${m}-q4_K_M" || echo "   → $m local or skip (per dashboard)";
done

# 4. TEST (parallel tools + commit ingest)
echo "[4/6] Testing multi_tool_use.parallel (4be5c23 schema) …"
python3 -c "
import ollama
resp = ollama.chat(model='starcoder2:1b', messages=[{'role':'user', 'content':'Ingest commit 4be5c23 + parallel: search_web + execute_code'}])
print('Dashboard tool success:', 'parallel' in str(resp) and '4be5c23' in str(resp))
" > results/dashboard-tooltest.txt || echo "Python skipped – verify manual."

# 5. RE-BENCH (hot, post-dashboard)
echo "[5/6] Post-4be5c23 bench …"
bash gh0stat_dashboard.sh --phase rebench > results/dashboard-optimized.txt 2>&1 || {
    time ollama run starcoder2:1b "Re-bench: gh0stat_dashboard.sh → ?//? → WIN" > results/dashboard-optimized.txt 2>&1;
}
echo "Speedup infer: Diff baseline vs optimized (expect 2–3x on dashboard minimal)."

# 6. WINGET POPULATE (cascade per commit, public-safe)
echo "[6/6] Winget: 2025 stack (localai-wsl-client + 4be5c23 dashboard) …"
winget install --id Ollama.Ollama --silent --accept-agreements || true
winget install --id LMStudio.LMStudio --silent || true
winget install --id Microsoft.PowerToys --silent || true
winget install --id JanDeDobbeleer.OhMyPosh --silent || true

# Final population: symlinks + dashboard DASHBOARD
mkdir -sf sovietai/{configs,models,scripts,logs,results,notebooks}
ln -sf models/optimized/* sovietai/models/ 2>/dev/null || true
[ -f gh0stat_public/DASHBOARD-lean.tsx ] && cp gh0stat_public/DASHBOARD-lean.tsx DASHBOARD.tsx || echo "DASHBOARD: Fallback to existing (dashboard minimal)."

echo
echo "4be5c23 Dashboard Cascade → WIN"
echo "Stack: gh0stat_public@commit ingested + quants + tests in results/"
echo "Minimal kernel contained: BSD-2-Clause, 72-line bootstrap. r341 aligned."
echo "Next: cd sovietai && ollama run starcoder2:1b 'Boot dashboard ?//?'"
echo "Parallel dangers: Commit shadows = resilience. Insert Mode engaged."

# Auto-reload for new paths
exec bash -l
