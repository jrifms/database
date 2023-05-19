import http.server
import socketserver
from conexao import Conexao
import signal

class PythonProcessing:

    def arquivo(self,nome='index.html', query='select * from venda'):
        try:
            conexao = Conexao()
            tabela  = conexao.get_data(sql=query)
            conexao.close()
            lines = ''
            with open(nome,'r') as file:
                for line in file:
                    line = line.replace('<ColocarTabelaAqui>', tabela)
                    lines += str(line)
            return lines
        except ValueError as error:
            print(error)

class GerenciaRequisicao(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        file = PythonProcessing()
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        self.wfile.write(file.arquivo().encode())
        
class ServidorIFMS:
    def __init__(self):
        try:
            port = 9009
            handler = GerenciaRequisicao
            with socketserver.TCPServer(("", port), handler) as self.server:
                print(f"Rodando na Porta {port}")
                signal.signal(signal.SIGINT, self.shutdown_handler)
                self.server.serve_forever()
        except ValueError as error:
            print(error)
    # Fechar o servidor web (Ctrl+C)
    def shutdown_handler(self,signal, frame):
        print("Fechando o servidor")
        self.server.server_close()

serverOn = ServidorIFMS()