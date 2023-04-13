CREATE VIEW perfopera AS
SELECT nomeusuario
     , apelidousuario
     , nomeperfilOperacional
     , email
     , nomenacionalidade
     , nomemunicipio
 FROM usuario U
JOIN perfiloperacional PO
  ON U.idperfilOperacional = PO.idperfilOperacional
JOIN perfilsocial PS
  ON U.idusuario = PS.idusuario
JOIN nacionalidade N
  ON PS.idnacionalidade = N.idnacionalidade
JOIN municipio M
  ON PS.naturalidade = M.idmunicipio;
  
SELECT * FROM perfopera
WHERE nomeperfilOperacional LIKE "%visi%";

-- ATIVIDADE 7
-- Parte 1 -Faça uma view que traga informações de usuários e perfil
-- social. (nome, apelido, email, estado civil, dataNasc)
CREATE VIEW PerfilUsuario AS 
SELECT u.nomeusuario,
	u.apelidousuario,
    ps.email,
    ps.estadocivil,
    ps.datanascimento
FROM usuario u
JOIN perfilsocial PS
ON u.idusuario = ps.idusuario;

SELECT * FROM PerfilUsuario;

-- Parte 2 - B- Com os dados do exercício anterior, faça uma consulta
-- para procurar por usuários solteiros.

SELECT nomeusuario 
FROM PerfilUsuario
WHERE estadocivil = "Solteiro";


-- Atividade 8
-- Parte 1 - Faça uma view que obtenha informações de usuários e perfil
-- profissional (com informações detalhadas do perfil profissional, como
-- nome da profissão, nome da empresa, e descrição do cargo, além das
-- informações do perfil do profissional).

CREATE VIEW PerProf AS
SELECT u.nomeusuario,
	pp.admissao,
	prof.nomeprofissao,
    cg.descricaocargo,
    emp.nomefantasiaempresa
FROM cargo cg
INNER JOIN perfilprofissional pp
	ON cg.idcargo = pp.idcargo
INNER JOIN profissao prof
	ON prof.idprofissao = pp.idprofissao
INNER JOIN empresa emp
	ON emp.idempresa = pp.idempresa
INNER JOIN usuario u
	ON u.idusuario = pp.idusuario;
    
SELECT nomeusuario, admissao, nomeprofissao, descricaocargo, nomefantasiaempresa FROM PerProf;


-- Parte 2 – crie uma stored procedure que utilize a view criada na
-- parte 1, passando como parâmetro o código do usuário.

DELIMITER %%
BEGIN




;
END %%
DELIMITER ;

    

    
	
