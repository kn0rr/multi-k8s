# Multi-Container Production Deployment

The Steps for the Mulit-Container Deployment looks like like following:

![Mulit-Container Deployment](img/complex_Part-MultiContainerDeplyoment.png)

## Travis-CI configuration

Enable Repository to work with [Travis-CI](travis-ci.com)

## AWS Steps

1. Create Elastic Beanstalk Instance
2. Create ElastiCache Instance
3. Create RDS Instance
4. Create Security Group and Inbound Rule which is open for all instances in the Security Group
5. Map all the created Instance to the Security Group
6. Configure Elastic Beanstalk Software Variables (like REDIS_HOST etc.) in the configuration "Software" view (get the Value from the different instances)

## Travis-CI IAM configuration for AWS

1. Go to AWS IAM Service
2. Add new User with programmatic access
 - Permission: Attach existing policies directly:
 - Add all ElasticBeanstalk permissions
Access key ID
 AKIAX4YPMHFS4F55MVYT
 secret Access key:
 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