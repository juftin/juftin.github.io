---
title: "My Personal Cookiecutter Template"
date: 2022-08-17
categories:
    - blog
tags:
    - project
    - cookiecutter-python
---

# [cookiecutter-python]

Creating a new Python project can be a daunting task, especially when it comes to
setting up all the necessary development and deployment tools. This is where my
Cookiecutter Python template comes into play. This template simplifies the process
of setting up a new Python project, allowing developers to focus on writing code
rather than wrestling with configuration.

## What is Cookiecutter?

Cookiecutter is a command-line utility that creates projects from project templates.
With it, you can generate a new project structure with all the necessary files
and directories based on a predefined template.

## Key Features

-   [hatch] for managing the project's virtual environment and development tools
-   [ruff] for code formatting and linting
-   [mypy] for type checking
-   [hatch-pip-compile] for dependency management + lockfiles
-   [pre-commit] for managing git hooks
-   [GitHub Actions] for CI/CD
-   [MkDocs] and [mkdocs-material] for documentation
-   [GitHub Pages] for hosting documentation
-   [semantic-release] and [gitmoji] for automated releases
-   Publishes to [PyPI] and [Docker Hub]

## Getting Started

To use the template, you first need to install Cookiecutter. It's recommended to use `pipx`
for the installation, but you can also use `pip`.

```shell
pipx install cookiecutter
```

Once Cookiecutter is installed, you can generate a new Python project using the
following command:

```shell
cookiecutter gh:juftin/cookiecutter-python
```

After generating the project, navigate to the root directory of your new project,
create a Git repository, and install pre-commit:

```shell
git init
pre-commit install
git add .
pre-commit run --all-files
git add .
git commit
```

Remember to commit your lockfiles, which are created at `requirements.txt` and in
the `requirements` directory. They will be created automatically when you run a
`hatch` command in the respective environment for the first time:

```shell
hatch run cov
hatch run lint:all
hatch run docs:serve
git add requirements.txt requirements/
git commit -m "🔐 add lockfiles"
```

## Managing Secrets

This template uses GitHub Actions to deploy releases, documentation, and to publish artifacts
to PyPI and Docker Hub. You will need to create secrets in your GitHub repository to enable
these features. A `.env` file is provided in the project root for local development. To sync
your secrets to GitHub, run the following command with the GitHub CLI:

```shell
gh secret set --env-file .env
```

## Developing Your Project

This project generates its own documentation for how to use the project's tools. To view
the documentation locally, run:

```shell
hatch run docs:serve
```

Once the server is running, you can view the documentation at `localhost:8080/contributing` or
see a preview at `juftin.com/cookiecutter-python/contributing`.

My Cookiecutter Python template is an excellent tool for Python developers.
It simplifies the setup process, allowing developers to jump straight into coding. Whether
you're a seasoned developer or a beginner, this template is worth checking out.

[pre-commit]: https://github.com/pre-commit/pre-commit
[gitmoji]: https://gitmoji.dev
[semantic-release]: https://github.com/semantic-release/semantic-release
[Cookiecutter]: https://github.com/cookiecutter/cookiecutter
[hatch]: https://github.com/pypa/hatch
[MkDocs]: https://github.com/mkdocs/mkdocs
[mkdocs-material]: https://github.com/squidfunk/mkdocs-material
[Github Actions]: https://github.com/features/actions
[Github Pages]: https://pages.github.com/
[juftin]: https://github.com/juftin
[pipx]: https://github.com/pypa/pipx
[PyPI]: https://pypi.org/
[Docker Hub]: https://hub.docker.com/
[hatch-pip-compile]: https://github.com/juftin/hatch-pip-compile
[GitHub CLI]: https://cli.github.com/
[localhost:8080/contributing]: http://localhost:8080/contributing
[ruff]: https://github.com/astral/ruff/
[mypy]: https://github.com/python/mypy
[juftin.com/cookiecutter-python/contributing]: https://juftin.com/cookiecutter-python/contributing/
[cookiecutter-python]: https://github.com/juftin/cookiecutter-python
