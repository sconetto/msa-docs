# FrontEnd RH - Cadastro

![Badge](https://img.shields.io/badge/example-ok-brightgreen?style=flat-square)
![Badge](https://img.shields.io/badge/build-failing-red?style=flat-square)
![Badge](https://img.shields.io/badge/tests-ok-brightgreen?style=flat-square)
![Badge](https://img.shields.io/badge/quality-66%25-yellow?style=flat-square)

Aplicação de Front para o sistema de Cadastro de RH. Construído em AngularJS, permite
que o usuário faça uso da API de RH e gerencie os fluxos de trabalho de RH. O Front
de Cadastro apresenta uma interface amigável entre o usuário e o sistema. O Front
ainda apresenta informações das execuções do sistema e dados para que o usuário
seja capaz de averiguar informações comuns de um fluxo de trabalho em RH.

## Dependências

- Angular CLI 8.3.5
- Yarn 1.17.3
- Node.JS 10.16.3

## Configuração

A configuração da Front de Cadastro se dá por meio de variáveis de ambiente do
sistema operacional. Portanto a configuração deverá ser feita nas configurações
de ambiente do _container_.

As configurações disponíveis são:

- `REGISTER_API`: URL da API de Cadastro.

Caso tenha dúvidas de como configurar variáveis de ambiente verifique em:

- [Variáveis de Ambiente - Docker](https://serverascode.com/2014/05/29/environment-variables-with-docker.html)

**OBS**: Lembrando que o sistema foi desenvolvido para execução em ambientes Linux
e Docker. Não há suporte oficial para Windows.

## Desenvolvimento

### Instalando as Dependências

Para instalar as dependências de desenvolvimento certifique-se de que as
dependências chaves do projeto (`nodejs`, `angular-cli` e `yarn`) estão instaladas.
Caso estejam, basta executar o comando abaixo:

```shell
yarn install
```

O **yarn** irá fazer a instalação de todos os pacotes presentes no arquivo `package.json`
e criará uma pasta `node_modules` com os arquivos das dependências.

**OBS**: Caso queira isolar versões do `nodejs` e dependências entre projetos,
visite o site do projeto [NVM](http://nvm.sh), um gerenciador de versões do node.

### Configurando as Variáveis de Ambiente

Para execução em desenvolvimento é preciso configurar as variáveis de ambiente
do projeto. Elas estão no arquivo `environment.ts` localizado em
`<project-path>/src/environments`, e devem ser configuradas da seguinte forma:

```javascript
export const environment = {
  production: false,
  REGISTER_API: "https://0.0.0.0:1234/api"
};
```

Lembrando que a `REGISTER_API` deve ser a URL da API de Cadastro.

### Execução Local

Para execução local do sistema, siga o roteiro abaixo (considerando que as dependências
foram instaladas e as variáveis de ambiente estão devidamente configuradas):

```shell
ng serve
```

Com isso o sistema será executado no _localhost_ e estará disponível no endereço
`http://0.0.0.0:4200/`. Dessa forma é possível testar as novas implementações e
a cada modificação a aplicação vai recarregar as alterações automaticamente.

## Testes

### Executando Testes Unitários

Para execução de testes unitários o sistema utiliza do [Karma](https://karma-runner.github.io/latest/index.html),
caso as dependências já estejam instaladas, basta executar:

```shell
ng test
```

Caso você queira executar apenas uma vez adicione a flag `--watch=false`. Caso
contrário o sistema ficará observando alterações para testá-las.

### Executando Testes Ponta-a-Ponta

Para execução dos testes ponta-a-ponta (_E2E_) o sistema do [Protractor](https://www.protractortest.org/#/),
caso as dependências já estejam instaladas, basta executar:

```shell
ng e2e
```

## Construção

Para fazer a construção do serviço do FrontEnd Register basta seguir o roteiro abaixo:

```shell
docker build -t frint-register:<version> .
```

Definindo a versão em `<version>`. E.g.: `latest`, `stable`, `alpha`, `1.0.0` e etc.

Verifique se foi feito o login no serviço do [docker hub](https://hub.docker.com/),
caso não execute o comando do `docker login`.

```shell
docker push front-register:<version>
```

Por fim, caso a execução do sistema será feita pelo _container_ docker construído
execute:

```shell
docker run -d --name front-register -e .env front-register
```

Caso queira fazer a construção do sistema por meio do Angular CLI para servir via _host_
ao invés de _containers_, use o seguinte comando:

```shell
ng build
```

Os aterfatos da construção serão armazenados na pasta `dist/`. Use a flag `--prod`
para construir uma versão de produção. Para executar basta servir via `nginx` ou
`apache` os artefatos presentes na pasta `dist/`.

**OBS**: Pressupõe que as configurações estão listadas no arquivo `.env`. Para
mais configurações, opções de execução e a documentação complementar acesse [Docker](https://docs.docker.com/)
