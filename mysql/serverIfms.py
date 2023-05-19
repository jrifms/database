import http.server
import socketserver
from conexao import Conexao
import signal

class PythonProcessing:
    """
    Classe responsável pelo processamento do arquivo e execução de consultas SQL.
    """

    def arquivo(self, nome='index.html', query='select * from venda'):
        """
        Processa o arquivo especificado, substituindo a tag '<ColocarTabelaAqui>' pelo resultado de uma consulta SQL.

        Parâmetros:
        - nome (str): O nome do arquivo a ser processado. O padrão é 'index.html'.
        - query (str): A consulta SQL a ser executada. O padrão é 'select * from venda'.

        Retorna:
        - str: O conteúdo do arquivo processado com a tabela substituída pelos resultados da consulta SQL.
        """
        try:
            conexao = Conexao()
            tabela = conexao.get_data(sql=query)
            conexao.close()
            lines = ''
            with open(nome, 'r') as file:
                for line in file:
                    line = line.replace('<ColocarTabelaAqui>', tabela)
                    lines += str(line)
            return lines
        except ValueError as error:
            print(error)


class GerenciaRequisicao(http.server.SimpleHTTPRequestHandler):
    """
    Classe responsável por gerenciar as requisições HTTP e enviar as respostas correspondentes.
    """

    def do_GET(self):
        """
        Manipula a requisição GET, enviando o arquivo processado como resposta.
        """
        file = PythonProcessing()
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        self.wfile.write(file.arquivo().encode())


class ServidorIFMS:
    """
    Classe responsável por iniciar o servidor web e tratar o encerramento correto.
    """

    def __init__(self):
        """
        Inicializa uma nova instância do servidor IFMS.

        Inicia o servidor web na porta 9009, gerenciando as requisições com a classe GerenciaRequisicao.
        Registra um manipulador de sinal para lidar com o encerramento correto do servidor.
        """
        try:
            port = 9009
            handler = GerenciaRequisicao
            with socketserver.TCPServer(("", port), handler) as self.server:
                print(f"Rodando na Porta {port}")
                signal.signal(signal.SIGINT, self.shutdown_handler)
                self.server.serve_forever()
        except ValueError as error:
            print(error)

    def shutdown_handler(self, signal, frame):
        """
        Manipulador de sinal para encerrar corretamente o servidor.

        Parâmetros:
        - signal: O sinal recebido.
        - frame: O quadro atual.
        """
        print("Fechando o servidor")
        self.server.server_close()

serverOn = ServidorIFMS()