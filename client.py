import apistar


schema = open("petstore.yaml").read()


class Client(apistar.Client):

    @property
    def endpoints(self):
        return tuple(x.name for x in self.document.walk_links())


client = Client(schema=schema)
