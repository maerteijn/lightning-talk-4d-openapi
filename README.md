# lightning-talk-4d-openapi
A lighting talk about OpenAPI

## Usage

Requirements for the tools used:
- docker
- python 3.x with a virtualenv

Install the requirements (inside a virtualenv):
```
make install
```

Validate the schema:
```
make validate-schema
```

Show the apistar documentation of the petstore:
```
make docs-apistar
```

The same petstore documentation with a redoc frontend:
```
make docs-redoc
```

Generate a flask stub with the openapi-generator docker image:
```
make openapi-generate-flask
```


## Links of tools used in the talk

- https://github.com/OpenAPITools/openapi-generator
- https://github.com/encode/apistar

## Other interesting links

- http://spec.openapis.org/oas/v3.0.2
- http://api.openapi-generator.tech/
- https://swagger.io
- https://github.com/Redocly/redoc
- https://www.django-rest-framework.org/api-guide/schemas/
