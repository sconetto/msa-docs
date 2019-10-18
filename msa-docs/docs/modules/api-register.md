# HR System - Register API

![Badge](https://img.shields.io/badge/example-ok-brightgreen?style=flat-square)
![Badge](https://img.shields.io/badge/build-ok-brightgreen?style=flat-square)
![Badge](https://img.shields.io/badge/tests-failing-red?style=flat-square)
![Badge](https://img.shields.io/badge/quality-70%25-yellow?style=flat-square)

The Register API is responsible for retrieving and maintaining data regarding the registration of employees in the context of HR management of the organization. The API was created out of HR system necessity, but it was designed for being used by other systems and services that require employee data.

## Dependencies

- Python 3.7.3
- Flask 1.1.1

## Configuration

You should set environment variables up in the operational system in order to
prepare the API for use. Therefore the configuration must be done in the _host_
OS or should be passed to the _container_ environment.

The available settings are:

- `HTTP_PORT`: HTTP port number on which the service will be available.
- `DATABASE_HOST`: Database server network address.
- `DATABASE_PORT`: Port on which database service is available.
- `DATABASE_NAME`: Schema name available for the service.
- `DATABASE_USER`: Username for database authentication.
- `DATABASE_PASSWORD`: User password for database authentication.

If you have questions about how to set environment variables check these links:

- [Environment Variables - Linux](https://www.digitalocean.com/community/tutorials/how-to-read-and-set-environmental-and-shell-variables-on-a-linux-vps)
- [Environment Variables - Docker](https://serverascode.com/2014/05/29/environment-variables-with-docker.html)

**Observation**: The system was developed to run in Linux and Docker environments. No official support for Windows.

## Development

### Installing VirtualEnvWrapper

We recommend using a virtual environment created by the __virtualenvwrapper__ module. There is a virtual site with English instructions for installation that can be accessed [here](https://virtualenvwrapper.readthedocs.io/en/latest/install.html). But you can also follow these steps below for installing the environment:

```shell
sudo python3 -m pip install -U pip             # Update pip
sudo python3 -m pip install virtualenvwrapper  # Install virtualenvwrapper module
```

**Observation**: If you do not have administrator access on the machine remove `sudo` from the beginning of the command and add the flag `--user` to the end of the command.

Now configure your shell to use **virtualenvwrapper** by adding these two lines to your shell initialization file (e.g. `.bashrc`,` .profile`, etc.)

```shell
export WORKON_HOME=\$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
```

If you want to add a specific project location (will automatically go to the project folder when the virtual environment is activated) just add a third line with the following `export`:

```shell
export PROJECT_HOME=/path/to/project
```

Run the shell startup file for the changes to take effect, for example:

```shell
source ~/.bashrc
```

Now create a virtual environment with the following command (entering the name you want for the environment), in this example I will use the name **register**:

```shell
mkvirtualenv -p $(which python3) register
```

To use it:

```shell
workon register
sudo python3 -m pip install pipenv
pipenv install # Will install all of the project dependencies
```

**Observaion**: Again, if necessary, add the flag `--user` to make the pipenv package installation for the local user.

### Local Execution

For local system execution, run the following command in the project root folder (assuming _virtualenv_ is already active):

```shell
python src/main.py
```

This will run the system on _localhost_ and will be available on the `HTTP_PORT` port configured for the system. This way you can test new implementations.

## Tests

To run the Register API tests follow the script below:

1.  Enable _virtualenv_ **register**;
2.  Ensure that the dependencies are installed, especially:

        pytest
        pytest-coverage
        flake8

3.  Run the commands below:

```shell
export PYTHONPATH=$(pwd)                       # Set the python path as the project folder
pytest src/                                    # Performs the tests
pytest --cov=register src/                     # Performs tests evaluating coverage
pytest --cov=register --cov-report xml src/    # Generate the XML report of coverage
flake8 src/                                    # Run PEP8 linter
unset PYTHONPATH                               # Unset PYTHONPATH variable
```

During the tests the terminal will display a output with the test report (failures, skips and successes) and the system test coverage. For other configurations and supplemental documentation go to [pytest](https://pytest.org/en/latest/) and [coverage](https://pytest-cov.readthedocs.io/en/latest/).

During the lint process the terminal will report a bug report and warnings from the PEP8 style guide, for more configurations and additional documentation go to [flake8](http://flake8.pycqa.org/en/latest/index.html#quickstart) and [PEP8](https://www.python.org/dev/peps/pep-0008/)

## Build

To build the API Register service just follow the script below:

```shell
docker build -t api-register:<version> .
```

Setting the version on `<version>`. E.g.: `latest`, `stable`, `alpha`, `1.0.0` and etc.

Make sure you have logged in to the [docker hub](https://hub.docker.com/) service. If you do not, run the `docker login` command.

```shell
docker push api-register:<version>
```

Finally, if the system will be executed by the built container docker, execute:

```shell
docker run -d --name api-register -e .env api-register
```

**Observation**: Assumes that the settings are listed in the `.env` file. For more settings, execution options, and supplemental documentation, go to [Docker](https://docs.docker.com/)
