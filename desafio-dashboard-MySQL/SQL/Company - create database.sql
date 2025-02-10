-- Remove o banco de dados existente (caso exista) para evitar conflitos
DROP DATABASE IF EXISTS company;

-- Criação do schema (banco de dados) 'company' se não existir
create database company;

-- Definir o banco de dados atual como 'company' para uso
use company;

-- Comentado, mas o código a seguir definiria um domínio para o número de departamento
-- restrição atribuída a um domínio
-- create domain D_num as int check(D_num> 0 and D_num< 21)/

-- Criação da tabela 'employee', que armazena informações dos empregados
create table employee (
    Fname varchar(15) not null, -- Primeiro nome do empregado (máximo de 15 caracteres)
    Minit char,                 -- Inicial do meio (máximo de 1 caractere)
    Lname varchar(15) not null, -- Sobrenome do empregado (máximo de 15 caracteres)
    Ssn char(9) not null,       -- Número de segurança social (SSN) (9 caracteres)
    Bdate date,                 -- Data de nascimento do empregado
    Address varchar(30),        -- Endereço do empregado (máximo de 30 caracteres)
    sex char,                   -- Sexo do empregado ('M' ou 'F')
    Salary decimal(10,2),       -- Salário do empregado (até 10 dígitos, com 2 casas decimais)
    Super_ssn char(9),          -- SSN do supervisor do empregado
    Dno int not null,           -- Número do departamento ao qual o empregado pertence
    constraint chk_salary_employee check (Salary > 2000.0), -- Restrição que garante que o salário seja maior que 2000
    constraint pk_employee primary key (Ssn)           -- Definir a chave primária da tabela como 'Ssn'
);

-- Exibe a estrutura da tabela 'employee', mostrando os detalhes dos campos e suas propriedades
-- desc employee;

-- Criação da tabela 'departament', que armazena informações dos departamentos
create table departament (
    Dname varchar(15) not null,  -- Nome do departamento (máximo de 15 caracteres)
    Dnumber int not null,        -- Número identificador único do departamento
    Mgr_ssn char(9),             -- SSN do gerente do departamento
    Mgr_start_date date,         -- Data de início do gerente no departamento
    Dept_create_date date,       -- Data de criação do departamento
    constraint chk_date_dept check(Dept_create_date < Mgr_start_date), -- Garantir que a data de criação seja anterior à data de início do gerente
    constraint pk_dept primary key (Dnumber),       -- Definir a chave primária da tabela como 'Dnumber'
    constraint unique_name_dept unique (Dname),     -- Garantir que o nome do departamento seja único
    constraint fk_dept_mgr foreign key (Mgr_ssn) references employee(Ssn) -- Definir 'Mgr_ssn' como chave estrangeira referenciando o 'Ssn' da tabela 'employee'
);

-- Exibe a estrutura da tabela 'departament', mostrando os detalhes dos campos e suas propriedades
-- desc departament;

-- Criação da tabela 'dept_locations', que armazena locais dos departamentos
create table dept_locations(
    Dnumber int not null,         -- Número do departamento (chave estrangeira)
    Dlocation varchar(15) not null, -- Localização do departamento (máximo de 15 caracteres)
    constraint pk_dept_locations primary key (Dnumber, Dlocation), -- Chave primária composta por 'Dnumber' e 'Dlocation'
    constraint fk_dept_locations foreign key (Dnumber) references departament(Dnumber) -- Chave estrangeira referenciando 'Dnumber' da tabela 'departament'
);

-- Exibe a estrutura da tabela 'dept_locations'
-- desc dept_locations;

-- Criação da tabela 'project', que armazena projetos associados aos departamentos
create table project (
    Pname varchar(15) not null,   -- Nome do projeto (máximo de 15 caracteres)
    Pnumber int not null,         -- Número identificador único do projeto
    Plocation varchar(15),        -- Localização do projeto
    Dnum int not null,            -- Número do departamento ao qual o projeto pertence
    constraint pk_project primary key (Pnumber),        -- Chave primária da tabela como 'Pnumber'
    constraint unique_project_name unique (Pname),      -- Garantir que o nome do projeto seja único
    constraint fk_project foreign key (Dnum) references departament(Dnumber) -- Chave estrangeira referenciando 'Dnum' de 'departament'
);

-- Exibe a estrutura da tabela 'project'
-- desc project;

-- Criação da tabela 'works_on', que armazena os projetos nos quais os empregados trabalham
create table works_on (
    Essn char(9) not null,        -- SSN do empregado (referência a 'employee')
    Pno int not null,             -- Número do projeto (referência a 'project')
    Hours decimal(3,1) not null,  -- Número de horas que o empregado trabalha no projeto
    constraint pk_works_on primary key (Essn, Pno),      -- Chave primária composta por 'Essn' (SSN do empregado) e 'Pno' (número do projeto)
    constraint fk_work_on_employees foreign key (Essn) references employee(Ssn), -- Chave estrangeira referenciando 'Essn' de 'employee'
    constraint fk_work_on_project foreign key (Pno) references project(Pnumber) -- Chave estrangeira referenciando 'Pno' de 'project'
);

-- Erro de digitação: 'woeks_on' deve ser 'works_on'
-- desc works_on;

-- Criação da tabela 'dependent', que armazena dependentes dos empregados
create table dependent (
    Essn char(9) not null,          -- SSN do empregado (referência a 'employee')
    Dependent_name varchar(15) not null, -- Nome do dependente (máximo de 15 caracteres)
    Sex char,                       -- Sexo do dependente ('M' ou 'F')
    Bdate date,                     -- Data de nascimento do dependente
    Relationship varchar(15),       -- Relacionamento com o empregado (ex: filho, esposa, etc.)
    constraint pk_dependent primary key (Essn, Dependent_name), -- Chave primária composta por 'Essn' e 'Dependent_name'
    constraint fk_dependent foreign key (Essn) references employee(Ssn) -- Chave estrangeira referenciando 'Essn' de 'employee'
);

-- Exibe a estrutura da tabela 'dependent'
-- desc dependent;

