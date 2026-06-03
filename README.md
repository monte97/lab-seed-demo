# lab-seed-demo

Pacchetti esercizio per il **seeding** dei laboratori k3k del progetto
moodle-k3k-lab (vedi `docs/future/2026-06-02-seeding-lab-da-git-design.md`).

vcluster-api scarica una cartella di questo repo, la impacchetta e fa girare
`setup.sh` in un Job **dentro** il vcluster dello studente, a boot. Cosi' il lab
nasce gia' inizializzato.

## Convenzione di layout di un pacchetto

Ogni cartella e' un pacchetto esercizio:

- `setup.sh` -- **entrypoint obbligatorio**. Eseguito una volta, a boot, dentro il
  vcluster. File del pacchetto in `/workspace`; `KUBECONFIG` gia' puntato al
  vcluster (admin sul proprio vcluster). `exit 0` = init ok.
- `manifests/` -- YAML applicati da `setup.sh` (opzionale).
- `task.md` -- consegna per lo studente (opzionale).

## Esercizi

- [`nginx-demo/`](nginx-demo/) -- deploya un nginx a 3 repliche (+ Service); il
  lab parte con tutto gia' su.

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
