[![CircleCI](https://circleci.com/gh/dcycle/docker-yaml-lint.svg?style=svg)](https://circleci.com/gh/dcycle/docker-yaml-lint)

Lint Yaml files with [yamllint](https://github.com/adrienverge/yamllint).

For example, for a single file:

    docker run -v $(pwd)/examples:/app/code dcycle/yaml-lint code/yaml.yaml

For example, with all files in a project:

    find . -name "*.yml" -print0 | tr '\n' '\0' | xargs -0 -I '$' docker run -v "$(pwd)":/app/code dcycle/yaml-lint "code/$"

See [this project on the Docker Hub](https://hub.docker.com/r/dcycle/yaml-lint/).
