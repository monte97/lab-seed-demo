# Lab demo: nginx a 3 repliche

Il laboratorio parte gia' inizializzato: un Deployment `nginx` nel namespace
`default` con **3 repliche pronte**, esposto da un Service `nginx`.

Verifica lo stato:

```bash
kubectl get deploy,pods,svc -l app=nginx
```

Dovresti vedere `nginx` con `READY 3/3` e tre Pod in `Running`.

Da qui puoi esplorare liberamente: scalare, aggiornare l'immagine, esporre il
Service, romperlo e ripararlo.
