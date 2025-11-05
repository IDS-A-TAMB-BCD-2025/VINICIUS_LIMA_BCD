CREATE DATABASE IF NOT EXISTS BD_ENQUETES;
USE BD_ENQUETES;

CREATE TABLE IF NOT EXISTS USUARIO(
	USU_CODIGO INTEGER AUTO_INCREMENT,
    USU_DATA_CADASTRO DATE NOT NULL,
    USU_LOGIN VARCHAR(255) NOT NULL UNIQUE,
    USU_AREA_ATUACAO VARCHAR(500),
    USU_PROFISSAO VARCHAR(200),
    USU_AREA_FORMACAO VARCHAR(500),
    USU_DATANASC DATE NOT NULL,
    USU_ESTADO_CIVIL ENUM("SOLTEIRO","CASADO","DIVORCIADO","VIÚVO") NOT NULL,
    USU_ESTADO VARCHAR(2) NOT NULL,
    USU_ESCOLARIDADE ENUM("FUNDAMENTAL","MÉDIO","SUPERIOR") NOT NULL,
    USU_EMAIL VARCHAR(255) NOT NULL UNIQUE,
    USU_SENHA VARCHAR(255) NOT NULL,
    USU_NOME VARCHAR(255) NOT NULL,
    PRIMARY KEY(USU_CODIGO)
);

