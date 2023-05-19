import mysql.connector

class Conexao:
    """
    Classe para estabelecer uma conexão com um banco de dados MySQL e executar consultas SQL.
    """

    def __init__(self, host='localhost', user='jr', password='root', database='aula2'):
        """
        Inicializa uma nova instância da classe Conexao.

        Parâmetros:
        - host (str): O endereço do host onde o banco de dados está sendo executado. O padrão é 'localhost'.
        - user (str): O nome de usuário para autenticação no banco de dados. O padrão é 'jr'.
        - password (str): A senha do usuário para autenticação no banco de dados. O padrão é 'root'.
        - database (str): O nome do banco de dados a ser usado. O padrão é 'aula2'.
        """
        try:
            self.connection = mysql.connector.connect(
                host=host,
                user=user,
                password=password,
                database=database
            )

            if self.connection.is_connected():
                print("Conexão estabelecida com sucesso!")

        except mysql.connector.Error as error:
            print("Erro ao conectar ao banco de dados MySQL:", error)

    def close(self):
        """
        Fecha a conexão com o banco de dados.
        """
        try:
            self.connection.close()
        except ValueError as error:
            print(error)

    def get_data(self, sql):
        """
        Executa uma consulta SQL no banco de dados e retorna os resultados como uma tabela HTML.

        Parâmetros:
        - sql (str): A consulta SQL a ser executada.

        Retorna:
        - str: Uma representação em forma de tabela HTML dos resultados da consulta.
        """
        try:
            cursor = self.connection.cursor()
            cursor.execute(sql)
            rows = cursor.fetchall()

            # Inicia a estrutura de uma tabela no HTML
            html_table = "<table>\n"
            html_table += "<tr>\n"

            # Pegar o nome das colunas
            column_names = [desc[0] for desc in cursor.description]

            # Cria o cabeçalho
            for column_name in column_names:
                html_table += f"<th>{column_name}</th>"
            html_table += "</tr>\n"

            # Criar as linhas
            for row in rows:
                html_table += "<tr>\n"
                for value in row:
                    html_table += f"<td>{value}</td>\n"
                html_table += "</tr>\n"

            html_table += "</table>"
            return html_table

        except ValueError as error:
            print(error)
