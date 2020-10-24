set -e
docker pull node
docker build -t local-dcycle-yaml-lint-image .

docker run -v $(pwd)/examples:/app/code local-dcycle-yaml-lint-image --help
docker run -v $(pwd)/examples:/app/code local-dcycle-yaml-lint-image code/yaml.yaml
