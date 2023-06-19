#!/bin/bash

credentials=$(aws sts assume-role --role-arn "$SANDBOX_IAM_ROLE" --role-session-name sandbox-session)
{
  echo "SANDBOX_AWS_ACCESS_KEY_ID=$(echo "$credentials" | jq .Credentials.AccessKeyId -r)"
  echo "SANDBOX_AWS_SESSION_TOKEN=$(echo "$credentials" | jq .Credentials.SessionToken -r)"
  echo "SANDBOX_AWS_SECRET_ACCESS_KEY=$(echo "$credentials" | jq .Credentials.SecretAccessKey -r)"
} >> "$GITHUB_OUTPUT"