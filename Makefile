.PHONY: build push deploy

AWS_PROFILE := default
AWS_REGION := us-west-2
AWS_ACCOUNT := $(shell aws sts get-caller-identity --profile $(AWS_PROFILE) --query Account --output text)
ECR_URI := $(AWS_ACCOUNT).dkr.ecr.$(AWS_REGION).amazonaws.com/go-fargate-app

build:
	docker buildx build --platform linux/amd64 -t go-fargate-app .

push: build
	aws ecr get-login-password --region $(AWS_REGION) --profile $(AWS_PROFILE) | docker login --username AWS --password-stdin $(AWS_ACCOUNT).dkr.ecr.$(AWS_REGION).amazonaws.com
	docker tag go-fargate-app:latest $(ECR_URI):latest
	docker push $(ECR_URI):latest

deploy: push
	cd cdk && npm install
	cd cdk && npm run build
	cd cdk && AWS_PROFILE=$(AWS_PROFILE) AWS_REGION=$(AWS_REGION) npx cdk deploy --require-approval never