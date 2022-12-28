JIRA_CLIENT_ID=ptdCGemcvkWdznhhagxN28wxExn7GhKJ
# Secret Leak
JIRA_CLIENT_SECRET=RK5MTWci5jRMpvgMMUv8tu8jSk3rL9BLCafQzWxRwdBMtQSNEreqeArAknUnFYgU

curl --request POST \
  --url 'https://auth.atlassian.com/oauth/token' \
  --header 'Content-Type: application/json' \
  --data '{ "client_id": "'"$JIRA_CLIENT_ID"'", "client_secret": "'"$JIRA_CLIENT_SECRET"'" }'