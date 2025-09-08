import * as cdk from 'aws-cdk-lib';
import { Template } from 'aws-cdk-lib/assertions';
import { CdkStack } from '../lib/cdk-stack';

test('S3 Bucket Created', () => {
  const app = new cdk.App();
  // WHEN
  const stack = new CdkStack(app, 'MyCDKTypeScriptBucket');
  // THEN
  const template = Template.fromStack(stack);

  template.resourceCountIs('AWS::S3::Bucket', 1);
});
