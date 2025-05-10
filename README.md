# Documentação Completa do Projeto - Data Warehouse com dbt + Power BI

## 1. Visão Geral

Este projeto visa a construção de um Data Warehouse (DW) moderno, utilizando Snowflake como armazenamento em nuvem, dbt (Data Build Tool) para transformação de dados e governança, e Power BI como ferramenta de visualização para responder a perguntas de negócio. Os dados são originários do schema `raw_adventure_works` no banco de dados FEA24\_11.

## 2. Arquitetura do Projeto

* **Fonte de dados:** 68 tabelas em schemas: HR, Sales, Production, Purchasing, raw\_adventure\_works.
* **Zona RAW:** Schema `RAW_ADVENTURE_WORKS`, com dados brutos replicados diretamente da fonte.
* **Transformação com dbt:**

  * Criação de tabelas intermediárias (camada `intermediate`)
  * Criação de tabelas de dimensão e fato (camada `marts`)
* **Camadas:**

  * `staging`: padronização e limpeza leve
  * `intermediate`: junção de tabelas e cálculos intermediários
  * `marts`: modelos finais e otimizados para consumo BI

## 3. Diagrama Conceitual

Disponibilizado em PDF com mapeamento das tabelas de fato e dimensões criadas, suas chaves primárias e relacionamentos. 
https://drive.google.com/file/d/1BQG8Vsc0iTqLMOZFki2bNzOokgq4-P2q/view?usp=sharing

## 4. Transformação com dbt

### 4.1 Modelos Criados

* **Fato:**

  * `ft_vendas`: consolidado com medidas calculadas (valor total, descontos, valor líquido)
* **Dimensões:**

  * `dim_calendario`: datas, mês, ano, mês escrito, etc.
  * `dim_produto`: IDProduto, Produto, Classe, Preço Recomendado
  * `dim_clientes`: IDCliente, Nome, Email, Tipo Negócio
  * `dim_cartao_de_credito`: IDCartao, TipoCartao
  * `dim_geo`: IDEndereco, Cidade, Estado, País
  * `dim_detalhe_venda`: Motivo, TipoMotivo

### 4.2 Testes implementados

* **Testes em sources:**

  * `not_null` e `unique` para campos-chave (ex: IDProduto, Data)
* **Testes de integridade:**

  * chaves primárias das dimensões e fato validadas
* **Teste de valor de vendas em 2011:**

```sql
SELECT 1
WHERE (
    SELECT ROUND(SUM(quantidadepedido * precounitario), 2)
    FROM {{ ref('ft_vendas') }}
    WHERE EXTRACT(YEAR FROM DataPedido) = 2011
) != 12646112.16
```

* **Documentação e descrições completas em YAML:** Incluindo descrição coerente por campo e técnicas de cálculo de medidas.

### 4.3 Repositório Git

Link para o repositório: https://github.com/GuiOliveira1104/fea_adventure_works

## 5. Painel BI - Power BI

### 5.1 Perguntas Respondidas

**(a)** Vendas por Produto, Cartão, Cliente, Cidade, etc.

**(b)** Ticket médio mensal

**(c)** Top 10 clientes

**(d)** Top 5 cidades

**(e)** Série temporal de vendas por mês

**(f)** Produto com maior venda para motivo "Promotion"

## 6. Conclusão

Projeto completo com pipeline moderno, testes automatizados, versão controlada com Git e visualizações interativas. Alinhado ao Modern Data Stack e pronto para ser escalado.
