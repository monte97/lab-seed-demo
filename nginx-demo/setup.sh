#!/usr/bin/env bash
# setup.sh -- entrypoint di init del lab.
#
# Contratto (vedi moodle-k3k-lab, docs/future/2026-06-02-seeding-lab-da-git-design.md):
#   - eseguito UNA volta, a boot, in un Job DENTRO il vcluster dello studente;
#   - i file del pacchetto sono in /workspace (questo script in /workspace/setup.sh);
#   - KUBECONFIG punta gia' all'API server del vcluster (admin sul proprio vcluster);
#   - exit 0 = init ok; exit != 0 = init fallito.
set -euo pipefail

cd "$(dirname "$0")"

echo "[setup] deploy di nginx (3 repliche) nel namespace default..."
kubectl apply -f manifests/

echo "[setup] attendo che il rollout sia pronto..."
kubectl -n default rollout status deployment/nginx --timeout=120s

echo "[setup] fatto: nginx e' su con 3 repliche pronte."
