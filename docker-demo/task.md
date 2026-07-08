# Esercizio demo -- lab Docker

Benvenuto/a nel tuo ambiente Docker isolato (dockerd **rootless**), gia' caldo:
le immagini base sono gia' state scaricate a boot.

## Task 1 -- avvia un container

Avvia nginx e verifica che risponda:

    docker run -d --name web -p 8080:80 nginx:alpine
    curl -s localhost:8080 | head -5

## Task 2 -- builda una tua immagine

Nella cartella dell'esercizio c'e' un `Dockerfile`. Costruiscilo ed eseguilo:

    cd ~/esercizio
    docker build -t mia-immagine .
    docker run --rm mia-immagine

## Note

- Il daemon e' **rootless**: build che richiedono step privilegiati non funzionano.
- Le immagini base (`alpine:3.20`, `nginx:alpine`) sono gia' presenti: verifica con
  `docker images`.
