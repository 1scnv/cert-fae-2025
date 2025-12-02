# Certificação FAE 2025 — Projeto Analytics Engineer

Este repositório contém o projeto desenvolvido para a certificação interna de **Analytics Engineer**, com foco em boas práticas de modelagem de dados e uso do **dbt (Data Build Tool)** integrado ao **Databricks**.

---

## Objetivo do Projeto

O objetivo principal deste projeto é demonstrar a capacidade de estruturar um pipeline analítico utilizando o **Adventure Works** como fonte de dados, aplicando conceitos de engenharia de dados e modelagem dimensional dentro do ecossistema dbt.

A proposta inclui:
- Criação de modelos de staging (camada *stg*) a partir de tabelas brutas (*raw*).
- Definição de fontes (`sources.yml`) e documentação de colunas.
- Implementação de testes de integridade e unicidade.
- Estruturação de boas práticas de versionamento e code-style.
- Construção de camadas intermediárias (*intermediate*) e marts (*marts*) para análises avançadas.

---

## Stack Utilizada

- **dbt Cloud**  
- **Databricks SQL Warehouse**  
- **GitHub** (controle de versão)
- **Adventure Works Dataset** (base de exemplo para modelagem)

---

## Estrutura do Projeto

A estrutura do projeto segue as melhores práticas recomendadas pelo dbt, com as seguintes pastas principais:

- **models/staging**: Contém os modelos de *staging*, responsáveis por padronizar e limpar os dados brutos.
- **models/intermediate**: Contém os modelos intermediários, que realizam transformações adicionais e preparam os dados para os marts.
- **models/marts**: Camada final de marts, onde os dados são organizados para consumo direto por dashboards e análises.

---

## Camada Staging

A camada **staging** tem como objetivo padronizar, limpar e descrever os dados provenientes da camada **raw**.  
Atualmente, os seguintes domínios foram modelados:

### ERP / Product
- `stg__products_product`
- `stg__products_productsubcategory`
- `stg__products_category`

### ERP / Person
- `stg__person_person`
- `stg__person_stateprovince`
- `stg__person_countryregion`
- `stg__person_address`

### ERP / Sales
- `stg__sales_salesperson`
- `stg__sales_salesterritory`
- `stg__sales_customer`
- `stg__sales_salesorderheader`
- `stg__sales_salesorderdetail`
- `stg__sales_salesreason`

### ERP / Human Resources
- `stg__hr_employee`

Cada modelo segue o padrão de nomeação `stg__<schema>_<tabela>` e um code-style consistente com as boas práticas de dbt.

---

## Camada Intermediária

A camada **intermediate** realiza transformações adicionais e integra dados de diferentes tabelas de *staging*.  
Os principais modelos intermediários incluem:

- **Sales**:
  - `int__salesorderheader`: Normaliza e centraliza informações de pedidos de vendas.
  - `int__salesorderdetail`: Prepara os itens de pedidos de vendas para análises detalhadas.
  - `int__salesorderreason`: Organiza os motivos de vendas para análises categorizadas.

- **Product**:
  - `int__products`: Integra informações de produtos, subcategorias e categorias.

- **Person**:
  - `int__persons`: Padroniza os atributos de pessoas.
  - `int__customers`: Enriquece os dados de clientes com informações pessoais.
  - `int__regions`: Consolida informações de endereço, estado e país.

- **Human Resources**:
  - `int__employee`: Enriquece os dados de funcionários com atributos pessoais e gera o nome completo.

---

## Camada Marts

A camada **marts** será responsável por organizar os dados para consumo direto por ferramentas de BI e análises avançadas.  
Esta camada ainda está em desenvolvimento.

---

## Testes Implementados

Os modelos possuem testes automáticos definidos em YAML, como:
- `not_null`: Garante que os campos obrigatórios não contenham valores nulos.
- `unique`: Garante que os campos definidos como chaves primárias ou únicas não tenham duplicatas.
- Validação de relacionamentos entre tabelas (chaves estrangeiras).

Exemplo de teste em YAML:
```yml
models:
  - name: stg__sales_salesorderheader
    columns:
      - name: salesorderid
        tests:
          - not_null
          - unique
```


