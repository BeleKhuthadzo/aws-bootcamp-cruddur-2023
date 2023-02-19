# Week 0 — Billing and Architecture
## Required Homework Tasks
## Cruddur-2023 Logical Architecture Design and Lucid Chart Share Link

### Install AWS CLI
### Step 1: AWS CLI installed and updated the AWS CLI on GitPod by following the instructions below:
Install AWS CLI Instructions https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

### Updated my gitpod.yml to include the following task.
Below is the command used:
```
tasks:
  - name: aws-cli
    env:
      AWS_CLI_AUTO_PROMPT: on-partial
    init: |
      cd /workspace
      curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
      unzip awscliv2.zip
      sudo ./aws/install
      cd $THEIA_WORKSPACE_ROOT
```

### Step2: Add Environment variables to configure the AWS CLI:
Add enviroment variables instructions: https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html

## Creating a Billing Alarm

## Create an AWS Budget
