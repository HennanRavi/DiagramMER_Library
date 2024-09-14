CREATE TABLE Usuario (
  matricula INT PRIMARY KEY,
  nome VARCHAR(100),
  endereco VARCHAR(255),
  email VARCHAR(100)
);

CREATE TABLE Autor (
  codigo INT PRIMARY KEY,
  nome VARCHAR(100),
  nacionalidade VARCHAR(50)
);

CREATE TABLE Livro (
  codigo INT PRIMARY KEY,
  titulo VARCHAR(100),
  edicao VARCHAR(50)
);

CREATE TABLE Assunto (
  codigo INT PRIMARY KEY,
  nome VARCHAR(100)
);

CREATE TABLE Subassunto (
  codigo INT PRIMARY KEY,
  nome VARCHAR(100)
);

CREATE TABLE Pegou (
  matricula_usuario INT,
  codigo_livro INT,
  dt_emprestimo DATE,
  dt_devolucao DATE,
  PRIMARY KEY (matricula_usuario, codigo_livro),
  FOREIGN KEY (matricula_usuario) REFERENCES Usuario(matricula),
  FOREIGN KEY (codigo_livro) REFERENCES Livro(codigo)
);

CREATE TABLE Reservou (
  matricula_usuario INT,
  codigo_livro INT,
  dt_reserva DATE,
  PRIMARY KEY (matricula_usuario, codigo_livro),
  FOREIGN KEY (matricula_usuario) REFERENCES Usuario(matricula),
  FOREIGN KEY (codigo_livro) REFERENCES Livro(codigo)
);

CREATE TABLE Classificado (
  codigo_livro INT,
  codigo_assunto INT,
  PRIMARY KEY (codigo_livro, codigo_assunto),
  FOREIGN KEY (codigo_livro) REFERENCES Livro(codigo),
  FOREIGN KEY (codigo_assunto) REFERENCES Assunto(codigo)
);

CREATE TABLE Composto (
  codigo_subassunto INT,
  codigo_assunto INT,
  PRIMARY KEY (codigo_subassunto, codigo_assunto),
  FOREIGN KEY (codigo_subassunto) REFERENCES Subassunto(codigo),
  FOREIGN KEY (codigo_assunto) REFERENCES Assunto(codigo)
);

CREATE TABLE Escreveu (
  codigo_autor INT,
  codigo_livro INT,
  PRIMARY KEY (codigo_autor, codigo_livro),
  FOREIGN KEY (codigo_autor) REFERENCES Autor(codigo),
  FOREIGN KEY (codigo_livro) REFERENCES Livro(codigo)
);
