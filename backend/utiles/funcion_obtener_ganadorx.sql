create or replace function prueba1(fecha date, limite_inferior int, limite_superior int)
returns registro_sda
language plpgsql
as $$
declare
	cantidad numeric;
	nro numeric;
	ganadorx numeric;
	myrec record;
	registro registro_sda%rowtype;
begin
	-- Casos de reglas sin limites
	select count(*) into cantidad
	from (SELECT id_cliente, sum(saldo_puntos)
	FROM "TP_ARQ_BOLSAs" 
	WHERE caducidad_puntaje >  now() and saldo_puntos > 0 and asignacion_puntaje < fecha
	GROUP BY id_cliente
	HAVING sum(saldo_puntos) between limite_inferior and limite_superior
	ORDER by id_cliente ASC) t;

        SELECT floor(random() * (cantidad - 1 + 1) + 1)::int into nro;
	
	select t.id_cliente into ganadorx
	from (SELECT id_cliente, sum(saldo_puntos)
	FROM "TP_ARQ_BOLSAs" 
	WHERE caducidad_puntaje >  now() and saldo_puntos > 0 and asignacion_puntaje < fecha
	GROUP BY id_cliente
	HAVING sum(saldo_puntos) between limite_inferior and limite_superior
	ORDER by id_cliente ASC limit 1 offset (nro-1)) t;

	SELECT * into myrec
	FROM "TP_ARQ_CLIENTEs"
	WHERE id = ganadorx;
	registro.id_cliente := myrec.id;
	registro.nombre := myrec.nombre || ' ' || myrec.apellido;
	registro.doc_nro := myrec.doc_nro;
	registro.correo := myrec.email;
	return registro;
	
end; 
$$;