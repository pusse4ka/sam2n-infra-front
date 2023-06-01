#!/bin/bash
credentials=$(aws sts assume-role --role-arn "$SANDBOX_IAM_ROLE" --role-session-name sandbox-session)

#declare
SANDBOX_AWS_ACCESS_KEY_ID=$(echo "$credentials" | jq .AccessKeyId -r)
SANDBOX_AWS_SESSION_TOKEN=$(echo "$credentials" | jq .SessionToken -r)
SANDBOX_AWS_SECRET_ACCESS_KEY=$(echo "$credentials" | jq .SecretAccessKey -r)

#assign
export SANDBOX_AWS_ACCESS_KEY_ID
export SANDBOX_AWS_SESSION_TOKEN
export SANDBOX_AWS_SECRET_ACCESS_KEY
