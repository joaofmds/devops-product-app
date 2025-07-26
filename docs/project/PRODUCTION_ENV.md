# Ambiente de Desenvolvimento – Documentação


## 1. Instale os Pré-requisitos

* **Docker:** [https://docs.docker.com/get-docker/](https://docs.docker.com/get-docker/)
* **kubectl:** [https://kubernetes.io/docs/tasks/tools/](https://kubernetes.io/docs/tasks/tools/)
* **Minikube:** [https://minikube.sigs.k8s.io/docs/start/](https://minikube.sigs.k8s.io/docs/start/)

> **Dica rápida Minikube (Linux):**
>
> ```sh
> curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
> sudo install minikube-linux-amd64 /usr/local/bin/minikube
> ```

---

## 2. Suba o Cluster Minikube

```sh
minikube start --cpus 4 --memory 6g --driver=docker
```

---

## 3. Instale o Ingress Controller (NGINX)

```sh
minikube addons enable ingress
```

* **Verifique:**

  ```sh
  kubectl get pods -n ingress-nginx
  ```

---

## 4. Redirecione o Domínio Local (`/etc/hosts`)

* Descubra o IP do seu Minikube:

  ```sh
  minikube ip
  # Exemplo de saída: 192.168.49.2
  ```
* Adicione ao `/etc/hosts` (como root/sudo):

  ```sh
  sudo nano /etc/hosts
  ```

  Adicione esta linha:

  ```
  192.168.49.2  local.devops
  ```

---

## 5. Build, Push e Deploy das Imagens

**(Faça login no Docker Hub antes de buildar, se estiver pushando para o Docker Hub):**

```sh
docker login
```

#### Build/Deploy Backend

```sh
./scripts/deploy_backend.sh
```

#### Build/Deploy Frontend

```sh
./scripts/deploy_frontend.sh
```

---

## 7. Suba os Recursos do Kubernetes

#### Namespace

```sh
kubectl apply -f k8s/_base/namespace.yml
```

#### Banco de Dados (PostgreSQL)

```sh
kubectl apply -f k8s/database/pvc.yml
kubectl apply -f k8s/database/secret.yml
kubectl apply -f k8s/database/service.yml
kubectl apply -f k8s/database/statefulset.yml
```

#### Backend

```sh
kubectl apply -f k8s/backend/pvc.yml
kubectl apply -f k8s/backend/configmap.yml
kubectl apply -f k8s/backend/secret.yml
kubectl apply -f k8s/backend/service.yml
kubectl apply -f k8s/backend/deployment.yml
kubectl apply -f k8s/backend/hpa.yml
kubectl apply -f k8s/backend/cronjob.yml
```

#### Frontend

```sh
kubectl apply -f k8s/frontend/pvc.yml
kubectl apply -f k8s/frontend/configmap.yml
kubectl apply -f k8s/frontend/service.yml
kubectl apply -f k8s/frontend/deployment.yml
```

#### Ingress

```sh
kubectl apply -f k8s/_base/ingress.yml
```

---

## 8. Aguarde Pods ficarem Prontos

```sh
kubectl get pods -n devops
kubectl get pods -n ingress-nginx
```

Todos os pods devem estar com STATUS `Running`.

---

## 9. Teste o Sistema no Navegador

* Acesse: [http://local.devops](http://local.devops)
* O **frontend** deve abrir na raiz.
* O **backend** responde a partir de `/api` (ex: [http://local.devops/api/products](http://local.devops/api/products)).

---

## 10. Dicas, Troubleshooting & Comandos Úteis

* **Ver logs:**

  ```sh
  kubectl logs -l app=backend -n devops
  kubectl logs -l app=frontend -n devops
  kubectl logs -l app=postgres -n devops
  ```
* **Testar API via curl:**

  ```sh
  curl http://local.devops/api/products
  ```
* **Ver eventos do ingress:**

  ```sh
  kubectl describe ingress main-ingress -n devops
  ```
* **Se algum pod estiver em CrashLoopBackOff:**

  ```sh
  kubectl describe pod <nome-do-pod> -n devops
  kubectl logs <nome-do-pod> -n devops
  ```
* **Port-forward temporário (para acessar banco, backend, etc):**

  ```sh
  kubectl port-forward svc/backend 8081:8081 -n devops
  kubectl port-forward svc/postgres 5432:5432 -n devops
  ```
