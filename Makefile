install:
	pip install -r requirements.txt

docs-apistar:
	apistar docs --serve --path petstore.yaml --format openapi --encoding yaml

docs-redoc:
	apistar docs --serve --path petstore.yaml --theme redoc --format openapi --encoding yaml

openapi-generate-flask:
	docker run --rm -v ${PWD}:/local openapitools/openapi-generator-cli generate -i /local/petstore.yaml -g python-flask -o /local/builds/python-flask

openapi-generate-nodejs:
	docker run --rm -v ${PWD}:/local openapitools/openapi-generator-cli generate -i /local/petstore.yaml -g nodejs-express-server -o /local/builds/nodejs-express-server
