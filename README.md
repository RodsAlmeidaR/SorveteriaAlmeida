## Data Warehouse para Sorveteria Almeida

## Introdução
Este repositório contém todos os recursos desenvolvidos para a implementação de um data warehouse para a Sorveteria Almeida, com o objetivo de analisar as tendências de vendas sazonais e ajudar na tomada de decisões estratégicas. O projeto foi desenvolvido como parte da disciplina de Banco de Dados Não Relacional na Fatec de Itapira.

## Problema
A Sorveteria Almeida enfrenta uma queda significativa nas vendas durante os meses mais frios do ano. Este projeto visa implementar um data warehouse que permita analisar as vendas por produto, temporada, localização e outras dimensões relevantes para entender melhor essas tendências e sugerir estratégias promocionais.

## Fontes de Dados
Os dados utilizados neste projeto foram extraídos do sistema de vendas da Sorveteria Almeida, abrangendo um período de dois anos. As informações foram limpas e transformadas para adequação ao modelo de data warehouse.

## Arquitetura do Sistema
O projeto utiliza o Microsoft SQL Server para hospedar o data warehouse on-premise. 

## Modelo de Dados
O modelo multidimensional (Star Schema) foi adotado para este data warehouse, composto por uma tabela de fatos e quatro dimensões.

## Desenvolvimento
O processo de desenvolvimento incluiu a extração dos dados, a transformação para ajustar os critérios do modelo dimensional e o carregamento no data warehouse. Detalhes adicionais e scripts SQL podem ser encontrados nas pastas correspondentes deste repositório.

## Consultas e Análises
O repositório inclui scripts para seis consultas principais que demonstram agregações e agrupamentos necessários para a análise das vendas. Exemplos incluem a análise de vendas por produto e por mês, eficácia das promoções, e variações sazonais.

## Apresentação e Relatório
Os slides utilizados na apresentação oral e o relatório técnico completo também estão disponíveis neste repositório. Estes documentos oferecem uma visão detalhada do projeto, incluindo gráficos e análises das consultas executadas.

## Como Usar
Para executar os scripts e consultas, é necessário ter acesso ao SQL Server com os devidos privilégios. As instruções para configurar o ambiente e executar cada script estão detalhadas nos arquivos README nas pastas de scripts.
