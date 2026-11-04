# swift-github-standard

Use this package when you call the GitHub REST API and want typed values for what you send and what comes back: repository metadata and contents, organization and user repository lists, traffic, stargazers, the authenticated user, and the OAuth web flow. Each endpoint is a namespace with a request and a response, such as `GitHub.Repository.Get.Request` and `GitHub.Repository.Get.Response`, so start from the endpoint you need under `GitHub`. The package only holds the values. Building URLs, decoding JSON and sending requests are left to your client.

## Laws

- `GitHub.Page.Number` starts at 1. `GitHub.Page.Size` is between 1 and 100, and `GitHub.Page.Size.maximum` is 100. Values outside these bounds make the initializer return nil.
- `GitHub.Repository.Content.Path` needs at least one segment, and no segment may be empty, `.` or `..`. Such a path returns nil.
- Every enumeration's raw value is GitHub's own spelling. A directory is `dir`, a symbolic link is `symlink`, sorting by full name is `full_name`, and the directions are `asc` and `desc`.
- `GitHub.OAuth.Token.Exchange.Response.scope` keeps the granted scopes as the one comma separated string GitHub returns. Only `GitHub.OAuth.Authorization.Request.scopes` is a list.
