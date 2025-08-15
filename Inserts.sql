-- Inserts para o banco de dados

INSERT INTO clientes (nome, cpf, endereco, telefone) VALUES
					('João Silva', '12345678901', 'Rua A, 123, Salvador', '71988887777'),
					('Maria Oliveira', '23456789012', 'Av. B, 456, Salvador', '71999998888'),
					('Carlos Souza', '34567890123', 'Rua C, 789, Salvador', '71977776666');

INSERT INTO veiculos (modelo, ano, marca, idCliente) VALUES
					('Gol', '2015', 'Volkswagen', 1),
					('Onix', '2018', 'Chevrolet', 2),
					('Civic', '2020', 'Honda', 3);

INSERT INTO mecanicos (nome, endereco, especialidade) VALUES
					('Pedro Santos', 'Rua D, 10, Salvador', 'Motor'),
					('Lucas Lima', 'Av. E, 20, Salvador', 'Elétrica'),
					('Rafael Costa', 'Rua F, 30, Salvador', 'Suspensão');

INSERT INTO servicos (descricao, valor) VALUES
					('Troca de óleo', 150.00),
					('Alinhamento e balanceamento', 200.00),
					('Revisão de freios', 300.00);

INSERT INTO pecas (descricao, valor) VALUES
				('Filtro de óleo', 50.00),
				('Pastilha de freio', 120.00),
				('Bateria 60Ah', 350.00);

INSERT INTO ordem_servico (idVeiculo, idMecanico, data_emissao, valor_total, data_conclusao, numero_os, status) VALUES
							(1, 1, '2025-08-01', 200.00, '2025-08-03', 'OS1001', 'finalizada'),
							(2, 2, '2025-08-05', 450.00, NULL, 'OS1002', 'em andamento'),
							(3, 3, '2025-08-10', 300.00, NULL, 'OS1003', 'iniciar');

INSERT INTO os_servicos (idOS, idServico, quantidade) VALUES
						(1, 1, 1),
						(1, 2, 1),
						(2, 3, 1),
						(3, 2, 1);

INSERT INTO os_pecas (idOS, idPeca, quantidade) VALUES
					(1, 1, 1),
					(1, 2, 4),
					(2, 3, 1),
					(3, 2, 2);

show tables;