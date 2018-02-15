CREATE VIEW VwTimeLine
-- ALTER VIEW VwTimeLine
AS
	SELECT  Id = ROW_NUMBER() OVER( ORDER BY TipoPagina, IdRegistro DESC ),
		*
	FROM (

		-- OCORRENCIA
		SELECT	IdRegistro	= obs.IdAlunoObs,
			Titulo		= 'OCORRÊNCIA',
			SubTitulo	= a.NomeAluno,
			Conteudo	= 'Uma ocorrência foi gerada para o aluno e deve ser verificada.',
			DetalheConteudo	= '"' + CAST( obs.ObservacaoRegistro AS varchar(8000) ) + '"',
			Icone		= 'person',

			Time_Title	= CAST( DAY(obs.DataOcorrencia) AS varchar ),
			Time_Subtitle	= CASE DATEPART(MONTH, obs.DataOcorrencia)
					  WHEN 1 THEN 'Janeiro' WHEN 2 THEN 'Fevereiro' WHEN 3 THEN 'Março' WHEN 4 THEN 'Abril' WHEN 5 THEN 'Maio' WHEN 6 THEN 'Junho' 
					  WHEN 7 THEN 'Julho' WHEN 8 THEN 'Agosto' WHEN 9 THEN 'Setembro' WHEN 10 THEN 'Outubro' WHEN 11 THEN 'Novembro' WHEN 12 THEN 'Dezembro'
					  END,

			TipoPagina	= 'OCORRENCIA',
			Data		= dbo.FnDateTrunc(obs.DataOcorrencia),			
			IdAluno		= obs.IdAluno,

			a.IdResponsavel, a.IdResponsavelSecundario, a.IdPai, a.IdMae

		FROM TbAlunoObs obs
		INNER JOIN TbAluno a ON a.IdAluno = obs.IdAluno
		WHERE dbo.FnDateTrunc(obs.DataOcorrencia) = dbo.FnDateTrunc( GETDATE() )					

		UNION ALL

		-- DIÁRIO
		SELECT	IdRegistro	= da.IdDiarioAula,
			Titulo		= 'DIÁRIO DE CLASSE',
			SubTitulo	= a.NomeAluno,
			Conteudo	= 'Conteúdo e tarefas preenchidos e já estão disponíveis para visualização.',
			DetalheConteudo	= '',
			Icone		= 'book',
			Time_Title	= dis.NomeDisciplina,
			Time_Subtitle	= '',

			TipoPagina	= 'DIARIO',
			Data		= dbo.FnDateTrunc(da.DataAula),
			IdAluno		= dalu.IdAluno,

			a.IdResponsavel, a.IdResponsavelSecundario, a.IdPai, a.IdMae

		FROM TbDiario d
		INNER JOIN TbDiarioAula da ON da.IdDiario = d.IdDiario
		INNER JOIN TbDiarioAluno dalu ON dalu.IdDiario = d.IdDiario
		INNER JOIN TbAluno a ON a.IdAluno = dalu.IdAluno
		INNER JOIN TbDisciplina dis ON dis.IdDisciplina = d.IdDisciplina
		WHERE dbo.FnDateTrunc(da.DataAula) = dbo.FnDateTrunc( GETDATE() )
							

	) rst

	WHERE dbo.FnAlunoPermiteAcessoPortalWeb( IdAluno ) = 1





--IF EXISTS( select * from sysusers where name = 'sigainternet' ) GRANT SELECT ON VwTimeLine TO sigainternet