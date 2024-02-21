# Caption This!

## Introduction
Engage in the ultimate caption showdown and discover the true meme lord with this entertaining game!

Players unleash their wit by crafting unique and imaginative captions for each blank meme, and then cast their votes for the most outstanding captions across all matches.

The crowning glory awaits the victor at the end of all contests, unofficially bestowing upon them the coveted title of **Meme-Lord**!

## Rules
- A _memer_ gets a new picture, and your task is to create the most creative and humorous caption that can crack even the most serious person in the room.
- _Voter_! Your role is to rate the caption using a 5-point system. Be fair in your scoring, as everyone's counting on your judgment when you step into the shoes of the _memer_ :)

## Demo (click to watch)

<a href="https://drive.google.com/file/d/1OTQgFsREk5B-b6GyxswJK9pVIPTMDrFb/view?usp=sharing"><img src="https://drive.google.com/uc?export=view&id=15DqbXiJHe24HmJ50IHHZNIVahs5cpqKt" style="width: 500px; max-width: 100%; height: auto" title="Click to watch the video." /></a>

## Try it out!

### Installation and Getting Started
1. `git clone --recurse-submodules https://github.com/ntdkhiem/caption-this`
2. Make sure to have `.env.dev` file in your project's root directory
- It should have `SECRET_KEY`, `IMAGE_DIRECTORY` (use default: `/usr/src/app/images`)
3. `make all-up`

### Deployment
- This project is fully containerized using Docker and orchestrated by Kubernetes and Skaffold. (see `manifests/`)

### Testing
- This project is fully tested with unit test, integration test, and end-to-end test.
