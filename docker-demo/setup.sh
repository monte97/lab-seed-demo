#!/usr/bin/env bash
# setup.sh -- entrypoint di init del lab DOCKER (lab_env=docker).
#
# Contratto (DIVERSO dal lab k8s di nginx-demo e dal lab linux puro):
# eseguito UNA volta a boot DENTRO il Pod esercizio, DOPO che dockerd rootless
# e' pronto -- l'entrypoint del lab orchestra "avvia dockerd & attendi il socket
# && bash setup.sh". I file del pacchetto sono in /workspace (questo script in
# /workspace/docker-demo/setup.sh). Qui si usano comandi 'docker': pre-scaldiamo
# le immagini base (pull dal registry) cosi' il primo 'docker run' e' immediato.
# exit 0 = init ok.
set -euo pipefail
cd "$(dirname "$0")"

# Pre-warm: le immagini base finiscono nella cache locale di dockerd, cosi' lo
# studente non aspetta il download al primo 'docker run'/'docker build'.
echo "[setup] pre-pull immagini base (dal registry)..."
docker pull alpine:3.20
docker pull nginx:alpine

# Consegna: copiala nella home e mostrala all'apertura del terminale. Usiamo
# $HOME (non /root hardcoded come nel lab linux) perche' il daemon docker e'
# rootless: la shell dello studente gira come utente non-root.
mkdir -p "${HOME}/esercizio"
cp task.md Dockerfile "${HOME}/esercizio/"

# La bash interattiva del ttyd sorgia ~/.bashrc: stampiamo la consegna li'.
grep -q 'esercizio/task.md' "${HOME}/.bashrc" 2>/dev/null || \
  echo "cat ${HOME}/esercizio/task.md" >> "${HOME}/.bashrc"

echo "[setup] ambiente Docker pronto -- immagini base gia' scaricate, consegna in ${HOME}/esercizio/task.md"
