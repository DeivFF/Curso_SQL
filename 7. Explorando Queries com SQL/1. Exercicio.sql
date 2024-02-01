/*

RecursosHumanos.Departamento: Esta tabela contém informações sobre os departamentos da empresa, como nome do departamento, ID do departamento, etc.

RecursosHumanos.Funcionario: Esta tabela armazena informações sobre os funcionários da empresa, incluindo detalhes como nome, ID do funcionário, cargo, data de contratação, etc.

RecursosHumanos.HistoricoDepartamentoFuncionario: Registra o histórico de associação de funcionários a departamentos ao longo do tempo, mantendo registros de datas de início e término de cada associação.

RecursosHumanos.HistoricoPagamento: Contém informações sobre o histórico de pagamentos dos funcionários, incluindo detalhes como ID do funcionário, data do pagamento, tipo de pagamento, etc.

RecursosHumanos.CandidatoVaga: Armazena detalhes sobre os candidatos a emprego, como nome, endereço, currículo, etc.

RecursosHumanos.Turno: Contém informações sobre os turnos de trabalho dos funcionários, incluindo detalhes como horário de início, horário de término, etc.

Pessoa.Endereço: Esta tabela mantém registros de endereços, incluindo detalhes como rua, cidade, estado, código postal, etc.

Pessoa.TipoEndereco: Contém os tipos de endereço disponíveis, como "Residencial", "Comercial", etc.

Pessoa.EntidadeNegocio: Armazena informações básicas sobre as entidades comerciais, como ID da entidade, tipo de entidade, etc.

Pessoa.EnderecoEntidadeNegocio: Mantém o relacionamento entre entidades comerciais e endereços, especificando quais endereços estão associados a quais entidades.

Pessoa.ContatoEntidadeNegocio: Registra os contatos associados a cada entidade comercial, como endereço de e-mail, número de telefone, etc.

*/

-- O departamento de recursos humanos precisa de uma lista de todas as pessoas cujo nome começa com a letra 'A'.
SELECT * FROM Pessoa.Pessoa
WHERE PrimeiroNome LIKE 'A%'

-- A equipe de marketing está interessada em todos os contatos cujo Último nome termina com a letra 'S'.
SELECT * FROM Pessoa.Pessoa
WHERE UltimoNome LIKE '%S'

-- Precisamos encontrar o codigo postal dos endereços que contenham 4 caracter.
SELECT * FROM Pessoa.Endereco
WHERE CodigoPostal LIKE '____'

-- O departamento de vendas quer identificar todos os PrimeiroNome que tenham as letras 'ch' em qualquer posição.
SELECT * FROM Pessoa.Pessoa
WHERE PrimeiroNome LIKE '%CH%'

-- A equipe de suporte técnico está buscando contatos cujos PrimeiroNome tenham a letra 'T' na segunda posição."
SELECT * FROM Pessoa.Pessoa
WHERE PrimeiroNome LIKE '_T%'

-- A equipe de suporte técnico está buscando contatos cujos PrimeiroNome não tenham a letra 'T' na segunda posição."
SELECT * FROM Pessoa.Pessoa
WHERE PrimeiroNome NOT LIKE '_T%'

-- Encontre todos os contatos cujos nomes tenham pelo menos cinco caracteres e terminem com a letra 'a'.
SELECT * FROM Pessoa.Pessoa
WHERE PrimeiroNome LIKE '%____a'

-- Liste todos os endereços que tenham comprimento de pelo menos 10 posições e termine com 've', independentemente de maiúsculas ou minúsculas.
SELECT * FROM Pessoa.Endereco
WHERE Endereco01 LIKE '%________ve'

-- Identifique todos os contatos cujos sobrenomes comecem com a letra 'S' e tenham exatamente seis caracteres.
SELECT * FROM Pessoa.Pessoa
WHERE UltimoNome LIKE 'S_____'

-- Encontre os endereços que tenham o código postal iniciado com '90'.
SELECT * FROM Pessoa.Endereco
WHERE CodigoPostal LIKE '90%'

-- Liste os contatos cujos nomes tenham a letra 'e' na segunda e na última posição.
SELECT * FROM Pessoa.Pessoa
WHERE PrimeiroNome LIKE '_e%e'

-- Identifique os contatos cujos nomes tenham a letra 'r' na terceira posição e a letra 'a' na última posição.
SELECT * FROM Pessoa.Pessoa
WHERE PrimeiroNome LIKE '__r%a'

-- Encontre os endereços que contenham o número '123' em qualquer posição.
SELECT * FROM Pessoa.Endereco
WHERE Endereco01 LIKE '%123%'