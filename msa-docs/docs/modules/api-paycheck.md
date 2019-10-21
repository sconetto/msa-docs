# HR System - Paycheck API

![Badge](https://img.shields.io/badge/example-ok-brightgreen?style=flat-square)
![Badge](https://img.shields.io/badge/build-failing-red?style=flat-square)
![Badge](https://img.shields.io/badge/tests-warning-yellow?style=flat-square)
![Badge](https://img.shields.io/badge/quality-20%25-red?style=flat-square)

The Payments API is responsible for querying and processing employee pay data in the context of the organization's people management.
The API was created out of the human resources system's need, but it was designed to allow access to query services by other systems and services that require employee payroll information.

## Dependencies

- Python 3.7.3
- Flask 1.1.1

## Configuration

The Paycheck API configuration is through operating system environment variables. Therefore the configuration must be done on the host or must be passed to the container environment.

The available settings are:

- `HTTP_PORT`: HTTP port number on which the service will be available.
- `DECIMAL_PLACES`: Number of decimal places to display calculations.
- `PAYCHECK_CURRENCY`: Which are the currency for the payment amounts. Available `BRL (R$)` and `USD (US$)`.

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

Now create a virtual environment with the following command (entering the name you want for the environment), in this example I will use the name **paycheck**:

```shell
mkvirtualenv -p $(which python3) paycheck
```

To use it:

```shell
workon paycheck
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

To run the Paycheck API tests follow the script below:

1.  Enable _virtualenv_ **paycheck**;
2.  Ensure that the dependencies are installed, especially:

        pytest
        pytest-coverage
        flake8

3.  Run the commands below:

```shell
export PYTHONPATH=$(pwd)                       # Set the python path as the project folder
pytest src/                                    # Performs the tests
pytest --cov=paycheck src/                     # Performs tests evaluating coverage
pytest --cov=paycheck --cov-report xml src/    # Generate the XML report of coverage
flake8 src/                                    # Run PEP8 linter
unset PYTHONPATH                               # Unset PYTHONPATH variable
```

During the tests the terminal will display a output with the test report (failures, skips and successes) and the system test coverage. For other configurations and supplemental documentation go to [pytest](https://pytest.org/en/latest/) and [coverage](https://pytest-cov.readthedocs.io/en/latest/).

During the lint process the terminal will report a bug report and warnings from the PEP8 style guide, for more configurations and additional documentation go to [flake8](http://flake8.pycqa.org/en/latest/index.html#quickstart) and [PEP8](https://www.python.org/dev/peps/pep-0008/)

## Build

To build the API Paycheck service just follow the script below:

```shell
docker build -t api-paycheck:<version> .
```

Setting the version on `<version>`. E.g.: `latest`, `stable`, `alpha`, `1.0.0` and etc.

Make sure you have logged in to the [docker hub](https://hub.docker.com/) service. If you do not, run the `docker login` command.

```shell
docker push api-paycheck:<version>
```

Finally, if the system will be executed by the built container docker, execute:

```shell
docker run -d --name api-paycheck -e .env api-paycheck
```

**Observation**: Assumes that the settings are listed in the `.env` file. For more settings, execution options, and supplemental documentation, go to [Docker](https://docs.docker.com/)
