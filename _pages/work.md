---
author_profile: true 
layout: single 
permalink: /work/
date: 2022-02-08 
title: ""
---

# What I'm Working On <img src="https://media.giphy.com/media/WUlplcMpOCEmTGBtBW/giphy.gif"  width="40px">

In my free time I try to build tools and software that reflect my personal interests like camping,
sharing memories with my family, finding ways to monitor spending and increase savings, or just
building something for the sake of building something new. Below are some of my more public facing
GitHub repositories and some details about the projects.

### [camply](https://github.com/juftin/camply)

`camply`, the campsite finder ⛺️, is a tool to help you book an online campground. Finding
reservations at sold out campgrounds can be tough. That's where `camply` comes in. It searches the
APIs of Booking Services like https://recreation.gov (which works on thousands of campgrounds across
the USA) to continuously check for cancellations and availabilities to pop up. Once a campsite
becomes available, `camply` sends you a notification to book your spot!

You can install camply easily via `pip install camply`.

### [media-center](https://github.com/juftin/media-center)

I've always been a big TV and Movies nerd. On the weekends you can find me searching RottenTomatoes
for the latest _certified fresh_ 🍅 pick. `media-center` is a multi-container docker-compose
application that supports every aspect of hosting your own media server at home. `media-center`
includes everything you need (plus detailed documentation) to host a website for your friends and
family to request new content be downloaded, services to find and securely download the latest
movies and shows, and underneath it all a Plex media server to support playback of the content
anywhere and on any device.

### [lunchable](https://github.com/juftin/lunchable)

[Lunch Money](https://lunchmoney.app/) is a "delightfully simple personal finance & budgeting app" -
and my current tool of choice to manage my finances. `lunchable` 🍱 is a Python API Client for the
Lunch Money Developer API. It’s built on top of pydantic, it offers an intuitive API, a simple CLI,
complete coverage of all endpoints and plugins to other external services.

### [adjuftments](https://github.com/juftin/adjuftments)

`adjuftments` is a financial application made up of microservices that tracks expenses, income, and
more. Ultimately, the goal of `adjuftments` is to be mindful of spending, and to plan around
maximizing savings at the end of each month. So what makes `adjuftments` different from your Excel
spreadsheet? Mainly, `adjuftments` is built on top of _splitwise_ and _airtable_, which helps it do
some pretty cool stuff - and it's manageable on any device. At any given point during the month you
can compare your spending with where you planned to be, _adjuftments_ will help you save money
💸. `adjuftments` has a few other handy features including monthly spending categorization, stock
portfolio price syncing, handy data visualizations, and helpful push notifications built on
_pushover_. `adjuftments` has been a personal, private project for a long time so I figured why not
make it public.

### [traefik](https://github.com/juftin/traefik)

All services with a WebUI benefit from having a Reverse Proxy to serve their content.
`traefik` is my personal implementation of the Traefik Reverse Proxy service in Docker. This reverse
proxy implementation is easy to add new services to and best of all it puts sensitive services
behind Google OAuth 🔐. `media-center` is built on top of `traefik` and so are a few other services:

- #### [jupyter](https://github.com/juftin/jupyter)

  Hosted Jupyter Lab / Notebook Server with Spark, Scala, and R Dependencies. Check out the docker
  image: `juftin/jupyter:latest`.

- #### [airflow](https://github.com/juftin/airflow)

  Hosted Airflow Server to support orchestration

- #### [pihole](https://github.com/juftin/pihole)

  Network-wide Ad Blocking
