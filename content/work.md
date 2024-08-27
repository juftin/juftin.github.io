---
ShowBreadCrumbs: false
hidemeta: true
---

## Interested in working together?

If you're interested in my work as a software engineer:
[get in touch](mailto:justin.flannery@juftin.com) and/or learn more on
my [LinkedIn](https://linkedin.com/in/justinflannery).

<style>
    .greeting {
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .greeting-text {
        margin-right: 10px;
    }

</style>

# What I'm Working On

In my free time I try to build tools and software that spark joy ✨. Below are a few of my more public facing
GitHub repositories and some details about the projects.

### [camply](https://github.com/juftin/camply)

[![PyPI](https://img.shields.io/pypi/v/camply?color=blue&label=⛺️%20camply)](https://github.com/juftin/camply)
[![GitHub Repo stars](https://img.shields.io/github/stars/juftin/camply)](https://github.com/juftin/camply)
[![PyPI - Python Version](https://img.shields.io/pypi/pyversions/camply)](https://pypi.python.org/pypi/camply/)

`camply`, the campsite finder ⛺️, is a tool to help you book an online campground. Finding
reservations at sold out campgrounds can be tough. That's where `camply` comes in. It searches the
APIs of Booking Services like https://recreation.gov (which works on thousands of campgrounds across
the USA) to continuously check for cancellations and availabilities to pop up. Once a campsite
becomes available, `camply` sends you a notification to book your spot!

You can install camply easily via **`pipx install camply`**.

### [browsr](https://github.com/juftin/browsr)

[![PyPI](https://img.shields.io/pypi/v/browsr?color=blue&label=🗂️%20browsr)](https://github.com/juftin/browsr)
[![GitHub Repo stars](https://img.shields.io/github/stars/juftin/browsr)](https://github.com/juftin/browsr)
[![PyPI - Python Version](https://img.shields.io/pypi/pyversions/browsr)](https://pypi.python.org/pypi/browsr/)

`browsr` 🗂️ is a pleasant file explorer in your terminal. It's a command line TUI application
that empowers you to browse the contents of local and remote directories with your keyboard or
mouse. You can quickly navigate through directories and peek at files whether they're hosted
locally, in AWS S3, Google Cloud Storage, or Azure Blob Storage. View code files with syntax
highlighting, format JSON files, render images, convert CSV and Parquet files to datatables
and more. Get going with all of `browsr`'s superpowers with **`pipx install "browsr[all]"`**.

### [llm-term](https://github.com/juftin/llm-term)

[![PyPI](https://img.shields.io/pypi/v/llm-term?color=blue&label=🤖%20llm-term)](https://github.com/juftin/llm-term)
[![GitHub Repo stars](https://img.shields.io/github/stars/juftin/llm-term)](https://github.com/juftin/llm-term)
[![PyPI - Python Version](https://img.shields.io/pypi/pyversions/llm-term)](https://pypi.python.org/pypi/llm-term/)

Welcome to `llm-term` 💬, a command line utility that allows you to chat with LLM models directly
from the comfort of your command line - this includes OpenAI (ChatGPT), Anthropic, and more. This tool leverages
Langchain and Rich to facilitate real-time conversations with LLM models in your terminal. It enhances the
user experience by streaming responses as rich text, complete with code-formatting and syntax highlighting.
Get started with **`pipx install llm-term`** and stay on the command line!

### [hatch-pip-compile](https://github.com/juftin/hatch-pip-compile)

[![PyPI](https://img.shields.io/pypi/v/hatch-pip-compile?color=blue&label=🥚%20hatch-pip-compile)](https://github.com/juftin/hatch-pip-compile)
[![GitHub Repo stars](https://img.shields.io/github/stars/juftin/hatch-pip-compile)](https://github.com/juftin/hatch-pip-compile)
[![PyPI - Python Version](https://img.shields.io/pypi/pyversions/hatch-pip-compile)](https://pypi.python.org/pypi/hatch-pip-compile/)

`hatch-pip-compile` is the missing lockfile capability for the [hatch](https://github.com/pypa/hatch) Python
project tool 🥚. It's a hatch plugin that connects your hatch-managed virtual environment to a lockfile
managed with [pip-compile](https://githun.com/jazzband/pip-tools). The plugin detects whether your
environment or lockfile is out to date and automatically syncs them when needed - and it's fast!
Get reproducible environments for your Python projects today with
[hatch-pip-compile](https://github.com/juftin/hatch-pip-compile)

### [lunchable](https://github.com/juftin/lunchable)

[![PyPI](https://img.shields.io/pypi/v/lunchable?color=blue&label=🍱%20lunchable)](https://github.com/juftin/lunchable)
[![GitHub Repo stars](https://img.shields.io/github/stars/juftin/lunchable)](https://github.com/juftin/lunchable)
[![PyPI - Python Version](https://img.shields.io/pypi/pyversions/lunchable)](https://pypi.python.org/pypi/lunchable/)

[Lunch Money](https://lunchmoney.app/) is a "delightfully simple personal finance & budgeting app" -
and my current tool of choice to manage my finances. `lunchable` 🍱 is a Python API Client for the
Lunch Money Developer API. It’s built on top of pydantic, it offers an intuitive API, a simple CLI,
complete coverage of all endpoints and plugins to other external services.

### [dotfiles](https://github.com/juftin/dotfiles)

`dotfiles` 🌈 is a collection of my personal dotfiles for `macOS`, `Linux`, `zsh`, and
_everything else_. It's a set of configuration files with an opinionated set of tools and
configurations based on my personal preferences. `dotfiles` are a personal preference so if
my files aren't for you, you'll enjoy the `dev-setup` 📔 documentation which helps you
get up and running on your own `macOS` or `Linux` machine.
`dotfiles` can be installed with **`curl -fsSL https://juftin.com/dotfiles/get | bash`**.

### [cookiecutter-python](https://github.com/juftin/cookiecutter-python)

My personal cookiecutter template 🚀, might be your new secret weapon for Python projects.
It's an all-in-one development toolkit that operates seamlessly in your coding environment.
Imagine managing your project's virtual environment and development tools with `hatch`,
effortlessly formatting and linting your masterpiece with `ruff`,
and checking types using `mypy`. Literally all of the CI/CD details have been taken care of.
Unleash the full potential of your Python project with juftin's personal cookiecutter
template. Get started with **`cookiecutter gh:juftin/cookiecutter-python`**.

### [zoo](https://github.com/juftin/zoo)

The `zoo` project 🦁🐼🐨, an asynchronous zoo API powered by FastAPI, SQLAlchemy 2.0,
Pydantic v2, and Alembic. `zoo` is a simple yet robust API example that allows you to manage
a zoo. It utilizes modern tools and practices, including a production-ready server (Uvicorn),
modern SQL ORM (SQLAlchemy 2.0), data validation (Pydantic v2), and database migrations (Alembic).
This project serves as an excellent starting point for building your own API, outlining the
basic structure of an API project and providing examples of implementing common features.

### [homelab](https://github.com/juftin/homelab)

I've always been a big TV and Movies nerd. On the weekends you can find me searching RottenTomatoes
for the latest _certified fresh_ 🍅 pick. `homelab` is a multi-container docker-compose
application that supports every aspect of hosting your own media server at home. `homelab`
includes everything you need to host a website for your friends and
family to request new content be downloaded, services to find and securely download the latest
movies and shows, and underneath it all a Plex media server to support playback of the content
anywhere and on any device.
