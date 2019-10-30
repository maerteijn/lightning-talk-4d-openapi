install:
	pip install -r requirements.txt

docs-apistar:
	apistar docs --serve --path petstore.yaml --format openapi --encoding yaml

docs-redoc:
	apistar docs --serve --path petstore.yaml --theme redoc --format openapi --encoding yaml
