import http.server
import socketserver

class CharsetHandler(http.server.SimpleHTTPRequestHandler):
    def guess_type(self, path):
        ctype = super().guess_type(path)
        if ctype == 'text/html':
            return 'text/html; charset=utf-8'
        return ctype

socketserver.TCPServer.allow_reuse_address = True
httpd = socketserver.TCPServer(('', 8000), CharsetHandler)
print('Serving at http://localhost:8000 with charset=utf-8')
httpd.serve_forever()
