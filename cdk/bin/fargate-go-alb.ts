#!/usr/bin/env node
import 'source-map-support/register';
import * as cdk from 'aws-cdk-lib';
import { FargateGoAlbStack } from '../lib/fargate-go-alb-stack';

const app = new cdk.App();
new FargateGoAlbStack(app, 'FargateGoAlbStack', {
  env: {
    account: process.env.CDK_DEFAULT_ACCOUNT,
    region: process.env.CDK_DEFAULT_REGION,
  },
});