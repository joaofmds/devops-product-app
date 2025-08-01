# DevOps Product App

## Documentação Técnica

Para detalhes completos de instalação, execução e arquitetura, consulte:

- [`docs/project/DEVELOPMENT_ENV.md`](docs/project/DEVELOPMENT_ENV.md) — **Ambiente de desenvolvimento**
- [`docs/project/PRODUCTION_ENV.md`](docs/project/PRODUCTION_ENV.md) — **Ambiente de Produção**

---

## Instruções Gerais

- Este repositório contém **todos os manifests Kubernetes**, scripts de build/deploy e Dockerfiles do sistema.
- Para rodar o projeto localmente, **recomendo iniciar pela documentação de desenvolvimento**, e logo em seguida ir para o **documentação de produção** onde todas as etapas de configuração (pré-requisitos, Minikube, Ingress, build das imagens, `/etc/hosts`, troubleshooting, etc) estão detalhadas e testadas.
- Se necessário, os avaliadores podem acessar diretamente os endpoints (frontend e backend) após a subida do ambiente local com Minikube, usando o domínio `local.devops` (ver instruções na documentação).

