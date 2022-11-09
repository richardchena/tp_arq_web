create or replace function prueba(valor int)
returns numeric
language plpgsql
as $$
declare
	puntos numeric;
	caso_a numeric;
	caso_b numeric;
	mont numeric;
begin
	-- Casos de reglas sin limites
	select count(*) into caso_a 
	from public."TP_ARQ_REGLAs"
	where limite_inferior is null and limite_superior is null;
	
	-- Casos de limites
	select count(*) into caso_b 
	from public."TP_ARQ_REGLAs"
	where limite_inferior is not null;
		
	if caso_a = 1 and caso_b = 0 then
		--Caso de regla unica (Solo uno debe haber) sin limite
		select monto into mont from public."TP_ARQ_REGLAs";
		return trunc(valor/mont);
		
	elsif caso_a = 0 and caso_b <> 0 then
		--Caso limites, no debe haber casos de reglas sin limites
		CREATE TEMP TABLE TEMPORAL AS
		   (select
				case
					when limite_inferior <= valor and limite_superior >= valor then
						trunc(valor/monto)
					when limite_superior is null and limite_inferior <= valor then
						trunc(valor/monto)
					else 
						null
				end as resultado
			from public."TP_ARQ_REGLAs");
			
		SELECT resultado INTO puntos
		FROM TEMPORAL
		WHERE resultado is not null;
		
		DROP TABLE TEMPORAL;
		
		return puntos;
		
	else
		--Otro caso: no valido
		return null;
	end if;
	
end; 
$$;
