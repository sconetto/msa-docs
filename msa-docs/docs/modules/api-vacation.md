# API RH - Férias

![Badge](https://img.shields.io/badge/example-ok-brightgreen?style=flat-square)
![Badge](https://img.shields.io/badge/build-ok-brightgreen?style=flat-square)
![Badge](https://img.shields.io/badge/tests-ok-brightgreen?style=flat-square)
![Badge](https://img.shields.io/badge/quality-50%25-orange?style=flat-square)

Ainda assim, existem dúvidas a respeito de como a determinação clara de
objetivos acarreta um processo de reformulação e modernização das posturas dos
órgãos dirigentes com relação às suas atribuições. [^1]

## Dependências

- Python 3.7.3
- Flask 1.1.1

## Configuração

A configuração da API de Férias se dá por meio de variáveis de ambiente do
sistema operacional. Portanto a configuração deverá ser feita no _host_ ou
deverá ser passada para o ambiente do _container_.

As configurações disponíveis são:

- `HTTP_PORT`: Número da porta HTTP no qual o serviço será disponibilizado.
- `DATABASE_HOST`: Endereço de rede do servidor do banco de dados.
- `DATABASE_PORT`: Porta no qual o serviço de banco de dados está disponível.
- `DATABASE_NAME`: Nome do _schema_ disponível para o serviço.
- `DATABASE_USER`: Nome do usuário para autenticação no banco de dados.
- `DATABASE_PASSWORD`: Senha do usuário para autenticação no banco de dados.
- `CALENDAR_API_URL`: URL da API que fornece as datas tratadas para agendamentos.

Caso tenha dúvidas de como configurar variáveis de ambiente verifique em:

- [Variáveis de Ambiente - Linux](https://www.digitalocean.com/community/tutorials/how-to-read-and-set-environmental-and-shell-variables-on-a-linux-vps)
- [Variáveis de Ambiente - Docker](https://serverascode.com/2014/05/29/environment-variables-with-docker.html)

**OBS**: Lembrando que o sistema foi desenvolvido para execução em ambientes Linux
e Docker. Não há suporte oficial para Windows.

## Desenvolvimento

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
deseja para o ambiente), neste exemplo usarei o nome **vacation**:

```shell
mkvirtualenv -p $(which python3) vacation
```

Para utilizá-lo:

```shell
workon vacation
sudo python3 -m pip install pipenv
pipenv install # Irá instalar todas as dependências usadas no projeto
```

OBS: Novamente, caso necessário, adicione a _flag_ `--user` para fazer a
instalação do pacote do pipenv.

### Execução Local

Para execução local do sistema, rode o seguinte comando na pasta raíz do projeto
(considerando que a _virtualenv_ já esteja ativa):

```shell
python src/main.py
```

Com isso o sistema será executado no _localhost_ e estará disponível na porta
`HTTP_PORT` configurada para o sistema. Dessa forma é possível testar as novas
implementações.

## Testes

Para executar os testes da API Vacation siga o roteiro abaixo descrito:

1.  Ative a _virtualenv_ **vacation**;
2.  Garanta que as dependências estejam instaladas, principalmente:

        pytest
        pytest-coverage
        flake8

3.  Execute os comandos abaixo:

```shell
export PYTHONPATH=$(pwd)                       # Define path do python
pytest src/                                    # Executa os testes
pytest --cov=vacation src/                     # Executa os testes avaliando a cobertura
pytest --cov=vacation --cov-report xml src/    # Gera o relatório em XML da cobertura
flake8 src/                                    # Roda o linter do PEP8
unset PYTHONPATH                               # Remove a variável PYTHONPATH
```

Durante os testes o terminal apresentará um _output_ com o relatório dos testes
(falhas, _skips_ e sucessos) e a cobertura de testes do sistema. Para outras
configurações e documentação complementar acesse [pytest](https://pytest.org/en/latest/)
e [coverage](https://pytest-cov.readthedocs.io/en/latest/).

Durante o processo de _lint_ o terminal apresentará um relatório com erros e
_warnings_ do guia de estilo do PEP8, para mais configurações e a documentação
complementar acesse [flake8](http://flake8.pycqa.org/en/latest/index.html#quickstart)
e [PEP8](https://www.python.org/dev/peps/pep-0008/)

## Construção

Para fazer a construção do serviço do API Vacation basta seguir o roteiro abaixo:

```shell
docker build -t api-vacation:<version> .
```

Definindo a versão em `<version>`. E.g.: `latest`, `stable`, `alpha`, `1.0.0` e etc.

Verifique se foi feito o login no serviço do [docker hub](https://hub.docker.com/),
caso não execute o comando do `docker login`.

```shell
docker push api-vacation:<version>
```

Por fim, caso a execução do sistema será feita pelo _container_ docker construído
execute:

```shell
docker run -d --name api-vacation -e .env api-vacation
```

**OBS**: Pressupõe que as configurações estão listadas no arquivo `.env`. Para
mais configurações, opções de execução e a documentação complementar acesse [Docker](https://docs.docker.com/)

[^1]: Gerado no Lero Lero
