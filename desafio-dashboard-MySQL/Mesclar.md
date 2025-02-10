## Por que utilizar "Mesclar" e não "Atribuir"?

No **Power Query**, a opção **"Mesclar"** é utilizada quando precisamos combinar dados de duas tabelas distintas com base em uma chave comum, preservando a relação original entre os registros. Já **"Atribuir"** (ou Adicionar Coluna Personalizada) cria um novo campo com base em expressões, o que pode resultar na perda de granularidade e na repetição de valores.

### **Contexto da Mesclagem**

No nosso caso:
- A tabela **`employee`** contém um campo `Super_ssn`, que faz referência ao `Ssn` do supervisor.
- A junção realizada associa cada colaborador ao seu respectivo gerente utilizando um **auto-relacionamento** na própria tabela `employee`.
- A mesma lógica se aplica à relação entre **departamentos e seus respectivos gerentes**.

### **Problema com "Atribuir"**
Se utilizássemos **"Atribuir"** para essa relação:
1. Os dados do gerente poderiam ser atribuídos incorretamente a vários registros sem um controle adequado.
2. Não teríamos flexibilidade para expandir os dados dinamicamente em um modelo relacional.
3. A estrutura do modelo se tornaria mais complexa, dificultando futuras análises.

### **Vantagens de "Mesclar"**
Com **"Mesclar"**, conseguimos preservar corretamente a relação entre funcionários e seus supervisores ou entre departamentos e seus respectivos gerentes. Isso é especialmente importante porque:
- Um gerente pode ter **vários colaboradores**, mas cada colaborador tem **apenas um gerente**.
- Um departamento pode ter **apenas um gerente**, mas um gerente pode gerenciar **vários departamentos**.

Portanto, ao **mesclar**, conseguimos trazer os nomes corretos sem replicar ou corromper os dados.

### **Passo a Passo no Power Query**
1. **Importe a tabela `employee`** no Power Query.
2. **Duplique a tabela `employee`**, renomeando-a para `gerentes`.
3. **Realize a mesclagem entre `employee` e `gerentes`**, utilizando `Super_ssn` de `employee` e `Ssn` de `gerentes`.
4. **Expanda a coluna mesclada**, selecionando apenas o nome do gerente.
5. **Remova as colunas desnecessárias**, deixando apenas os dados relevantes.

Essa abordagem garante um modelo mais organizado e eficiente para análise no Power BI. 🚀

