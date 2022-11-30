--select * from lista_task(30);

create or replace function lista_task(dia int)
returns table (
	 nom_com text, 
	 doc_nro numeric, 
	 caducidad_puntaje date,
	 dias_diff integer,
	 saldos_puntos numeric
)
language plpgsql
as $$
begin
	return query 
		SELECT 
			B.NOMBRE || ' ' || B.APELLIDO AS NOM_COM,
			B.DOC_NRO,
			DATE(A.CADUCIDAD_PUNTAJE) AS CADUCIDAD_PUNTAJE, 
			(DATE(A.CADUCIDAD_PUNTAJE) - CURRENT_DATE) AS DIAS_DIFF,
			SUM(A.SALDO_PUNTOS) AS SALDO_PUNTOS
		FROM public."TP_ARQ_BOLSAs" A
		LEFT JOIN public."TP_ARQ_CLIENTEs" B ON B.ID = A.ID_CLIENTE
		WHERE A.SALDO_PUNTOS <> 0 AND (DATE(A.CADUCIDAD_PUNTAJE) - CURRENT_DATE) = dia
		GROUP BY B.NOMBRE || ' ' || B.APELLIDO, B.DOC_NRO, DATE(A.CADUCIDAD_PUNTAJE), (DATE(A.CADUCIDAD_PUNTAJE) - CURRENT_DATE);
end; 
$$;