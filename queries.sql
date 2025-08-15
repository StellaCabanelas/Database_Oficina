-- Recupera todos os clientes
SELECT * FROM clientes;

-- Recupera o nome e telefone dos mecânicos
SELECT nome FROM mecanicos;

-- Clientes que moram em 'Salvador'
SELECT nome, endereco FROM clientes
WHERE endereco LIKE '%Salvador%';

-- Veículos de marca 'Toyota' fabricados após 2015
SELECT modelo, marca, ano FROM veiculos
WHERE marca = 'Honda' AND ano > '2015';

-- Ordem de serviço com cálculo de dias até a conclusão
SELECT numero_os, DATEDIFF(data_conclusao, data_emissao) AS dias_para_concluir
FROM ordem_servico;

-- Valor total por serviço multiplicando quantidade
SELECT os.idOS, s.descricao, os.quantidade, (s.valor * os.quantidade) AS valor_total_servico
FROM os_servicos os
JOIN servicos s ON os.idServico = s.idServico;

-- Clientes ordenados por nome
SELECT nome, cpf FROM clientes
ORDER BY nome ASC;

-- Ordens de serviço por valor total decrescente
SELECT numero_os, valor_total FROM ordem_servico
ORDER BY valor_total DESC;

-- Quantidade de serviços por ordem, mostrando apenas ordens com mais de 2 serviços
SELECT idOS, COUNT(idServico) AS total_servicos
FROM os_servicos
GROUP BY idOS
HAVING COUNT(idServico) > 2;

-- Valor total de peças por ordem, apenas ordens com mais de R$1000
SELECT os.idOS, SUM(p.valor * os.quantidade) AS total_pecas
FROM os_pecas os
JOIN pecas p ON os.idPeca = p.idPeca
GROUP BY os.idOS
HAVING SUM(p.valor * os.quantidade) > 1000;

-- Listar ordens de serviço com cliente e veículo
SELECT os.numero_os, c.nome AS cliente, v.modelo AS veiculo
FROM ordem_servico os
JOIN veiculos v ON os.idVeiculo = v.idVeiculo
JOIN clientes c ON v.idCliente = c.idCliente;

-- Listar serviços e peças de cada ordem
SELECT os.numero_os, s.descricao AS servico, p.descricao AS peca
FROM ordem_servico os
LEFT JOIN os_servicos oss ON os.idOS = oss.idOS
LEFT JOIN servicos s ON oss.idServico = s.idServico
LEFT JOIN os_pecas op ON os.idOS = op.idOS
LEFT JOIN pecas p ON op.idPeca = p.idPeca;
