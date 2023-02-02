import requests

from client.presign import create_presigned_url
BUCKET_NAME = 'arn:aws:s3:us-east-1:026923064426:accesspoint/ap-zerotrust'
#BUCKET_NAME = 'arn:aws:s3-object-lambda:us-east-1:026923064426:accesspoint/zt-object-lambda'
OBJECT_NAME = 'prefix1/patients.csv'

url = create_presigned_url(BUCKET_NAME, OBJECT_NAME)
if url is not None:
    response = requests.get(url)
    print(response.text)
    print(response.status_code)
    print(response.headers)
