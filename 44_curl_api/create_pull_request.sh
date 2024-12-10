curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer <My-access-token>" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/Albert166/Postman-repo/pulls \
  -d '{"title":"Amazing new feature","body":"Please pull these awesome changes in!","head":"octocat:new-feature","base":"master"}'
