package test

import data.rules as rules

test_us_user_accessing_org1_denied {
  not rules.allow with input as {
    "userIdentity": {
      "arn": "arn:aws:iam::026923064426:user/zt-user",
    },
    "user_request": {
      "url": "https://zt-object-lambda-026923064426.s3-object-lambda.us-east-1.amazonaws.com/prefix2/data1.csv"
    }
  }
  with data.userdata as {
    "arn:aws:iam::026923064426:user/zt-user": {
      "region": "US",
      "security_clearance": 2
    }
  }
}