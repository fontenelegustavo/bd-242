CREATE TABLE TB_LINHAS_PRODUTO (
  id INT AUTO_INCREMENT,
  descricao_texto VARCHAR(4000) DEFAULT NULL,
  descricao_html MEDIUMTEXT,
  imagem MEDIUMBLOB,
  PRIMARY KEY (id)
);

CREATE TABLE TB_PRODUTOS (
  id INT AUTO_INCREMENT,
  nome VARCHAR(70) NOT NULL,
  linha_produto_id INT NOT NULL,
  escala VARCHAR(10) NOT NULL,
  fornecedor VARCHAR(50) NOT NULL,
  descricao TEXT NOT NULL,
  quantidade_estoque SMALLINT(6) NOT NULL,
  preco_compra DECIMAL(10,2) NOT NULL,
  preco_sugerido DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (linha_produto_id) REFERENCES TB_LINHAS_PRODUTO (id)
);

CREATE TABLE TB_ESCRITORIOS (
  id INT AUTO_INCREMENT,
  cidade VARCHAR(50) NOT NULL,
  telefone VARCHAR(50) NOT NULL,
  endereco1 VARCHAR(50) NOT NULL,
  endereco2 VARCHAR(50) DEFAULT NULL,
  estado VARCHAR(50) DEFAULT NULL,
  pais VARCHAR(50) NOT NULL,
  codigo_postal VARCHAR(15) NOT NULL,
  territorio VARCHAR(10) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE TB_FUNCIONARIOS (
  id INT AUTO_INCREMENT,
  sobrenome VARCHAR(50) NOT NULL,
  nome VARCHAR(50) NOT NULL,
  ramal VARCHAR(10) NOT NULL,
  email VARCHAR(100) NOT NULL,
  escritorio_id INT NOT NULL,
  supervisor_id INT DEFAULT NULL,
  cargo VARCHAR(50) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (supervisor_id) REFERENCES TB_FUNCIONARIOS (id),
  FOREIGN KEY (escritorio_id) REFERENCES TB_ESCRITORIOS (id)
);

CREATE TABLE TB_CLIENTES (
  id INT AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  contato_sobrenome VARCHAR(50) NOT NULL,
  contato_nome VARCHAR(50) NOT NULL,
  telefone VARCHAR(50) NOT NULL,
  endereco1 VARCHAR(50) NOT NULL,
  endereco2 VARCHAR(50) DEFAULT NULL,
  cidade VARCHAR(50) NOT NULL,
  estado VARCHAR(50) DEFAULT NULL,
  codigo_postal VARCHAR(15) DEFAULT NULL,
  pais VARCHAR(50) NOT NULL,
  representante_vendas_id INT DEFAULT NULL,
  limite_credito DECIMAL(10,2) DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (representante_vendas_id) REFERENCES TB_FUNCIONARIOS (id)
);

CREATE TABLE TB_PAGAMENTOS (
  cliente_id INT,
  cheque_numero VARCHAR(50) NOT NULL,
  data_pagamento DATE NOT NULL,
  valor DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (cliente_id, cheque_numero),
  FOREIGN KEY (cliente_id) REFERENCES TB_CLIENTES (id)
);

CREATE TABLE TB_PEDIDOS (
  id INT AUTO_INCREMENT,
  data_pedido DATE NOT NULL,
  data_requerida DATE NOT NULL,
  data_envio DATE DEFAULT NULL,
  status VARCHAR(15) NOT NULL,
  comentarios TEXT,
  cliente_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (cliente_id) REFERENCES TB_CLIENTES (id)
);

CREATE TABLE TB_DETALHES_PEDIDO (
  pedido_id INT,
  produto_id INT NOT NULL,
  quantidade INT NOT NULL,
  preco_unitario DECIMAL(10,2) NOT NULL,
  numero_linha SMALLINT(6) NOT NULL,
  PRIMARY KEY (pedido_id, produto_id),
  FOREIGN KEY (pedido_id) REFERENCES TB_PEDIDOS (id),
  FOREIGN KEY (produto_id) REFERENCES TB_PRODUTOS (id)
);

INSERT INTO TB_LINHAS_PRODUTO (descricao_texto, descricao_html, imagem)
  VALUES ('Cubos mágicos', '<p>Cubos Mágicos Puzzle Colorido</p>', NULL);

INSERT INTO TB_PRODUTOS (nome, linha_produto_id, escala, fornecedor, descricao, quantidade_estoque, preco_compra, preco_sugerido) 
  VALUES ('Cubo Mágico MegaBrain', 1, 1, 'MegaBrain Inc.', 'Cubo mágico desafiador da MegaBrain', 20, 50.00, 100.00);

INSERT INTO TB_ESCRITORIOS (cidade, telefone, endereco1, endereco2, estado, pais, codigo_postal, territorio) 
  VALUES ('Fortaleza', '(83)99999-9999', 'Av. Guararapes, 1234', NULL, 'CE', 'Brasil', '01234-123', 'Nordeste');

INSERT INTO TB_FUNCIONARIOS (sobrenome, nome, ramal, email, escritorio_id, supervisor_id, cargo) 
  VALUES ('Silva', 'Joao', '1234', 'joaosilva@empresa.com', 1, NULL, 'Atendente');

INSERT INTO TB_CLIENTES (nome, contato_sobrenome, contato_nome, telefone, endereco1, endereco2, cidade, estado, codigo_postal, pais, representante_vendas_id, limite_credito) 
  VALUES ('Paulo', 'Oliveira', 'Paulo Oliveira Cliente', '(85)97777-8888', 'Rua da Felicidade, 197', NULL, 'Fortaleza', 'CE', '01000-000', 'Brasil', 1, 2500.00);

INSERT INTO TB_PAGAMENTOS (cliente_id, cheque_numero, data_pagamento, valor) 
  VALUES (1, 'NHK365', '2024-01-31', 500.00);

INSERT INTO TB_PEDIDOS (data_pedido, data_requerida, data_envio, status, comentarios, cliente_id) 
  VALUES ('2024-02-01', '2024-02-20', '2024-02-05', 'A caminho', 'Pedido no trajeto.', 1);

INSERT INTO TB_DETALHES_PEDIDO (pedido_id, produto_id, quantidade, preco_unitario, numero_linha) 
  VALUES (1, 1, 2, 100.00, 1);

SELECT * FROM TB_LINHAS_PRODUTO;
SELECT * FROM TB_PRODUTOS;
SELECT * FROM TB_ESCRITORIOS;
SELECT * FROM TB_FUNCIONARIOS;
SELECT * FROM TB_CLIENTES;
SELECT * FROM TB_PAGAMENTOS;
SELECT * FROM TB_PEDIDOS;
SELECT * FROM TB_DETALHES_PEDIDO;

UPDATE TB_LINHAS_PRODUTO SET descricao_texto = 'Cubos Mágicos Puzzle Colorido' WHERE id = 1;
UPDATE TB_PRODUTOS SET preco_sugerido = 110.00 WHERE id = 1;
UPDATE TB_ESCRITORIOS SET telefone = '(85)96996-9999' WHERE id = 1;
UPDATE TB_FUNCIONARIOS SET cargo = 'Supervisor' WHERE id = 1;
UPDATE TB_CLIENTES SET limite_credito = 8000.00 WHERE id = 1;

DELETE FROM TB_DETALHES_PEDIDO WHERE 0;
