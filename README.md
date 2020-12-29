[![CircleCI](https://circleci.com/gh/dcycle/docker-yaml-lint.svg?style=svg)](https://circleci.com/gh/dcycle/docker-yaml-lint)

Lint Yaml files with [yamllint](https://github.com/adrienverge/yamllint).

For example, for a single file:

    docker run --rm -v $(pwd)/examples:/app/code dcycle/yaml-lint:2 -s code/yaml.yaml

For example, with all files in a project:

    find . -name "*.yml" -not -path "*drupal/config*" -print0 | \
      tr '\n' '\0' | \
      xargs -0 -I '$' docker run --rm \
      -v "$(pwd)":/app/code dcycle/yaml-lint:2 -s "code/$"

See [this project on the Docker Hub](https://hub.docker.com/r/dcycle/yaml-lint/).
