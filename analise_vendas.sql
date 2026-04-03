-- =========================================
-- 📊 PROJETO: ANÁLISE DE VENDAS
-- =========================================

-- 🔹 1. Faturamento total
select sum("Valor") as faturamento_total,
		AVG("Valor") as tick_medio
from tb_vendas;

-- 🔹 2. Vendas por estado
select "Estado", sum("Valor") as total
from tb_vendas
group by "Estado"
order by total desc;

-- 🔹 3. Ranking de vendedores
select "Vendedor", sum("Valor") as total
from tb_vendas
group by "Vendedor"
order by total desc;

-- 🔹 4. Formas de pagamento
select "Forma de Pagamento", sum("Valor") as total
from tb_vendas
group by "Forma de Pagamento"
order by total desc;

-- 🔹 5. Vendedores com mais de 3 vendas
select "Vendedor", count(*) as qtd
from tb_vendas
group by "Vendedor"
having count(*) < 150;

-- 🔹 6. Classificação de vendedores por performance
select 
    "Vendedor",
    sum("Valor") as total_vendas,
    case 
        when sum("Valor") > 800000 then 'Alta Performance'
        when sum("Valor") > 500000 then 'Média Performance'
        else 'Baixa Performance'
    end as categoria
from tb_vendas
group by "Vendedor"
order by total_vendas desc;

-- 🔹 7. Vendas por mês
select 
    date_trunc('month', "Data") as mes,
    sum("Valor") as total_vendas
from tb_vendas
group by mes
order by mes DESC;

-- 🔹 8. Top 3 vendedores
select 
    "Vendedor",
    sum("Valor") as total_vendas
from tb_vendas
group by "Vendedor"
order by total_vendas desc
limit 3;
