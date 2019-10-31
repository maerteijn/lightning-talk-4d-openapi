import apistar
import typesystem
from apistar.schemas.openapi import lookup


schema = open("petstore.yaml").read()


class MockTransport:
    schemes = ["http", "https"]

    def get_response_examples_from_endpoints(self, endpoint):
        return lookup(
            self.endpoint_definitions,
            [
                f"/{endpoint}",
                "get",
                "responses",
                "200",
                "content",
                "application/json",
                "examples",
                "default",
                "value",
            ],
        )

    def __init__(self, schema):
        token = typesystem.tokenize_yaml(schema)
        self.endpoint_definitions = token.value["paths"]

    def send(self, method, url, query_params, content, encoding):
        endpoint = url.split("/")[-1]
        return self.get_response_examples_from_endpoints(endpoint)


class MockClient(apistar.Client):
    """
    A mock rest client which a mock transport which will return examples
    from the OpenAPI schema instead of real responses
    """

    def __init__(self, schema, *args, **kwargs):
        super().__init__(schema, *args, **kwargs)
        self.transport = MockTransport(schema)

    @property
    def endpoints(self):
        return tuple(x.name for x in self.document.walk_links())


mock_client = MockClient(schema=schema)
