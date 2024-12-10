curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer <MyAccessToken>" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/user/repos \
  -d '{"name":"curl-repo","description":"This is your first curl repo!","homepage":"https://github.com","private":false,"is_template":true}'
