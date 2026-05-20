import requests

def noncompliant():
 BITBUCKET_CLIENT_ID = "bcjD7P25UUCRd6dRwT"
 BITBUCKET_CLIENT_SECRET = "7c5PpGr7n1SV9P88bUv4Cb72SffrGOZ9"

 r = requests.get(f"https://{BITBUCKET_CLIENT_ID}:{BITBUCKET_CLIENT_SECRET}@bitbucket.com")
