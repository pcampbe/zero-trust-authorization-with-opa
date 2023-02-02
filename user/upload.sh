source ../.init

aws s3 cp patients.csv s3://$DATA_BUCKET/patients.csv
aws s3 cp patients.csv s3://$DATA_BUCKET/FedRAMP/DOD/patients.csv
