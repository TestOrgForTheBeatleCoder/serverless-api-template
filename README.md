# A Serverless API Template

## What's the purpose of this?

This is boilerplate code that gives you:

* A RESTful API created using: 
  * the Serverless Framework 
  * AWS Lambda 
  * API Gateway
  * Node.js

* A CI/CD pipeline created using:
  * Jenkins Pipeline
  * Docker

I'm about to start working with a client on a serverless architecture for the 3rd time and once again they are
already using Jenkins and AWS, and would like to start writing Lambdas using Node.js. Forking this repo 
will enable me to focus on writing code that will add value to the business from the get-go, without having to
worry about how to build and release it. Hopefully it will also provide a useful insight for anyone looking to 
do something similar.

## Future additions?

* Add sample unit, integration and acceptance tests to the project.
* Come up with a strategy for excluding unused dependencies when deploying Lambdas.
* Include code for downloading internal packages from a private NPM registry.