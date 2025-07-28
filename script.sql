-- Criação do banco de dados
CREATE DATABASE ComaBem;
USE ComaBem;

-- Tabela Restaurante
CREATE TABLE Restaurante (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6),
    tipo_culinaria VARCHAR(50)
);

-- Tabela Prato
CREATE TABLE Prato (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    foto TEXT,
    ranking INT CHECK (ranking BETWEEN 1 AND 5),
    recomendacoes TEXT,
    restaurante_id INT,
    FOREIGN KEY (restaurante_id) REFERENCES Restaurante(id)
);


-- Inserir restaurante
INSERT INTO Restaurante (nome, latitude, longitude, tipo_culinaria)
VALUES ('Coma Bem Sushi', -23.9608, -46.3336, 'Japonês');

-- Inserir prato
INSERT INTO Prato (nome, foto, ranking, recomendacoes, restaurante_id)
VALUES ('Sushi Especial', 'sushi.jpg', 5, 'Excelente sabor e apresentação!', 1);


-- Alterar nome do prato
UPDATE Prato
SET nome = 'Sushi Premium'
WHERE id = 1;


-- Consultar pratos com nome do restaurante
SELECT p.nome AS prato, r.nome AS restaurante, p.ranking
FROM Prato p
JOIN Restaurante r ON p.restaurante_id = r.id;


-- Excluir prato
DELETE FROM Prato WHERE id = 1;


-- Criar usuário com acesso limitado
CREATE USER 'usuario_comum'@'localhost' IDENTIFIED BY 'senha123';

-- Conceder apenas permissão de leitura
GRANT SELECT ON ComaBem.* TO 'usuario_comum'@'localhost';

-- Aplicar as permissões
FLUSH PRIVILEGES;
