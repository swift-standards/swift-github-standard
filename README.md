# swift-github-standard

Use this package when you call the GitHub REST API and want typed values for what you send and what comes back: repository metadata and contents, organization and user repository lists, traffic, stargazers, the authenticated user, and the OAuth web flow. Each endpoint is a namespace with a request and a response, such as `GitHub.Repository.Get.Request` and `GitHub.Repository.Get.Response`, so start from the endpoint you need under `GitHub`. The package only holds the values. Building URLs, decoding JSON and sending requests are left to your client.

## Laws

- `GitHub.Page.Number` starts at 1. `GitHub.Page.Size` is between 1 and 100, and `GitHub.Page.Size.maximum` is 100. Values outside these bounds make the initializer return nil.
- `GitHub.Repository.Content.Path` needs at least one segment, and no segment may be empty, `.` or `..`. Such a path returns nil.
- `GitHub.Repository.Slug.init(remote:)` reads a git remote on github.com: `https://github.com/owner/name`, `http://github.com/owner/name`, `ssh://git@github.com/owner/name`, `git://github.com/owner/name` or `git@github.com:owner/name`, each with an optional `.git` and then an optional `/` at the end. The scheme and the host are read in any letter case; the owner and the name are kept as written. Any other host returns nil, a GitHub Enterprise host included, because a slug holds no host. So does a port, a user other than `git` over SSH, and a path that is not exactly `owner/name`. Over HTTP a credential before the host is dropped.
- Every enumeration's raw value is GitHub's own spelling. A directory is `dir`, a symbolic link is `symlink`, sorting by full name is `full_name`, and the directions are `asc` and `desc`.
- `GitHub.OAuth.Token.Exchange.Response.scope` keeps the granted scopes as the one comma separated string GitHub returns. Only `GitHub.OAuth.Authorization.Request.scopes` is a list.
