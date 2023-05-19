import mysql.connector
class Conexao:
    # Install: pip install mysql-connector-python
    def __init__(self, host='localhost',user='jr', password='root',database='aula2'):
        try:
            self.connection = mysql.connector.connect(host=host,user=user,
                password=password,
                database=database)

            if self.connection.is_connected():
                print("Connection established successfully!")

        except mysql.connector.Error as error:
            print("Error connecting to MySQL database:", error)
    def close(self):
        try:self.connection.close()
        except ValueError as error:
            print(error)
    
    def get_data(self, sql='select * from produto;'):
        try:
            cursor = self.connection.cursor()
            cursor.execute(sql)
            rows = cursor.fetchall()
            # Inicia a estrutura de uma tabela no html
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
