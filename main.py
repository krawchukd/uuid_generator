import falcon
import uuidGenerator

class uuidService:
    def on_get(self, req, resp):
        """Handles GET requests"""
        response = {
            'uuid': "{}".format(uuidGenerator.generate())
        }

        resp.media = response


api = falcon.API()
api.add_route('/uuid', uuidService())
