# Go Copier

![License](https://img.shields.io/github/license/FollowTheProcess/go_copier.svg)

A clean, simple Go copier template.

## Features

### Choose Project Type

The template lets you choose whether you want to create a binary executable program (e.g. a CLI) or an importable library and the generated files will be tailored accordingly! For example, a binary project will use [goreleaser] and have a `build` target in the task runner to compile it.

### [GitHub Actions]

The project template comes with a ready to go GitHub Actions configuration file which automates all your code quality checks:

* Testing with `go test`
* Linting with [golangci-lint]
* Formatting with `go fmt`

### Task Automation with Make

Very clean and simple Makefile to automate project maintenance and development

### GitHub Issue Labelling

Series of helpful labels that you can use to categorise issues and pull requests. These come in especially handy when combined with the Release Drafter workflow!

### Automatic Release Drafts

Automatically generate release notes with the [Release Drafter] workflow. This uses the labels from issues and pull requests to draft pretty and detailed release notes for your GitHub releases.

This is automatically run when you push a new tag to main.

## Usage

* Ensure you have [copier] installed:

``` shell
pipx install copier
```

* Call copier with this template and answer all the questions

``` shell
copier copy gh:FollowTheProcess/go_copier /path/to/put/your/new/project
```

* Create a git repo and start developing

* Make a first commit to set up the github repo

* That should be it! from now on everything will be handled automatically. All you need to do is write code, tests and docs! Your code will be style checked, your tests will be run etc.

[GitHub actions]: https://docs.github.com/en/free-pro-team@latest/actions
[golangci-lint]: https://golangci-lint.run
[goreleaser]: https://goreleaser.com/intro/
[copier]: https://github.com/copier-org/copier