CREATE TABLE IF NOT EXISTS ENQUETE(
	ENQ_CODIGO INTEGER AUTO_INCREMENT,
    ENQ_DATA_FINAL DATE,
    ENQ_DATA_INICIAL DATE NOT NULL,
    ENQ_DESCRICAO VARCHAR(255) NOT NULL,
    ENQ_NOME VARCHAR(255) NOT NULL,
    FK_USU_CODIGO INTEGER NOT NULL,
    PRIMARY KEY (ENQ_CODIGO),
    FOREIGN KEY (FK_USU_CODIGO) REFERENCES USUARIO(USU_CODIGO) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS USUARIO_RESPONDE_ENQUETE(
	URE_CODIGO INTEGER AUTO_INCREMENT,
    URE_DATA DATE NOT NULL,
    FK_USU_CODIGO INTEGER NOT NULL,
    FK_ENQ_CODIGO INTEGER NOT NULL,
    PRIMARY KEY (URE_CODIGO),
    FOREIGN KEY (FK_USU_CODIGO) REFERENCES USUARIO(USU_CODIGO) ON DELETE CASCADE,
    FOREIGN KEY (FK_ENQ_CODIGO) REFERENCES ENQUETE(ENQ_CODIGO) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS PERGUNTAS(
	PER_CODIGO INTEGER AUTO_INCREMENT,
    PER_DESCRICAO VARCHAR(255) NOT NULL UNIQUE,
    FK_ENQ_CODIGO INTEGER NOT NULL,
    PRIMARY KEY (PER_CODIGO),
    FOREIGN KEY (FK_ENQ_CODIGO) REFERENCES ENQUETE(ENQ_CODIGO) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS RESPOSTAS(
	RES_CODIGO INTEGER AUTO_INCREMENT,
    RES_DESCRICAO VARCHAR(255) NOT NULL UNIQUE,
    RES_CERTA VARCHAR(1) NOT NULL,
    FK_PER_CODIGO INTEGER NOT NULL,
    PRIMARY KEY (RES_CODIGO),
    FOREIGN KEY (FK_PER_CODIGO) REFERENCES PERGUNTAS(PER_CODIGO) ON DELETE CASCADE
);

INSERT INTO USUARIO(USU_DATA_CADASTRO,
					USU_LOGIN,
                    USU_AREA_ATUACAO,
                    USU_PROFISSAO,
                    USU_AREA_FORMACAO,
                    USU_DATANASC,
                    USU_ESTADO_CIVIL,
                    USU_ESTADO,
                    USU_ESCOLARIDADE,
                    USU_EMAIL,
                    USU_SENHA,
                    USU_NOME
                    )
VALUES ("2025-10-01","jorgedomorro","Educação","Sociólogo","Ciencias Humanas","2000-03-24","CASADO","SP","SUPERIOR","jorge@email.com","1234","Jorge Almeida Silva");

INSERT INTO USUARIO(USU_DATA_CADASTRO,
					USU_LOGIN,
                    USU_AREA_ATUACAO,
                    USU_PROFISSAO,
                    USU_AREA_FORMACAO,
                    USU_DATANASC,
                    USU_ESTADO_CIVIL,
                    USU_ESTADO,
                    USU_ESCOLARIDADE,
                    USU_EMAIL,
                    USU_SENHA,
                    USU_NOME
                    )
VALUES ("2025-09-01","alicezinha","Educação","Socióloga","Ciencias Sociais","2000-12-02","SOLTEIRO","MG","SUPERIOR","alice@email.com","4356","Alice Aparecida Mêndoa");

INSERT INTO USUARIO(USU_DATA_CADASTRO,
					USU_LOGIN,
                    USU_AREA_ATUACAO,
                    USU_PROFISSAO,
                    USU_AREA_FORMACAO,
                    USU_DATANASC,
                    USU_ESTADO_CIVIL,
                    USU_ESTADO,
                    USU_ESCOLARIDADE,
                    USU_EMAIL,
                    USU_SENHA,
                    USU_NOME
                    )
VALUES ("2025-09-01","amandy0ca","Saúde","Farmacêutica","Farmácia","2003-06-14","SOLTEIRO","SP","SUPERIOR","amanda@email.com","0972","Amanda Buzzlet");

INSERT INTO ENQUETE(ENQ_DATA_FINAL,
                    ENQ_DATA_INICIAL,
                    ENQ_DESCRICAO,
                    ENQ_NOME,
                    FK_USU_CODIGO
                    )
VALUES ("2030-10-01","2025-10-01","Diga, em sua opinião, qual o melhor funcionário de se trabalhar com.","Familiaridade entre Funcionários",1);

INSERT INTO ENQUETE(ENQ_DATA_FINAL,
                    ENQ_DATA_INICIAL,
                    ENQ_DESCRICAO,
                    ENQ_NOME,
                    FK_USU_CODIGO
                    )
VALUES ("2030-10-01","2025-10-01","Diga, em sua opinião, qual a melhor área de atuação e porquê.","Familiaridade na Área de Atuação",2);

INSERT INTO ENQUETE(ENQ_DATA_FINAL,
                    ENQ_DATA_INICIAL,
                    ENQ_DESCRICAO,
                    ENQ_NOME,
                    FK_USU_CODIGO
                    )
VALUES ("2030-10-01","2025-10-01","Diga, em sua opinião, como você se sente em relação à empresa em que trabalha","Auto-estima Empresarial",3);

INSERT INTO PERGUNTAS(PER_DESCRICAO,
					  FK_ENQ_CODIGO
                      )
VALUES ("Diga pontos importantes que um funcionário precisa trabalhar para se tornar uma pessoa agradável.",1);

INSERT INTO PERGUNTAS(PER_DESCRICAO,
					  FK_ENQ_CODIGO
                      )
VALUES ("Diga qual a área de atuação que você mais se familiariza",2);

INSERT INTO PERGUNTAS(PER_DESCRICAO,
					  FK_ENQ_CODIGO
                      )
VALUES ("Se expresse, se abra para avaliarmos nossos serviços.",3);

INSERT INTO RESPOSTAS(RES_DESCRICAO,
					  RES_CERTA,
                      FK_PER_CODIGO
					  )
VALUES ("blablablaba","S",1);

INSERT INTO RESPOSTAS(RES_DESCRICAO,
					  RES_CERTA,
                      FK_PER_CODIGO
					  )
VALUES ("blablablaoa","S",2);

INSERT INTO RESPOSTAS(RES_DESCRICAO,
					  RES_CERTA,
                      FK_PER_CODIGO
					  )
VALUES ("blablaelaba","S",3);

INSERT INTO USUARIO_RESPONDE_ENQUETE(URE_DATA,
									 FK_USU_CODIGO,
                                     FK_ENQ_CODIGO
									 )
VALUES ("2025-10-03",1,1);

INSERT INTO USUARIO_RESPONDE_ENQUETE(URE_DATA,
									 FK_USU_CODIGO,
                                     FK_ENQ_CODIGO
									 )
VALUES ("2025-10-05",2,2);

INSERT INTO USUARIO_RESPONDE_ENQUETE(URE_DATA,
									 FK_USU_CODIGO,
                                     FK_ENQ_CODIGO
									 )
VALUES ("2025-10-09",3,3);

SELECT * FROM ENQUETE;
SELECT * FROM PERGUNTAS;
SELECT * FROM USUARIO;
SELECT * FROM RESPOSTAS;
SELECT * FROM USUARIO_RESPONDE_ENQUETE;