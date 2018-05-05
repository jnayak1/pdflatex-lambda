from __future__ import print_function

import boto3
import os
import uuid
import subprocess


s3 = boto3.client('s3')

def lambda_handler(event, context):
    
    bucket = event['Records'][0]['s3']['bucket']['name']
    key = event['Records'][0]['s3']['object']['key']
    download_path = '/tmp/{}{}'.format(uuid.uuid4(), key)
    s3.download_file(bucket, key, download_path)

    bashCommand = "./tlsb-gui-installer/bin/x86_64-linux/pdflatex " + download_path
    process = subprocess.Popen(bashCommand.split(), stdout=subprocess.PIPE)
    output, error = process.communicate()


if __name__ == "__main__":
  event = {  
   "Records":[  
      {  
        "eventVersion":"2.0",
        "eventSource":"aws:s3",
        "awsRegion":"us-west-2",
        "eventTime":"1970-01-01T00:00:00.000Z",
        "eventName":"ObjectCreated:Put",
        "userIdentity":{  
          "principalId":"AIDAJDPLRKLG7UEXAMPLE"
        },
        "requestParameters":{  
          "sourceIPAddress":"127.0.0.1"
        },
        "responseElements":{  
          "x-amz-request-id":"C3D13FE58DE4C810",
          "x-amz-id-2":"FMyUVURIY8/IgAtTv8xRjskZQpcIZ9KG4V5Wp6S7S/JRWeUWerMUE5JgHvANOjpD"
        },
        "s3":{  
          "s3SchemaVersion":"1.0",
          "configurationId":"testConfigRule",
          "bucket":{  
            "name": "latex-lambda",
            "ownerIdentity":{  
              "principalId":"A3NL1KOZZKExample"
            },
            "arn": ""
          },
          "object":{  
            "key":"simple.tex",
            "size":1024,
            "eTag":"d41d8cd98f00b204e9800998ecf8427e",
            "versionId":"096fKKXTRTtl3on89fVO.nfljtsv6qko"
          }
        }
      }
    ]
  }
  context = None
  lambda_handler(event, context)