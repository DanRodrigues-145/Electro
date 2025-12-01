
CREATE DATABASE Electro;

USE Electro;

--------Tabela Cliente------
CREATE TABLE Cliente (
    id_cliente INT IDENTITY PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20)
);

-------Tabela Endereco------
CREATE TABLE Endereco (
    id_endereco INT IDENTITY PRIMARY KEY,
    id_cliente INT,
    rua VARCHAR(100),
    numero VARCHAR(10),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    estado VARCHAR(2),
    cep VARCHAR(10),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

--------Tabela Produto------------
CREATE TABLE Produto (
    id_produto INT IDENTITY PRIMARY KEY,
    nome VARCHAR(100),
    descricao VARCHAR(200),
    preco VARCHAR(20),
    categoria VARCHAR(50)
);

------Tabela Pedido------
CREATE TABLE Pedido (
    id_pedido INT IDENTITY PRIMARY KEY,
    id_cliente INT,
    data_pedido VARCHAR(20),
    status VARCHAR(20),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

-------Tabela ItemPedido -------
CREATE TABLE ItemPedido (
    id_pedido INT,
    id_produto INT,
    quantidade VARCHAR(10),
    preco_unitario VARCHAR(20),
    PRIMARY KEY (id_pedido, id_produto),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

------- Inserindo Clientes --------
INSERT INTO Cliente (nome, email, telefone) VALUES
('Ana Silva', 'ana.silva@gmail.com', '11987654321'),
('Carlos Pereira', 'carlos.p@hotmail.com', '11999887766'),
('Mariana Costa', 'mariana.c@gmail.com', '11988776655');

------- Inserindo Endereços -------
INSERT INTO Endereco (id_cliente, rua, numero, bairro, cidade, estado, cep) VALUES
(1, 'Rua das Flores', '123', 'Centro', 'São Paulo', 'SP', '01000-000'),
(2, 'Av. Paulista', '1500', 'Bela Vista', 'São Paulo', 'SP', '01310-200'),
(3, 'Rua das Acácias', '45', 'Jardim Europa', 'São Paulo', 'SP', '01430-000');

------- Inserindo Produtos --------
INSERT INTO Produto (nome, descricao, preco, categoria) VALUES
('Geladeira Frost Free', 'Geladeira 400L - Inox', '3500', 'Eletrodomésticos'),
('Ar Condicionado Split', '12000 BTUs Frio', '2200', 'Climatização'),
('Micro-ondas 30L', 'Micro-ondas Espelhado 30L', '700', 'Eletrodomésticos'),
('Ventilador 40cm', 'Ventilador Turbo 6 pás', '200', 'Climatização');

------- Inserindo Pedidos --------
INSERT INTO Pedido (id_cliente, data_pedido, status) VALUES
(1, '2025-10-01', 'Concluído'),
(2, '2025-10-02', 'Pendente'),
(1, '2025-10-05', 'Enviado');

-------- Inserindo Itens dos Pedidos -------
INSERT INTO ItemPedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 1, '1', '3500'),
(1, 3, '1', '700'),
(2, 4, '2', '200'),
(3, 2, '1', '2200');

-------SELECT -----

-------LISTAR CLIENTES ------

SELECT * FROM Cliente
ORDER BY nome ASC;

------ LISTAR ACIMA DE 1000 ------

SELECT nome, preco
FROM Produto
WHERE preco > 1000;

----- PEDIDOS COM NOME DO CLIENTE------

SELECT p.id_pedido, c.nome AS cliente, p.data_pedido, p.status
FROM Pedido p
JOIN Cliente c ON p.id_cliente = c.id_cliente
ORDER BY p.data_pedido;


-------ITENS DO PEDIDO------

SELECT ip.id_pedido, pr.nome AS produto, ip.quantidade, ip.preco_unitario
FROM ItemPedido ip
JOIN Produto pr ON ip.id_produto = pr.id_produto
WHERE ip.id_pedido = 1;

------OS DOIS PRODUTOS MAIS CAROS------

SELECT TOP 2 nome, preco
FROM Produto
ORDER BY preco DESC;

-----------------UPDATE-----------------------

-----ATUALIZAÇÃO DE STATUS DO PEDIDO -----

UPDATE Pedido
SET status = 'Enviado'
WHERE id_pedido = 2;

------TROCAR O PREÇO DE UM ITEM-----

UPDATE Produto
SET preco = '230'
WHERE nome = 'Ventilador 40cm';

------TROCAR UM DADO (TELEFONE) DO CLIENTE------

UPDATE Cliente
SET telefone = '11911112222'
WHERE nome = 'Carlos Pereira';

-----------------DELETE---------------

-----TIRAR ITEM DE PEDIDO-------

DELETE FROM ItemPedido
WHERE id_pedido = 2 AND id_produto = 4;

-------REMOVER UM ENDEREÇO-----

DELETE FROM Endereco
WHERE id_endereco = 3;

-------APAGAR UM PEDIDO SEM ITENS-------

DELETE FROM Produto
WHERE id_produto = 3;