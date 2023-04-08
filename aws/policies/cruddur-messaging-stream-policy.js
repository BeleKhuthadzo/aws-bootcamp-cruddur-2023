{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "dynamodb:PutItem",
                "dynamodb:DeleteItem",
                "dynamodb:Query"
            ],
            "Resource": [
                "arn:aws:dynamodb:us-east-1:546310198960:table/cruddur-messages",
                "arn:aws:dynamodb:us-east-1:546310198960:table/cruddur-messages/index/message-group-sk-index"
            ]
        }
    ]
}