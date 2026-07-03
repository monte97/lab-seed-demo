# lab-seed-demo

Pacchetti esercizio per il **seeding** dei laboratori k3k del progetto
moodle-k3k-lab (vedi `docs/future/2026-06-02-seeding-lab-da-git-design.md`).

vcluster-api scarica una cartella di questo repo, la impacchetta e fa girare
`setup.sh` in un Job **dentro** il vcluster dello studente, a boot. Cosi' il lab
nasce gia' inizializzato.

## Convenzione di layout di un pacchetto

Ogni cartella e' un pacchetto esercizio:

- `setup.sh` -- **entrypoint obbligatorio**. Eseguito una volta, a boot. File del
  pacchetto in `/workspace`. `exit 0` = init ok. L'ambiente dipende dal tipo di lab:
  - **k8s** (`lab_env=k8s`): gira in un Job DENTRO il vcluster dello studente,
    con `KUBECONFIG` gia' puntato al vcluster (admin). Applica manifest k8s.
  - **linux** (`lab_env=linux`): gira DENTRO il Pod esercizio (`ubuntu:26.04` di
    default), ambiente Linux puro, NIENTE `KUBECONFIG`. Prepara file/tool/scenario.
- `manifests/` -- YAML applicati da `setup.sh` (opzionale, lab k8s).
- `sizing.yaml` -- `cpu`/`memory` e opzionale `image` del Pod (opzionale).
- `task.md` -- consegna per lo studente (opzionale).

## Esercizi

- [`nginx-demo/`](nginx-demo/) -- (lab k8s) deploya un nginx a 3 repliche (+ Service);
  il lab parte con tutto gia' su.
- [`linux-demo/`](linux-demo/) -- (lab linux) ambiente `ubuntu:26.04` minimale; il
  terminale mostra una consegna demo (crea un file). Base per esercizi Linux.

## Come si aggancia

Nel catalogo del front-door (`LAB_CATALOG_FILE`, JSON `lab_key -> {repo,path,ref}`):

```json
{
  "<lab_key>": {
    "repo": "https://github.com/monte97/lab-seed-demo",
    "path": "nginx-demo",
    "ref": "main"
  }
}
```
