#!/bin/sh

#setting envs
export CAPROVER_URL=$INPUT_SERVER
test $INPUT_PASSWORD && export CAPROVER_PASSWORD=$INPUT_PASSWORD
export CAPROVER_APP=$INPUT_APPNAME
test $INPUT_TAR && export CAPROVER_TAR_FILE=$INPUT_TAR
test $INPUT_IMAGE && export CAPROVER_IMAGE_NAME=$INPUT_IMAGE
test $INPUT_TOKEN && export CAPROVER_APP_TOKEN=$INPUT_TOKEN
test $INPUT_BRANCH && export CAPROVER_BRANCH=$INPUT_BRANCH

caprover deploy

# check if build succeed
if [[ ! -z $INPUT_DEPLOY_CHECK_WAIT_TIME ]]; then
    export CAPROVER_API_PATH="\user\apps\appData\\$INPUT_APPNAME"
    export CAPROVER_API_METHOD="GET"
    export CAPROVER_API_DATA="{}"
    export CAPROVER_API_OUTPUT=true
    for i in {1..$INPUT_DEPLOY_CHECK_WAIT_TIME}
    do
        output=$(caprover api)
        is_app_building=$(echo "$output" | json isAppBuilding)
        is_build_failed=$(echo "$output" | json isBuildFailed)
        
        # app build finished
        if [[ $is_app_building = false && $is_build_failed = false ]]; then
            exit 0
        # app build finished but failed
        elif [[ $is_app_building = false && $is_build_failed = true ]]; then
            echo "Deployment build failed on caprover server"
            exit 1
        fi
        sleep 1
    done
    echo "Deploy check wait time exceeded. Deployment may have failed."
    echo "Increase the deploy check wait time for the next run."
fi