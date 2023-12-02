#!/bin/bash

cd "${INPUT_WORKING_DIRECTORY}" || exit
echo "Working in $(pwd)"
echo "Running: cdk ${INPUT_COMMAND} \"${INPUT_STACKS}\""
cdk "${INPUT_COMMAND}" "${INPUT_STACKS}"
