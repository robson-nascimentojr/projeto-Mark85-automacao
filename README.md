# Mark85 Robot Express and Cucumber 

Projeto de automação de testes end-to-end para o Mark85, uma aplicação web de gerenciamento de tarefas.

Este repositório foi organizado para validar os principais fluxos de cadastro, login e disponibilidade da aplicação usando Robot Framework, Browser Library, Cucumber e selenium web-driver com apoio direto no banco MongoDB para preparação de massa de testes.

## Créditos e autoria

O produto Mark85, incluindo backend e frontend, é um projeto criado por Fernando Papito, professor de automação e referência na comunidade de QA.

A autoria deste repositório está na automação de testes: os cenários, suítes Robot, Page Objects e apoio de execução foram desenvolvidos pelo autor deste repositório como prática de automação.

Este projeto não reivindica autoria sobre a aplicação Mark85. Ele documenta e executa testes automatizados sobre a aplicação criada pelo Fernando Papito.

## Visão geral

O workspace possui três partes principais:

```text
apps/
  mark85/
    api/                 API REST do Mark85 em Node.js, Express e MongoDB
    web/                 frontend web do Mark85 servido por Express

projects/
  cucumber-mark85/ projeto de automação com Cucumber 
  mark85-robot-express/  projeto de automação com Robot Framework
```

A automação considera a aplicação rodando localmente nestes endereços:

```text
Frontend: http://localhost:3000
Backend:  http://localhost:3333
```

## Tecnologias utilizadas

- Robot Framework
- Cucumber
- Selenium web-driver 
- Browser Library, baseada em Playwright
- Python
- PyMongo
- FakerLibrary
- Node.js
- Express
- MongoDB Atlas

## Estrutura da automação

```text
cucumber-mark85/
  

mark85-robot-express/
  tests/
    online.robot         smoke test para validar se o webapp está online
    signup.robot         cenários de cadastro de usuário
    login.robot          cenários de login

  resources/
    PageObjects/
      cadastro.page.robot
      login.page.robot
    libs/
      database.py        keywords Python para preparar/remover usuários no MongoDB

  results/               relatórios gerados pelo Robot Framework
  logs/                  logs de execuções anteriores
  browser/               evidências e screenshots geradas durante execuções
```

## Cenários cobertos

### Disponibilidade

- Validar que o webapp está online.
- Validar o título da página: `Mark85 by QAx`.

### Cadastro

- Cadastro com sucesso.
- Tentativa de cadastro com usuário duplicado.
- Cadastro com nome vazio.
- Cadastro com e-mail vazio.
- Cadastro com senha vazia.
- Cadastro com todos os campos obrigatórios vazios.

### Login

- Login com sucesso.
- Login com credenciais inválidas.

## Pré-requisitos

Antes de rodar os testes, instale:

- Node.js
- Python 3
- Robot Framework
- Browser Library
- MongoDB Atlas acessível pela aplicação

No PowerShell, se o comando `npm` estiver bloqueado por política de execução, use `npm.cmd`.

## Instalar dependências da API

Na raiz do projeto:

```powershell
cd C:\ProjetoQAmark85\apps\mark85\api
npm.cmd install
```

## Instalar dependências do frontend

```powershell
cd C:\ProjetoQAmark85\apps\mark85\web
npm.cmd install
```

## Preparar ambiente Python da automação

```powershell
cd C:\ProjetoQAmark85\projects\mark85-robot-express
python -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install robotframework robotframework-browser robotframework-faker pymongo
rfbrowser init
```

## Subir a aplicação localmente

Abra um terminal para a API:

```powershell
cd C:\ProjetoQAmark85\apps\mark85\api
npm.cmd start
```

Abra outro terminal para o frontend:

```powershell
cd C:\ProjetoQAmark85\apps\mark85\web
npm.cmd start
```

Com os dois serviços em execução, acesse:

```text
http://localhost:3000
```

## Executar os testes

Dentro da pasta da automação:

```powershell
cd C:\ProjetoQAmark85\projects\mark85-robot-express
robot -d results tests
```

Executar uma suíte específica:

```powershell
robot -d results tests\signup.robot
robot -d results tests\login.robot
robot -d results tests\online.robot
```

Executar por tag:

```powershell
robot -d results -i signup-success tests
robot -d results -i login-success tests
robot -d results -i login-invalid tests
```

## Relatórios

Após a execução, o Robot Framework gera os principais artefatos em `results/`:

```text
results/report.html
results/log.html
results/output.xml
```

Abra `report.html` para uma visão resumida da execução e `log.html` para investigar cada passo dos testes.

## Observações sobre os testes

Os testes usam `headless=False` nos Page Objects, então o navegador Chromium abre visualmente durante a execução.

Para rodar em modo invisível, altere `headless=False` para `headless=True` nos arquivos:

```text
resources/PageObjects/cadastro.page.robot
resources/PageObjects/login.page.robot
```

A lib `resources/libs/database.py` manipula diretamente a collection `users` para limpar ou preparar massa de teste antes dos cenários.

## Cuidados antes de publicar no GitHub

Antes de subir este projeto para um repositório público, revise:

- Não publicar credenciais reais de banco, tokens ou arquivos `.env`.
- Não versionar `node_modules/`.
- Não versionar ambientes virtuais Python, como `.venv/`.
- Não versionar caches, como `__pycache__/`.
- Avaliar se os relatórios em `results/`, `logs/`, `log/` e screenshots em `browser/` devem ficar fora do repositório.

Caso o repositório seja público, o ideal é mover qualquer string de conexão sensível para variáveis de ambiente.

## Licença e uso educacional

Este material tem finalidade educacional e de prática em automação de testes.

A aplicação Mark85 pertence ao projeto original do Fernando Papito. Os testes automatizados deste repositório representam uma implementação própria de validação sobre essa aplicação.
