#!/usr/bin/env bash
# setup.sh -- entrypoint di init del lab LINUX (lab_env=linux).
#
# Contratto (DIVERSO dal lab k8s di nginx-demo): eseguito UNA volta a boot
# DENTRO il Pod esercizio (ubuntu:26.04 di default), non in un vcluster. I file
# del pacchetto sono in /workspace (questo script in /workspace/linux-demo/setup.sh).
# NIENTE KUBECONFIG: e' un ambiente Linux puro, non Kubernetes. exit 0 = init ok.
set -euo pipefail
cd "$(dirname "$0")"

mkdir -p /root/esercizio
cp task.md /root/esercizio/task.md

# Mostra la consegna quando lo studente apre il terminale: la bash interattiva
# del ttyd sorgia /root/.bashrc.
grep -q 'esercizio/task.md' /root/.bashrc 2>/dev/null || \
  echo 'cat /root/esercizio/task.md' >> /root/.bashrc

echo "[setup] ambiente Linux pronto -- consegna in /root/esercizio/task.md"
