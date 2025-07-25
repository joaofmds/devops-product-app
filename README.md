# Prova Prática Devops Enginner Pleno

Olá!! :)

Leia os próximos tópicos para entender como funcionará a prova.

Após entender a prova, leia o arquivo **START.MD** para inicializar o projeto.

Informações sobre instalação das ferramentas necessárias estão no arquivo **INSTALL.MD**.

O que será avaliado: 
- Qualidade nas configurações realizadas para os ambientes;
- Qualidade da documentação;
- Organização do projeto;
- Boas práticas de versionamento;
- Boas práticas de segurança.

## Sobre o projeto

Você recebeu um projeto com as seguintes tecnologias:

- Backend em Python (FastAPI)
- Frontend em Javascript (VueJS)
- Banco de dados PostgreSQL

Esse é um projeto WEB que possui as seguintes funcionalidades:

- Importação de dados de produtos através de arquivos CSV com o seguinte formato: `name,cost_price,sale_price,quantity`.
- Listagem dos produtos importados
- Remoção dos arquivos de CSV enviados durante a importação (cron)

## Ambiente de desenvolvimento

Foi solicitado para que você faça a configuração de um ambiente de desenvolvimento local, para os desenvolvedores do projeto, utilizando Docker e Docker Compose.

Nessa etapa você precisará:

- Configurar os containers necessários
  - Frontend na porta 8080
  - Backend na porta 8081
  - Banco de dados na porta 5432
- Configurar os Dockerfiles
- Configurar as variáveis de ambiente
- Configurar o armazenamento de dados persistentes
- Configurar um container para funcionamento da cron.py do Backend
- Documentar tudo o que for construído e o passo-a-passo de como executar o projeto
- Versionar todos os scripts utilizados para configuração do ambiente


## Ambiente de produção

Também foi solicitado para que você faça a configuração do ambiente de produção, para os usuários finais do projeto, utilizando Docker e Kubernetes.

Para simular o ambiente de Kubernetes no seu computador, você poderá utilizar o Kind (ler arquivo INSTALL.MD).

Você também precisará criar uma conta (gratuita) na plataforma Docker Hub (ler arquivo INSTALL.MD).

Nessa etapa você precisará:

- Criar um arquivo de pipeline (Python ou Shell) que simule os pipelines do backend e frontend:
  - Fazer o build do Dockerfile
  - Gerar uma tag nova (dica: pegue a tag da última imagem buildada com o comando docker images)
  - Fazer o push da imagem para o Docker Hub público
  - Atualizar a tag da imagem no deployment do Kubernetes (dica: kubectl set image)
- Configurar os deployments:
  - Usar as imagens buildadas nos nos pipelines e enviadas para o Docker Hub
  - Definir a quantidade de recursos de CPU e Memória (request e limit)
  - Definir o Readiness e Liveness
  - Configurar configmaps e secrets
- Configurar os volumes de persistência
- Configurar o HPA dos deployments (mínimo 3 e máximo 6 pods):
- Configurar a Cronjob que irá executar a rotina de exclusão dos arquivos CSV (a cada 5 minutos)
- Configurar os services e exponha as portas:
  - Frontend na porta 8080
  - Backend na porta 8081
  - Database na porta 5432
- A configuração do script init_db.sql via volume é opcional, você pode executar o script diretamente no banco de dados depois que o mesmo estiver funcional
- Para acessar as URLs dos containers você poderá fazer via comando: `kubectl port-forward`
- Documentar tudo o que for construído e o passo-a-passo de como executar o projeto
- Versionar todos os scripts utilizados para configuração do ambiente

## Recomendações

- Sugerimos a utilização do Sistema Operacional Linux ou Windows com o WSL (Windows Subsystem for Linux) instalado.
- Aplique boas práticas na criação dos Dockerfiles do projeto, por exemplo: multistage build, redução do tamanho da imagem, dockerignore, etc.
- Aplique boas práticas na criação dos arquivos YAML para o Kubernetes
