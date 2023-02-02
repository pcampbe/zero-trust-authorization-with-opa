source ../.init

VERSION=$1
echo "Updating Lambda with version $VERSION"

aws cloudformation deploy \
  --template-file lambda-cf-template.yaml \
  --stack-name s3-authz-demo \
  --capabilities "CAPABILITY_IAM" \
  --region us-east-1 \
  --parameter-overrides ObjectLambdaAccessPointName=$OBJECT_LAMBDA_AP \
                        SupportingAccessPointName=$OBJECT_LAMBDA_SUPPORTING_AP \
                        S3BucketName=bucket-marlinspike-zero-trust \
                        LambdaFunctionS3BucketName=$DEPLOYMENT_BUCKET \
                        LambdaFunctionS3Key=s3authorizer-1.0.jar \
                        LambdaFunctionRuntime=java11 \
                        LambdaFunctionS3ObjectVersion=$VERSION \
                        CreateNewSupportingAccessPoint=false \
                        OPAUrl=$OPA_URL