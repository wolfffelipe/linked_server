# ❝ Linked Server ❞

* Linked Server é uma funcionalidade do SQL Server muito útil para estabelecer conexão segura entre dois ou mais servidores.


## 🔥 Requisitos

1. Para teste, instale duas instâncias do Sql Server no seu computador.
2. Uma será a instância Default e a outra uma instância Nomeada


## 🔥 Passos

1. Em uma das instâncias (vamos fazer na Default como teste), crie um banco (aqui no repositório, para treinamento, estou deixando um backup de um algumas tabelas do AdventureWorks).
2. Vamos criar o Linked Server por tela, caso prefira por comando, utilize o link no final do Read Me.
3. Para a criação, vamos utilizar a instância Nomeada e vá ao Pesquisador de Objetos do SSMS e navegue até: [banco] > Objetos de Servidor > Servidores Vinculados.
4. Clique com o botão direito e escolha "Novo Servidor Vinculado".
5. Escolha um nome e a opção SQL Server.
6. Em segurança habilite a opção "Serão feitas usando o contexto de segurança atual do logon (para isso, o login dos dois bancos devem ser o mesmo, para facilitar, utilize Autenticação do Windows).
7. Agora com o Linked Server criado, podemos acessar o banco da instância Default diretamente da instância Nomeada.
8. Como exemplo, uma query de inserção está no repositório (*query_ls_insert.sql*).


## 👍 Continue o estudo

https://docs.microsoft.com/pt-br/sql/relational-databases/linked-servers/create-linked-servers-sql-server-database-engine?view=sql-server-ver15




