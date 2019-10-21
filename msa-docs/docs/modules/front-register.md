# HR System - Register Web

![Badge](https://img.shields.io/badge/example-ok-brightgreen?style=flat-square)
![Badge](https://img.shields.io/badge/build-failing-red?style=flat-square)
![Badge](https://img.shields.io/badge/tests-ok-brightgreen?style=flat-square)
![Badge](https://img.shields.io/badge/quality-66%25-yellow?style=flat-square)

Web application for HR System Register. Built on AngularJS, it allows the user to make use of the HR API and manage HR workflows. Register Web features a user-friendly interface with the system. Register Web also provides information on system executions and data so that the user is able to find common information from an HR workflow.

## Dependencies

- Angular CLI 8.3.5
- Yarn 1.17.3
- Node.JS 10.16.3

## Configuration

Register Web configuration is done through operating system environment variables. Therefore the configuration must be done in the container environment settings.

The available settings are:

- `REGISTER_API`: Register API URL.
- `VACATION_API`: Vacation API URL.
- `PAYCHECK_API`: Paycheck API URL.

If you have questions about how to set environment variables check in:

- [Environment Variables - Docker](https://serverascode.com/2014/05/29/environment-variables-with-docker.html)

**Observation**: Remembering that the system was developed to run in Linux and Docker environments. No official support for Windows.

## Development

### Installing the Dependencies

To install development dependencies make sure that the key project dependencies (`nodejs`,` angular-cli` and `yarn`) are installed. If so, just run the command below:

```shell
yarn install
```

At this point **yarn** will install all packages present in the `package.json` file and create a `node_modules` folder with the dependency files.

**Observation**: If you want to isolate `nodejs` versions and dependencies between projects, visit the [NVM](http://nvm.sh) project website, a node version manager.

### Setting the Environment Variables

For development execution you need to set the environment variables of the project. They are in the `environment.ts` file located at `<project-path>/src/environments`, and should be set as follows:

```javascript
export const environment = {
  production: false,
  REGISTER_API: "https://0.0.0.0:1234/register/api",
  VACATION_API: "https://0.0.0.0:1234/vacation/api",
  PAYCHECK_API: "https://0.0.0.0:1234/paycheck/api",
};
```

Remembering that `REGISTER_API`, `VACATION_API` and `PAYCHECK_API` must be the URL of the APIs deployed.

### Local Deploy

For local system execution, follow the script below (assuming that the dependencies have been installed and the environment variables are properly set):

```shell
ng serve
```

This will run the system on localhost and will be available at the address `http://0.0.0.0:4200/`. This way you can test the new implementations and with each modification the application will reload the changes automatically.

## Tests

### Running Unit Tests

To perform unit tests the system uses [Karma](https://karma-runner.github.io/latest/index.html), if the dependencies are already installed, simply run:

```shell
ng test
```

If you only want to run once add the flag `--watch=false`. Otherwise the system will be watching for changes to test them.

### Running End-to-End Tests

To perform end-to-end (E2E) testing the system uses [Protractor](https://www.protractortest.org/#/), if the dependencies are already installed, simply run:

```shell
ng e2e
```

## Build

To build the Register Web service just follow the script below:

```shell
docker build -t frint-register:<version> .
```

Setting the version on `<version>`. E.g.: `latest`, `stable`, `alpha`, `1.0.0` and etc.

Make sure you have logged in to the [docker hub](https://hub.docker.com/) service, if you do not run the `docker login` command.

```shell
docker push front-register:<version>
```

Finally, if the system will be executed by the built docker container, execute:

```shell
docker run -d --name front-register -e .env front-register
```

If you want to build the system through Angular CLI to serve via host instead of containers, use the following command:

```shell
ng build
```

The build resources will be stored in the `dist/` folder. Use the `--prod` flag to build a production version. To execute simply serve via `nginx` or `apache` the resource present in the `dist/` folder to the web.

**Observation**: Assumes that the settings are listed in the `.env` file. For more settings, execution options, and supplemental documentation, go to [Docker](https://docs.docker.com/)
