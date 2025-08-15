# Oficina SQL - Banco de Dados e Queries

Este repositório contém a criação de um **banco de dados para uma oficina mecânica**, incluindo tabelas de clientes, veículos, mecânicos, serviços, peças e ordens de serviço. Além disso, contém exemplos de **queries SQL** cobrindo diferentes operações de análise e manipulação de dados.

---

## Estrutura do Banco de Dados

### Tabelas

1. **Clientes**
   - `idCliente` (PK)
   - `nome`
   - `cpf`
   - `endereco`
   - `telefone`

2. **Veículos**
   - `idVeiculo` (PK)
   - `modelo`
   - `ano`
   - `marca`
   - `idCliente` (FK)

3. **Mecânicos**
   - `idMecanico` (PK)
   - `nome`
   - `endereco`
   - `especialidade`

4. **Serviços**
   - `idServico` (PK)
   - `descricao`
   - `valor`

5. **Peças**
   - `idPeca` (PK)
   - `descricao`
   - `valor`

6. **Ordem de Serviço**
   - `idOS` (PK)
   - `idVeiculo` (FK)
   - `idMecanico` (FK)
   - `data_emissao`
   - `data_conclusao`
   - `valor_total`
   - `numero_os`
   - `status`

7. **OS_Serviços** (ligação N:N)
   - `idOS` (PK)
   - `idServico` (PK)
   - `quantidade`

8. **OS_Peças** (ligação N:N)
   - `idOS` (PK)
   - `idPeca` (PK)
   - `quantidade`

---

## Exemplos de Queries

### 1. Recuperações simples
```sql
SELECT * FROM clientes;
SELECT nome, telefone FROM mecanicos;
