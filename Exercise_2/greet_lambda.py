import os

def lambda_handler(event, context):
    return "Response: {}".format(os.environ['greeting_msg'])
