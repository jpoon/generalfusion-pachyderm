# Unlocking Fusion with Containers and Kubernetes

Demo application that was demonstrated at Build 2017 during the "Unlocking Fusion with Containers and Kubernetes" session.

## Architecture

![diagram](docs/workflow.png)

## Getting Started

1) Provision a Kubernetes cluster. The easiest way to do so is through [Minikube](https://kubernetes.io/docs/getting-started-guides/minikube/)
2) [Deploy Pachyderm](http://docs.pachyderm.io/en/latest/deployment/deploy_intro.html) onto the Kubernetes cluster. 
3) Run `make build tag push` updating the `Makefile` to push the images to a registry of your choice
4) Run `demo-setup.sh` to seed your Pachyderm instance with the necessary data
5) Step through line-by-line `demo.sh` to build an analysis pipeline

