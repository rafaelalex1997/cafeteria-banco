-- Criação da tabela produtos
CREATE TABLE produtos (
  id_produto INT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  preco DECIMAL(10,2) NOT NULL,
  estoque INT NOT NULL
);

-- Inserção de produtos
INSERT INTO produtos (id_produto, nome, preco, estoque) VALUES
(1, 'Café Expresso', 5.50, 100),
(2, 'Cappuccino', 7.00, 80),
(3, 'Pão de Queijo', 4.00, 50);

-- Criação da tabela pedidos
CREATE TABLE pedidos (
  id_pedido INT PRIMARY KEY,
  id_produto INT,
  quantidade INT,
  data_pedido DATE,
  FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- Inserção de pedidos
INSERT INTO pedidos (id_pedido, id_produto, quantidade, data_pedido) VALUES
(1, 1, 2, '2025-05-14'),
(2, 3, 1, '2025-05-15'),
(3, 2, 3, '2025-05-15');

-- Atualização de estoque
UPDATE produtos SET estoque = estoque - 2 WHERE id_produto = 1;

-- Remoção de um produto
DELETE FROM produtos WHERE id_produto = 3;

-- Consulta: listar todos os pedidos com nomes dos produtos
SELECT pedidos.id_pedido, produtos.nome, pedidos.quantidade, pedidos.data_pedido
FROM pedidos
JOIN produtos ON pedidos.id_produto = produtos.id_produto;
