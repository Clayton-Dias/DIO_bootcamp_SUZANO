# README: Junção de Colaboradores e Gerentes no MySQL

## Descrição
Este documento explica o processo de junção entre colaboradores e seus respectivos gerentes utilizando **SQL** no banco de dados **MySQL**. Esse processo visa estruturar os dados para posterior análise no **Power BI**.

## Estrutura do Banco de Dados
As tabelas principais utilizadas nesta junção são:
- `employee`: Contém os dados dos colaboradores, incluindo o campo `Super_ssn`, que referencia o gerente imediato.
- `departament`: Contém informações sobre os departamentos.

## Query Utilizada
Para associar os colaboradores aos seus gerentes, criamos uma **View** que faz um `LEFT JOIN` da tabela `employee` com ela mesma, utilizando a relação entre `Ssn` (número de segurança social do colaborador) e `Super_ssn` (número de segurança social do gerente).

```sql
CREATE OR REPLACE VIEW vw_employee_manager AS
SELECT
    e.Ssn AS EmployeeID,
    CONCAT(e.Fname, ' ', e.Lname) AS EmployeeName,
    e.Salary,
    e.Dno AS DepartmentID,
    d.Dname AS DepartmentName,
    e.Super_ssn AS ManagerID,
    CONCAT(m.Fname, ' ', m.Lname) AS ManagerName
FROM employee e
LEFT JOIN employee m ON e.Super_ssn = m.Ssn
LEFT JOIN departament d ON e.Dno = d.Dnumber;
```

## Explicação da Query
1. **Selecionamos os colaboradores (`e`)**:
   - Nome completo (`CONCAT(e.Fname, ' ', e.Lname) AS EmployeeName`)
   - Salário (`e.Salary`)
   - Departamento (`e.Dno` e `d.Dname`)
   - ID do gerente (`e.Super_ssn AS ManagerID`)

2. **Fazemos um `LEFT JOIN` com a própria tabela `employee` (`m`)**:
   - Relacionamos `e.Super_ssn` com `m.Ssn` para obter o nome do gerente (`CONCAT(m.Fname, ' ', m.Lname) AS ManagerName`)

3. **Fazemos um `LEFT JOIN` com a tabela `departament` (`d`)**:
   - Relacionamos `e.Dno` com `d.Dnumber` para trazer o nome do departamento

## Utilização no Power BI
Para carregar essa View no Power BI:
1. **Abra o Power BI Desktop**
2. **Vá em "Obter Dados" → "Banco de Dados MySQL"**
3. **Preencha os dados da conexão:**
   - **Servidor:** `localhost`
   - **Banco de Dados:** `company`
4. **No "Modo Avançado" cole a seguinte consulta:**
   ```sql
   SELECT * FROM vw_employee_manager;
   ```
5. **Clique em "OK" e "Carregar"**

Agora os dados estão prontos para serem utilizados na análise no **Power BI**. 🚀

