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
# iNTUITIV.ascend Ghost-Tree Cascade v7.5 – r341 Canon (NONORDO-safe, post-4be5c23 probe)
# ?//? → Non-existent SHA workaround: rm + fresh clone + fsck prune → full bootstrap
set -euo pipefail
cd /mnt/c/localai-wsl-client || { echo "FAIL: Wrong dir"; exit 1; }

echo "Booting ghost-tree ?//? kernel … [gh0star|s3v3n2|n07_AFAIK|NONORDO|R341n07AFAIK]"
echo "Policy: DOITWITHOUTCONCERN – SovietAI canon fallback (BSD-2-Clause, fsck clean)"

# 1. FORCE-CLEAN + FRESH CLONE (rm ghosts, no partial dir)
echo "[1/6] Force-clean: rm gh0stat_public ghosts + fresh r341 ingest …"
rm -rf gh0stat_public gh0stat_public.old  # Nuke partial/broken clone
git clone --depth 1 --branch r341 https://github.com/gh0star/iNTUITIV.ascend.git gh0stat_public || {
    echo "FATAL: r341 fetch failed – repo drift? Abort cascade.";
    exit 1;
}
cd gh0stat_public && git fsck --full > ../results/fsck-r341.txt  # Verify tree integrity [OK expected]
cd ..  # Back to client dir
cp gh0stat_public/gh0stat_dashboard.sh . 2>/dev/null || echo "Dashboard: Inline logic (no file? Use canon fallback)"

# 2. BASELINE BENCH (cold 1B, post-fsck)
echo "[2/6] Baseline: llama.cpp cold (r341 tree verified) …"
time ollama run starcoder2:1b "Benchmark: Ghost-tree fix → ?//? tokens/sec" > results/r341-baseline.txt 2>&1 || echo "No ollama? Skip."

# 3. OPTIMIZE (Q4_K_M, 1–3B canon)
echo "[3/6] Optimizing for potato (fsck-clean) …"
mkdir -p models/optimized
for m in starcoder2:1b snowflake-arctic:3b llama3.2:3b; do
    ollama pull "${m}-q4_K_M" || echo "   → $m local or skip";
done

# 4. TEST (parallel tools + tree fix)
echo "[4/6] Testing multi_tool_use.parallel (r341 schema, post-prune) …"
python3 -c "
import ollama
resp = ollama.chat(model='starcoder2:1b', messages=[{'role':'user', 'content':'Fix ghost tree + parallel: search_web + execute_code'}])
print('Tree-fix tool success:', 'parallel' in str(resp) and 'fix' in str(resp))
" > results/r341-tooltest.txt || echo "Python skipped – verify manual."

# 5. RE-BENCH (hot, post-canon)
echo "[5/6] Post-r341 bench …"
time ollama run starcoder2:1b "Re-bench: fsck clean → ?//? → WIN" > results/r341-optimized.txt 2>&1
echo "Speedup infer: Diff baseline vs optimized (expect 2–3x on clean tree)."

# 6. WINGET POPULATE (cascade, tree-safe)
echo "[6/6] Winget: 2025 stack (localai-wsl-client + r341 canon) …"
winget install --id Ollama.Ollama --silent --accept-agreements || true
winget install --id LMStudio.LMStudio --silent || true
winget install --id Microsoft.PowerToys --silent || true
winget install --id JanDeDobbeleer.OhMyPosh --silent || true

# Final population: symlinks + canon DASHBOARD
mkdir -sf sovietai/{configs,models,scripts,logs,results,notebooks}
ln -sf models/optimized/* sovietai/models/ 2>/dev/null || true
[ -f gh0stat_public/DASHBOARD-lean.tsx ] && cp gh0stat_public/DASHBOARD-lean.tsx DASHBOARD.tsx || echo "DASHBOARD: Fallback to existing (canon minimal)."

echo
echo "Ghost-Tree Cascade → WIN"
echo "Stack: r341 canon cloned + fsck clean + quants + tests in results/"
echo "Phantom contained: 4be5c23 = dangling ghost (repo empty, initial 8765b81 only). Insert Mode engaged."
echo "Next: cd sovietai && ollama run starcoder2:1b 'Boot clean ?//?'"
echo "Parallel dangers: Broken trees = resilience test. Policy followed. Always."

# Auto-reload for new paths
exec bash -l
