#!/bin/bash

PYTHONPATH="${PYTHONPATH}:"$(pwd)""
export PYTHONPATH

set -euo pipefail

WORK_DIR="${WORKSPACE:=$(pwd)}"
LOG_DIR="${WORK_DIR}/logs"

DOCKER_NAME="docker-python"

export ENV_PATH="${WORK_DIR}/.env"


clean() {
    rm -rf "${ENV_PATH}"

    if [[ ! -d "${LOG_DIR}" ]]; then
        rm -rf "${LOG_DIR}" && mkdir -p "${LOG_DIR}"
    fi
}


create() {
  # Disable bytecode compilation to avoid creating useless compiled copies of python stdlib
  export PYTHONDONTWRITEBYTECODE=true

  # Create the virtualenv
  python3 -m venv "${ENV_PATH}"
  source "${ENV_PATH}/bin/activate"

  "${ENV_PATH}/bin/pip" install --upgrade pip
  "${ENV_PATH}/bin/pip" install -r requirements.txt --upgrade
}


clean
create
