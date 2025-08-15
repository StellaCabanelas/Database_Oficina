-- Criação do banco de dados
CREATE DATABASE oficina;
USE oficina;

-- Tabela Clientes
CREATE TABLE clientes (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    endereco VARCHAR(100),
    telefone CHAR(11)
);

-- Tabela Veículos
CREATE TABLE veiculos (
    idVeiculo INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(50) NOT NULL,
    ano CHAR(4),
    marca VARCHAR(30),
    idCliente INT NOT NULL,
    CONSTRAINT fk_veiculo_cliente FOREIGN KEY (idCliente) REFERENCES clientes(idCliente)
);

-- Tabela Mecânicos
CREATE TABLE mecanicos (
    idMecanico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    endereco VARCHAR(100),
    especialidade VARCHAR(50)
);

-- Tabela Serviços
CREATE TABLE servicos (
    idServico INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    valor DECIMAL(10,2) NOT NULL
);

-- Tabela Peças
CREATE TABLE pecas (
    idPeca INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    valor DECIMAL(10,2) NOT NULL
);

-- Tabela Ordem de Serviço
CREATE TABLE ordem_servico (
    idOS INT AUTO_INCREMENT PRIMARY KEY,
    idVeiculo INT NOT NULL,
    idMecanico INT NOT NULL,
    data_emissao DATE NOT NULL,
    valor_total DECIMAL(10,2),
    data_conclusao DATE,
    numero_os VARCHAR(15) UNIQUE NOT NULL,
    status ENUM('iniciar', 'em andamento', 'finalizada') DEFAULT 'iniciar',
    CONSTRAINT fk_os_veiculo FOREIGN KEY (idVeiculo) REFERENCES veiculos(idVeiculo),
    CONSTRAINT fk_os_mecanico FOREIGN KEY (idMecanico) REFERENCES mecanicos(idMecanico)
);

-- Tabela OS_Serviços (ligação N:N entre ordem de serviço e serviços)
CREATE TABLE os_servicos (
    idOS INT,
    idServico INT,
    quantidade INT DEFAULT 1,
    PRIMARY KEY (idOS, idServico),
    CONSTRAINT fk_osservico_os FOREIGN KEY (idOS) REFERENCES ordem_servico(idOS),
    CONSTRAINT fk_osservico_servico FOREIGN KEY (idServico) REFERENCES servicos(idServico)
);

-- Tabela OS_Peças (ligação N:N entre ordem de serviço e peças)
CREATE TABLE os_pecas (
    idOS INT,
    idPeca INT,
    quantidade INT DEFAULT 1,
    PRIMARY KEY (idOS, idPeca),
    CONSTRAINT fk_ospeca_os FOREIGN KEY (idOS) REFERENCES ordem_servico(idOS),
    CONSTRAINT fk_ospeca_peca FOREIGN KEY (idPeca) REFERENCES pecas(idPeca)
);

