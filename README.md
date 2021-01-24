# mkdocs-firebase-pipeline
Mkdocs Docker Image containing Firebase CLI for deployments to Firebase

## CI Samples

### Bitbucket Pipelines

`bitbucket-pipelines.yml`

```yaml
image: tkikuchi/mkdocs-firebase-pipeline:node10-alpine

pipelines:
  branches:
    master:
      - step:
          script:
            - mkdocs build
            - firebase use $PROJECT_ID --token $FIREBASE_TOKEN
            - firebase deploy --only hosting -m "Branch $BITBUCKET_BRANCH Build $BITBUCKET_BUILD_NUMBER" --token $FIREBASE_TOKEN
```

### GitLab CI

`.gitlab-ci.yml`

```yaml
image: tkikuchi/mkdocs-firebase-pipeline:12-alpine

stages:
  - deploy

deploy-prod:
  stage: deploy
  only:
    - master
  script:
    - mkdocs build
    - firebase use $PROJECT_ID --token $FIREBASE_TOKEN
    - firebase deploy --only hosting -m "Pipe $CI_PIPELINE_ID Build $CI_BUILD_ID" --token $FIREBASE_TOKEN
```
