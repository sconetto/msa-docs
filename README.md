# MSA Docs

Sistema de documentação para o artigo _Microservices Documentation Proposal_.

## Dependências

- [Markdown](https://www.markdownguide.org)
- [MkDocs](https://www.mkdocs.org)
- [Pipenv](https://github.com/pypa/pipenv)
- [Markdown Linter](https://github.com/markdownlint/markdownlint)

## Configuração

### Instalando o VirtualEnvWrapper

Recomendados a utilização de um ambiente virtual criado pelo módulo
virtualenvwrapper. Existe um sítio virtual com instruções em inglês para a
instalação que pode ser acessado
[aqui](https://virtualenvwrapper.readthedocs.io/en/latest/install.html).
Mas você pode também seguir o roteiro abaixo para a instalação do ambiente:

```shell
sudo python3 -m pip install -U pip             # Faz a atualização do pip
sudo python3 -m pip install virtualenvwrapper  # Instala o módulo virtualenvwrapper
```

**OBS**: Caso não tenha acesso de administrador na máquina remova o sudo do
início do comando e adicione a _flag_ `--user` ao final do comando.

Agora configure o seu _shell_ para utilizar o **virtualenvwrapper**, adicionando essas
duas linhas ao arquivo de inicialização do seu _shell_ (`.bashrc`, `.profile`, etc.)

```shell
export WORKON_HOME=\$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
```

Caso queira adicionar um local específico de projeto basta adicionar uma
terceira linha com o seguinte _export_:

```shell
export PROJECT_HOME=/path/to/project
```

Execute o arquivo de inicialização do _shell_ para que as mudanças surtam
efeito, por exemplo:

```shell
source ~/.bashrc
```

Agora crie um ambiente virtual com o seguinte comando (colocando o nome que
deseja para o ambiente), neste exemplo usarei o nome **docs**:

```shell
mkvirtualenv docs
```

Para utilizá-lo:

```shell
workon docs
sudo python3 -m pip install pipenv
pipenv install # Irá instalar todas as dependências usadas no projeto
```

OBS: Novamente, caso necessário, adicione a _flag_ `--user` para fazer a
instalação do pacote do pipenv.

### Iniciando o servidor MkDocs

Agora basta executar o comando abaixo para rodar o servidor do _MkDocs_
localmente:

```shell
cd msa-docs/
mkdocs serve
```

Acesse em um navegador o endereço http://127.0.0.1:8000 e seu servidor local do
MkDocs deve estar funcionando com _live reloading_ para que você verifique as
modificações durante o desenvolvimento.
