
-- hash de um registro da tabela
SELECT tb.id, md5(CAST((tb.*) AS text)) FROM tb_teste AS tb LIMIT 10;

-- json completo de um registro
SELECT tb.id, row_to_json(tb) FROM tb_teste AS tb LIMIT 10;

-- Idade, em anos
SELECT extract(year from age(p.data_nasc)) as idade FROM pessoas as p

-- Extrair ano, mês, dia de data
SELECT extract(year from m.data) as comp_ajust FROM movimento as m LIMIT 1
SELECT extract(month from m.data) as comp_ajust FROM movimento as m FROM 1
SELECT extract(day from m.data) as comp_ajust FROM movimento as m FROM 1

-- Números aos lados, estilo str_pad php
SELECT RPAD(numcol::text, 3, '0'), LPAD(numcol::text, 3, '0') FROM my_table

-- Contar quantidade de letras...
SELECT length(cast ('125556' as text)); --out: 6
SELECT char_length(cast ('125556' as text)); --out: 6
SELECT strpos('algum no texto, continuação do texto.', 'text'); --out: 10

-- Manipulando string
SELECT lower('Tom'); --out: tom
SELECT upper('Tom'); --out: TOM
SELECT initcap('olá carlos'); --out: Olá Carlos
SELECT substring('Thomas' from 2 for 3); --out: hom
SELECT lpad('Olá', 10, '.'); --out: .......Olá
SELECT rpad('Olá', 10, '.'); --out: Olá.......
SELECT ltrim('....Teste...', '.'); --out: Teste...
SELECT rtrim('....Teste...', '.'); --out: ....Teste
SELECT trim('....Teste...', '.'); --out: Teste
SELECT trim('(_@_)Teste(_@_)(_@_)', '(_@_)'); --out: Teste
SELECT repeat('Pg', 4); --out: PgPgPgPg
SELECT replace('um {aplic} padrão.', '{aplic}', 'teste'); --out: um teste padrão.
SELECT substr('2016-05-15', 9, 2); --out: 15

-- Delimitando valor entre string
SELECT split_part('abc(~@~)def(~@~)ghi(~@~)jkl', '(~@~)', 1) --out: abc
SELECT split_part('abc(~@~)def(~@~)ghi(~@~)jkl', '(~@~)', 2) --out: def
SELECT split_part('abc(~@~)def(~@~)ghi(~@~)jkl', '(~@~)', 3) --out: ghi
SELECT split_part('abc(~@~)def(~@~)ghi(~@~)jkl', '(~@~)', 4) --out: jkl
SELECT split_part('abc(~@~)def(~@~)ghi(~@~)jkl', '(~@~)', 5) --out: ''

-- Convert, Decode, Encode, Cript, Decript
SELECT convert_to('algum texto...', 'UTF8');
SELECT encode('teste', 'base64'); -- out: dGVzdGU=
SELECT decode('dGVzdGU=', 'base64'); -- out: teste
SELECT to_hex(255); --out: ff
select translate(upper('texto de exemplo.'), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789', 'CDEFGHIJKLMNOPQRSTUVWXYZAB2345678901'); --out: VGZVQ FG GZGORNQ.
select translate('VGZVQ FG GZGORNQ.', 'CDEFGHIJKLMNOPQRSTUVWXYZAB2345678901', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'); --out: TEXTO DE EXEMPLO.

-- Exibir caract UTF8 usando código
SELECT chr(65); --out: A
SELECT chr(66); --out: B

-- Mostrar campo nome que não estão no group by
SELECT string_agg(nome, ', '), count(1) FROM produtos GROUP BY categoria; 

-- Count simples, soma para contagem por situação em IF
SELECT
	reg_m.id,
	reg_m.data_ini,
	reg_m.data_fim,
    count(reg_i.pessoa) as pessoas,
    sum(case when reg_i.situacao = 'P' then 1 else 0 end) as pendente,
    sum(case when reg_i.situacao = 'C' then 1 else 0 end) as concluido
FROM registro_mestre as reg_m
LEFT JOIN registro_item as reg_i ON reg_i.id_reg_m = reg_m.id
WHERE reg_m.id = 1
GROUP BY reg_m.id



