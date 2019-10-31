install:
	pip install -r requirements.txt

docs-apistar:
	apistar docs --serve --path petstore.yaml --format openapi --encoding yaml

docs-redoc:
	apistar docs --serve --path petstore.yaml --theme redoc --format openapi --encoding yaml

validate-schema:
	 apistar validate --path petstore.yaml --format openapi

openapi-generate-flask:
	docker run --rm -v ${PWD}:/local openapitools/openapi-generator-cli generate -i /local/petstore.yaml -g python-flask -o /local/output/python-flask
