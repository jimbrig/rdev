# Command Utilities

Utilities for running system commands and tools like `git`, `docker`,
etc.

These functions leverage
[`sys::exec_internal()`](https://jeroen.r-universe.dev/sys/reference/exec.html)
to run commands and capture their output.

- `cmd()`: Run a generic command.

- `git()`: Run a `git` command.

- `gh()`: Run a GitHub CLI (`gh`) command.

- `docker()`: Run a `docker` command.

## Usage

``` r
cmd(cmd, ..., .timeout = 60, .echo = TRUE)

git(cmd, ..., .timeout = 60, .echo = TRUE)

gh(cmd, ..., .timeout = 60, .echo = TRUE)

docker(cmd, ..., .timeout = 60, .echo = TRUE)

npx(cmd, ..., .timeout = 60, .echo = TRUE)
```

## Arguments

- cmd:

  The command to run.

- ...:

  Additional arguments to pass to the command.

- .timeout:

  The timeout in seconds for the command to complete. Default is 60
  seconds.

- .echo:

  Logical. If `TRUE`, the output will be printed to the console. Default
  is `TRUE`.

## Value

The output of the command.

## Examples

``` r
#--- git ---
if (FALSE) { # \dontrun{
# get git version
git("--version")
# git status
git("status")
# git commit
git("commit", "-m", "Initial commit")
} # }

#--- gh ---
if (FALSE) { # \dontrun{
# command used to initialize this repository on github:
gh("repo", "create", "landrise/landrise.utils", "--private", "--source=.", "--remote=upstream")
} # }

# --- docker ---
if (FALSE) { # \dontrun{
# get docker help
docker("--help")
# list docker images
docker("images")
# run a docker container
docker("run", "--rm", "hello-world")
} # }

# --- npx ---
if (FALSE) { # \dontrun{
# get npx help
npx("--help")
# create a new react app
npx("create-react-app", "my-app")
# run repomix tool
npx("repomix", "--help")
} # }
```
