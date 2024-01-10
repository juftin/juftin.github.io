---
title: "hatch's missing lockfile capability"
date: 2024-01-09
categories:
    - blog
tags:
    - project
    - hatch
    - pip-compile
    - hatch-pip-compile
---

<div align="center">
  <a href="https://github.com/juftin/hatch-pip-compile">
    <img src="https://raw.githubusercontent.com/juftin/hatch-pip-compile/main/docs/logo.png" alt="hatch-pip-compile" width="250" />
  </a>
</div>

I'm a huge fan of using [hatch] to manage my Python projects. It lets me define my projects
with a single `pyproject.toml` file and define all of my extra environments and scripts in the
same place (i.e testing / linting / docs). One big thing it's
[missing](https://github.com/pypa/hatch/issues/749) though is an integration with
lockfiles.

The tool's author, [@ofek](https://github.com/ofek), has been very clear this feature will
eventually be added to hatch, but in the meantime I've created a plugin that adds this
functionality today: [hatch-pip-compile].

## What is hatch-pip-compile?

[hatch-pip-compile] is a [hatch] plugin that connects your hatch-managed virtual environment
to a lockfile managed with [pip-compile]. The plugin detects whether your environment or
lockfile is out to date and automatically syncs them when needed - and it's fast!

## Why hatch-pip-compile?

For all my projects I found myself regenerating manual lock files using complex
`pip-compile` shell commands wired up to hatch to get a reproducible environments
across machines. Every time I added or updated a package, I had to manually regenerate
the lockfile. This was a huge pain and I wanted something that would automatically
keep my lockfile up to date. The functionality is useful for both Python libraries and
applications.

One of my favorite parts of the tool is that the lockfiles aren't in some proprietary
format (no offense [poetry], [PDM], [pipenv]) so if your project has a contributor who
isn't interested in learning how to use hatch they can simply
`pip install -r <lockfile>` and get going quickly.

## How does it work?

hatch has an amazing
[environment plugin] system that allows you to extend the functionality of your
hatch environments. The plugin itself is a subclass of hatch's `VirtualEnvironment` class and
overrides some methods to add the lockfile functionality:

-   `dependencies_in_sync`
-   `sync_dependencies`
-   `dependency_hash`
-   `install_project` / `install_project_dev_mode`

There is quite a bit more to the plugin, but the above methods are the
core of the implementation. Behind the scenes the plugin installs [pip-tools] into the
virtual environment, gathers the dependencies from the `pyproject.toml` file,
and pipes them into `pip-compile` to generate a lockfile.

The plugin writes its own header on the lockfile to ensure that it can
identify when a lockfile is out of sync with the environment and update it.
The plugin also supports the linking of multiple environments together to
ensure that dependencies are synced to the same versions across environments
(such as between your `default` and `test` environments).

Installation and usage of the plugin is as simple adding the following to your
project's `pyproject.toml` file:

```toml
[tool.hatch.env]
requires = [
    "hatch-pip-compile"
]

[tool.hatch.envs.default]
type = "pip-compile"
```

## Learnings from the project

### Lockfiles are hard

#### Platform / Python Version Specific Requirements

Lockfiles are a great way to ensure that your project's dependencies are reproducible.
In the case of [pip-compile], it generates a `pip` compatible file that
can be used to install your project's dependencies.

The problem is that the lockfiles can not always be portable across Python versions and
operating systems. For example, if you generate a lockfile on a Mac using `pip-compile`
with Python `3.9`, it may not be compatible with a Linux machine running Python `3.8`. This
is because libraries can have requirements that depend on a specific Python version or
platform.

Let's take the example of [keyring] which is a library that provides
cross-platform support for storing secure secrets (it's also a dependency of hatch):

```requirements
pywin32-ctypes>=0.2.0; sys_platform=="win32"
SecretStorage>=3.2; sys_platform=="linux"
jeepney>=0.4.2; sys_platform=="linux"
importlib_metadata >= 4.11.4; python_version < "3.12"
jaraco.classes
importlib_resources; python_version < "3.9"
```

We can see some of the requirements are platform specific, and some are Python version
specific. This means that if you generate a lockfile using `pip-compile` on a Mac using
Python `3.9`, it will not see the `SecretStorage` requirement and will not include it
on the resulting lockfile. This is a problem if you try to install the lockfile on a
Linux machine running Python `3.8`, **and** you're using the `--no-deps` flag to
install your dependencies. If you're not using the `--no-deps` flag, then `pip`
will identify that those dependencies are required for your platform / Python
version and will install them.

This behavior is why the plugin uses `pip` instead of [pip-sync] to install the lockfile
by default and doesn't use the `--no-deps` flag. This behavior is of course configurable,
but it's important to understand why it's the default.

#### Binary Availability

Let's take another example from the [pandas] library, a well-known data analysis / manipulation
package. As of this writing, the current supported versions of Python are `3.8`, `3.9`, `3.10`,
`3.11`, and `3.12`. If you're publishing a Python library that depends on pandas, you'll likely
want to support all of these versions. However, there is not currently a version of pandas that
supports all of these versions of Python **and** has a binary available for all of these versions
too. You can sometimes build a package from source if you have the right build dependencies,
but this is not always possible and usually not desirable.

This means that if you generate a lockfile using `pip-compile` on a Mac using Python `3.9`, it will
likely pin you on the current version of pandas (`2.1.4`) which does not have a binary available
for `3.8`. If you pinned your project to `pandas==2.0.3` (the last version with a binary available
for `3.8`), then you would not be able to install your project on a Mac using Python `3.12` because
there is no binary available for that version of Python. This means that you'll probably end up
with something like this in your dependencies:

```requirements
pandas~=2.0.3; python_version < '3.9'
pandas~=2.1.4; python_version > '3.8'
numpy~=1.24.4; python_version < '3.9'
numpy~=1.26.1; python_version > '3.8'
```

This will allow you to install your project on all versions of Python, but it will not be
reproducible across machines. This is because the `pip-compile` will choose whichever version
of pandas is available for its Python interpreter and exclude the other version.

The plugin's ability to support matrix environments is a great way to get around this.
When a matrix environment is also a `pip-compile` environment, the plugin will generate a
separate lockfile for each Python version.

[keyring]: https://github.com/jaraco/keyring
[hatch-pip-compile]: https://github.com/juftin/hatch-pip-compile
[pip-tools]: https://github.com/jazzband/pip-tools
[pip-compile]: https://github.com/jazzband/pip-tools
[pip-sync]: https://github.com/jazzband/pip-tools
[hatch]: https://github.com/pypa/hatch
[environment plugin]: https://hatch.pypa.io/latest/plugins/environment/
[pandas]: https://github.com/pandas-dev/pandas
[poetry]: https://github.com/python-poetry/poetry
[PDM]: https://github.com/pdm-project/pdm
[pipenv]: https://github.com/pypa/pipenv
