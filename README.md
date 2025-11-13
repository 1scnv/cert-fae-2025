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

---

## Stack Utilizada

- **dbt Cloud**  
- **Databricks SQL Warehouse**  
- **GitHub** (controle de versão)
- **Adventure Works Dataset** (base de exemplo para modelagem)

---

## Estrutura do Projeto

WIP


---

## Camada Staging

A camada **staging** tem como objetivo padronizar, limpar e descrever os dados provenientes da camada **raw**.  
Atualmente, os seguintes domínios foram modelados:

### ERP / Product
- `stg__products_product`

### ERP / Person
- `stg__person`
- `stg__person_stateprovince`
- `stg__person_countryregion`

### ERP / Sales
- `stg__sales_salesperson`
- `stg__sales_salesterritory`
- `stg__sales_customer`
- `stg__sales_salesorderheader`
- `stg__sales_salesorderdetail`

Cada modelo segue o padrão de nomeação `stg__<schema>_<tabela>` e um code-style consistente com as boas práticas de dbt.

---

## Testes Implementados

Os modelos possuem testes automáticos definidos em YAML, como:
- `not_null`
- `unique`
- Validação de chaves primárias e relacionamentos

---


