FROM ruby:3-alpine3.13
MAINTAINER Roman v. Gemmeren <strowi@hasnoname.de>

# Install dependencies
RUN apk add curl git git-crypt bash


# renovate: datasource=nix_unstable depName=danger-gitlab versioning=loose
ENV DANGER_GITLAB_VERSION="8.0.0"
# renovate: datasource=github-releases depName=danger/danger versioning=loose
ENV DANGER_VERSION="8.0.0"
RUN gem install --no-document \
  danger:${DANGER_VERSION} \
  danger-gitlab:${DANGER_GITLAB_VERSION} \
  gitlab_roulette \
  danger-mention \
  danger-changelog \
  danger-the_coding_love \
  danger-todoist \
  danger-review_requests


ENV WORK_DIR "/danger"
ENV DANGER_GITLAB_HOST "gitlab.com"
ENV DANGER_GITLAB_API_BASE_URL "https://gitlab.com/api/v4"

RUN danger --version

VOLUME ${WORK_DIR}
WORKDIR ${WORK_DIR}

ENTRYPOINT [""]
