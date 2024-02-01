/*

RecursosHumanos.Departamento: Esta tabela cont�m informa��es sobre os departamentos da empresa, como nome do departamento, ID do departamento, etc.

RecursosHumanos.Funcionario: Esta tabela armazena informa��es sobre os funcion�rios da empresa, incluindo detalhes como nome, ID do funcion�rio, cargo, data de contrata��o, etc.

RecursosHumanos.HistoricoDepartamentoFuncionario: Registra o hist�rico de associa��o de funcion�rios a departamentos ao longo do tempo, mantendo registros de datas de in�cio e t�rmino de cada associa��o.

RecursosHumanos.HistoricoPagamento: Cont�m informa��es sobre o hist�rico de pagamentos dos funcion�rios, incluindo detalhes como ID do funcion�rio, data do pagamento, tipo de pagamento, etc.

RecursosHumanos.CandidatoVaga: Armazena detalhes sobre os candidatos a emprego, como nome, endere�o, curr�culo, etc.

RecursosHumanos.Turno: Cont�m informa��es sobre os turnos de trabalho dos funcion�rios, incluindo detalhes como hor�rio de in�cio, hor�rio de t�rmino, etc.

Pessoa.Endere�o: Esta tabela mant�m registros de endere�os, incluindo detalhes como rua, cidade, estado, c�digo postal, etc.

Pessoa.TipoEndereco: Cont�m os tipos de endere�o dispon�veis, como "Residencial", "Comercial", etc.

Pessoa.EntidadeNegocio: Armazena informa��es b�sicas sobre as entidades comerciais, como ID da entidade, tipo de entidade, etc.

Pessoa.EnderecoEntidadeNegocio: Mant�m o relacionamento entre entidades comerciais e endere�os, especificando quais endere�os est�o associados a quais entidades.

Pessoa.ContatoEntidadeNegocio: Registra os contatos associados a cada entidade comercial, como endere�o de e-mail, n�mero de telefone, etc.

*/

-- O departamento de recursos humanos precisa de uma lista de todas as pessoas cujo nome come�a com a letra 'A'.
SELECT * FROM Pessoa.Pessoa
WHERE PrimeiroNome LIKE 'A%'

-- A equipe de marketing est� interessada em todos os contatos cujo �ltimo nome termina com a letra 'S'.
SELECT * FROM Pessoa.Pessoa
WHERE UltimoNome LIKE '%S'

-- Precisamos encontrar o codigo postal dos endere�os que contenham 4 caracter.
SELECT * FROM Pessoa.Endereco
WHERE CodigoPostal LIKE '____'

-- O departamento de vendas quer identificar todos os PrimeiroNome que tenham as letras 'ch' em qualquer posi��o.
SELECT * FROM Pessoa.Pessoa
WHERE PrimeiroNome LIKE '%CH%'

-- A equipe de suporte t�cnico est� buscando contatos cujos PrimeiroNome tenham a letra 'T' na segunda posi��o."
SELECT * FROM Pessoa.Pessoa
WHERE PrimeiroNome LIKE '_T%'

-- A equipe de suporte t�cnico est� buscando contatos cujos PrimeiroNome n�o tenham a letra 'T' na segunda posi��o."
SELECT * FROM Pessoa.Pessoa
WHERE PrimeiroNome NOT LIKE '_T%'

-- Encontre todos os contatos cujos nomes tenham pelo menos cinco caracteres e terminem com a letra 'a'.
SELECT * FROM Pessoa.Pessoa
WHERE PrimeiroNome LIKE '%____a'

-- Liste todos os endere�os que tenham comprimento de pelo menos 10 posi��es e termine com 've', independentemente de mai�sculas ou min�sculas.
SELECT * FROM Pessoa.Endereco
WHERE Endereco01 LIKE '%________ve'

-- Identifique todos os contatos cujos sobrenomes comecem com a letra 'S' e tenham exatamente seis caracteres.
SELECT * FROM Pessoa.Pessoa
WHERE UltimoNome LIKE 'S_____'

-- Encontre os endere�os que tenham o c�digo postal iniciado com '90'.
SELECT * FROM Pessoa.Endereco
WHERE CodigoPostal LIKE '90%'

-- Liste os contatos cujos nomes tenham a letra 'e' na segunda e na �ltima posi��o.
SELECT * FROM Pessoa.Pessoa
WHERE PrimeiroNome LIKE '_e%e'

-- Identifique os contatos cujos nomes tenham a letra 'r' na terceira posi��o e a letra 'a' na �ltima posi��o.
SELECT * FROM Pessoa.Pessoa
WHERE PrimeiroNome LIKE '__r%a'

-- Encontre os endere�os que contenham o n�mero '123' em qualquer posi��o.
SELECT * FROM Pessoa.Endereco
WHERE Endereco01 LIKE '%123%'