set -e
docker pull node
docker pull dcycle/yaml-lint
docker build -t local-dcycle-yaml-lint-image .

docker run -v $(pwd)/examples:/app/code dcycle/yaml-lint:2 --help
docker run -v $(pwd)/examples:/app/code dcycle/yaml-lint:2 code/yaml.yaml
docker run -v $(pwd)/examples:/app/code local-dcycle-yaml-lint-image --help
docker run -v $(pwd)/examples:/app/code local-dcycle-yaml-lint-image code/yaml.yaml
