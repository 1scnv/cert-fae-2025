# Certificação FAE 2025 — Projeto Analytics Engineer

Pipeline analítico desenvolvido para a certificação interna de **Analytics Engineer**, utilizando o **dbt** e **Databricks** com base no dataset **Adventure Works**.

---

## Objetivo

Demonstrar habilidades em:
- Modelagem de dados (*staging*, *intermediate* e *marts*).
- Documentação e testes automatizados.
- Boas práticas de versionamento e organização de projetos.

---

## Stack

- **dbt Cloud**
- **Databricks SQL Warehouse**
- **GitHub**
- **Adventure Works Dataset**

---

## Estrutura

- **models/staging**: Limpeza e padronização de dados brutos.
- **models/intermediate**: Transformações intermediárias e integrações.
- **models/marts**: Dados prontos para consumo analítico.

---

## Testes

Testes automatizados implementados:
- `not_null`
- `unique`



---

## Como Executar

1. Configure o `profiles.yml` para o ambiente Databricks. ([Docs](https://docs.getdbt.com/docs/core/connect-data-platform/databricks-setup))
2. Execute os modelos:
   ```bash
   dbt run