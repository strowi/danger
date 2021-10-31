# Danger-Image

Danger Container for CI/CD -> <https://danger.systems>

Repo-Url: [https://gitlab.com/strowi/danger](https://gitlab.com/strowi/danger)

## Docker Image

Should be available on docker and gitlab:

* [strowi/danger:latest](https://hub.docker.com/repository/docker/strowi/danger)
* [registry.gitlab.com/strowi/danger:latest](https://gitlab.com/strowi/danger)

## addons included

* gitlab_roulette
* danger-mention
* danger-changelog
* danger-the_coding_love
* danger-todoist
* danger-review_requests

## Usage:

### Gitlab CI/CD:

To allow Danger to comment in MRs this requires a CI/CD-Variable with API-access to the Project  named `DANGER_GITLAB_API_TOKEN`.

```yaml
danger:
  allow_failure: true
  image: registry.gitlab.com/strowi/danger:latest
  variables:
    DANGER_GITLAB_HOST: gitlab.com
    DANGER_GITLAB_API_BASE_URL: https://gitlab.com/api/v4
  needs: []
  dependencies: []
  before_script: []
  rules:
    - if: '$DANGER_GITLAB_API_TOKEN && ( $CI_PIPELINE_SOURCE == "merge_request_event" )'
      exists:
        - Dangerfile
      when: always
    - when: never
  script:
    - danger --fail-on-errors=true

```  
