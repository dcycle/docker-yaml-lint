set -e
docker pull python
docker build -t local-dcycle-yaml-lint-image .

echo " => Smoke test (--help)"
docker run -v $(pwd)/examples:/app/code local-dcycle-yaml-lint-image --help
echo " => Linting some dummy yaml"
docker run -v $(pwd)/examples:/app/code local-dcycle-yaml-lint-image code/yaml.yaml
echo " => Done"
