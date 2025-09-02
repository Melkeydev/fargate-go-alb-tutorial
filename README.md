# Fargate Go ALB Tutorial

A simple tutorial project demonstrating how to deploy a Go application on AWS ECS Fargate with an Application Load Balancer using AWS CDK.

## Overview

This tutorial shows how to:
- Build a containerized Go web application
- Deploy it to AWS ECS Fargate
- Set up an Application Load Balancer for public access
- Use AWS CDK for infrastructure as code

## Prerequisites

- AWS Account
- AWS CLI configured
- Docker installed
- Node.js and npm installed
- Go installed

## Quick Start

1. Build and push the Docker image:
   ```bash
   make push
   ```

2. Deploy the infrastructure:
   ```bash
   make deploy
   ```

## Project Structure

- `main.go` - Simple Go web server
- `Dockerfile` - Container configuration
- `cdk/` - AWS CDK infrastructure code
- `Makefile` - Build and deployment automation

## Tutorial Purpose

This is a learning project for understanding AWS ECS Fargate deployments with Go applications.