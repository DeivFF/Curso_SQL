-- Identificar a duração média das viagens por tipo de membro ao longo do tempo:
SELECT Member_type,
	   Start_date,
	   duration,
	   AVG(Duration) OVER(Partition BY Member_type ORDER BY start_date) as duracao_media
FROM dbo.capitalbikeshare_tripdata

-- Classificar as estações de início de viagem mais movimentadas por dia da semana:
SELECT Start_station,
	  CASE DATEPART(WEEKDAY,start_date)
		WHEN '1' THEN 'Domingo'
		WHEN '2' THEN 'Segunda'
		WHEN '3' THEN 'Terça'
		WHEN '4' THEN 'Quarta'
		WHEN '5' THEN 'Quinta'
		WHEN '6' THEN 'Sexta'
		WHEN '7' THEN 'Sábado'
	  END,
	   COUNT(Start_station) OVER(PARTITION BY Start_station, DATEPART(WEEKDAY,start_date))
FROM dbo.capitalbikeshare_tripdata

-- Calcular a diferença de duração entre cada viagem e a média de duração de todas as viagens para cada estação de início (Start_station).
SELECT duration,
	   Start_date,
	   Start_station,
	   AVG(Duration) OVER(PARTITION BY start_station) as media_duracao,
	   Duration - AVG(Duration) OVER(PARTITION BY start_station) as diferenca_duracao
FROM dbo.capitalbikeshare_tripdata

-- Calcular o número acumulado de viagens por dia da semana para cada tipo de membro (Member_type).
SELECT DATEPART(WEEKDAY,Start_date) as dia_da_semana,
	   Start_date,
	   Member_type,
	   COUNT(Member_type) OVER(PARTITION BY Member_type ORDER BY DATEPART(WEEKDAY,Start_date))
FROM dbo.capitalbikeshare_tripdata

-- Calcular a diferença de duração entre cada viagem e a média de duração para o mês de janeiro.
SELECT Duration,
	   Start_date,
	   MONTH(Start_date) as mês,
	   AVG(duration) OVER (),
	   Duration - AVG(duration) OVER () as diferenca_duracao
FROM dbo.capitalbikeshare_tripdata 
WHERE MONTH(Start_date) = 1

SELECT * FROM dbo.capitalbikeshare_tripdata