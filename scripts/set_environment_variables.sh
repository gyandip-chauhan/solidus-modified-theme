#!/bin/bash
function set_parameter {
        SSM_PARAM_NAME=$1
        SSM_VALUE=$(aws ssm get-parameters --with-decryption --names "${SSM_PARAM_NAME}" --query 'Parameters[*].Value' --output text)
        [ "$(eval echo "$""$1")" == "" ] && echo "export ${SSM_PARAM_NAME}=${SSM_VALUE}" >> /etc/environment
}
set_parameter "DB_USER"
set_parameter "DB_PASS"
set_parameter "DB_HOST"
set_parameter "DB_NAME"