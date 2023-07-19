import json, pyautogui # If you dont know how to install these you shouldn't be trying to get this to work
from PIL import Image
from http.server import HTTPServer, BaseHTTPRequestHandler

HOST = "127.0.0.1" # Dont change this unless you're doing something different
PORT = 23935 # Input your port here!
# This is basically all hashbmo's code so big thanks yes :)
# I'll probably implement chunking frames at some point if I really feel like it
class HTTP(BaseHTTPRequestHandler):
    def do_GET(self):
        pyautogui.screenshot('ss.png')
        img = Image.open('ss.png')
        w,h = img.size
        new = img.resize((w//9,h//9))
        vals = list(new.getdata())
        
        img_data = {
            "data" : vals,
            "size" : new.size,
        }
        
        self.send_response(200)
        self.send_header("Content-type", "application/json")
        self.end_headers()
        self.wfile.write(bytes(json.dumps(img_data), encoding='utf8'))
    
   
        
server = HTTPServer((HOST, PORT), HTTP)
server.serve_forever()
server.server_close()
print("Server stopped")
