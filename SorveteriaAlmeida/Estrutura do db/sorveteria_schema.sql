
CREATE DATABASE sorveteria;
USE sorveteria;

CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY,
    nome VARCHAR(255),
    email VARCHAR(255),
    telefone VARCHAR(255),
    data_nascimento DATE
);

CREATE TABLE Enderecos (
    endereco_id INT PRIMARY KEY,
    rua VARCHAR(255),
    numero VARCHAR(255),
    complemento VARCHAR(255),
    bairro VARCHAR(255),
    cidade VARCHAR(255),
    estado VARCHAR(255),
    cep VARCHAR(255)
);

CREATE TABLE ClienteEndereco (
    cliente_id INT,
    endereco_id INT,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
    FOREIGN KEY (endereco_id) REFERENCES Enderecos(endereco_id)
);

CREATE TABLE Funcionarios (
    funcionario_id INT PRIMARY KEY,
    nome VARCHAR(255),
    cargo VARCHAR(255),
    data_contratacao DATE,
    nivel_experiencia VARCHAR(255),
    qualificacoes VARCHAR(255)
);

CREATE TABLE Produtos (
    produto_id INT PRIMARY KEY,
    nome VARCHAR(255),
    categoria VARCHAR(255),
    preco DECIMAL(10,2)
);

CREATE TABLE Pedidos (
    pedido_id INT PRIMARY KEY,
    cliente_id INT,
    funcionario_id INT,
    data_pedido DATE,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
    FOREIGN KEY (funcionario_id) REFERENCES Funcionarios(funcionario_id)
);

CREATE TABLE ItensPedido (
    item_id INT PRIMARY KEY,
    pedido_id INT,
    produto_id INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(pedido_id),
    FOREIGN KEY (produto_id) REFERENCES Produtos(produto_id)
);
