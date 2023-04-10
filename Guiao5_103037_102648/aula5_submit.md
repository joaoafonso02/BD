# BD: Guião 5


## ​Problema 5.1
 
### *a)*

```
π Ssn, Fname, Minit, Lname, Pname (employee ⨝ Ssn=Essn (project⨝ Pnumber=Pno works_on))
```


### *b)* 

```
πFname,Minit,Lname (employee⨝employee.Super_ssn=supervisor.Ssn (ρ supervisor πSsn σ Fname= 'Carlos' ∧ Minit = 'D' ∧ Lname= 'Gomes' (employee)))
```


### *c)* 

```
γ Pname; TotalHours←sum(Hours) (project⨝ Pnumber=Pno works_on)
```


### d) 

```
π Fname,Minit,Lname (employee ⨝ Ssn=Essn (project ⨝ Pname='Aveiro Digital' and Pnumber=Pno and Hours>20 works_on))
```


### e) 

```
(π Ssn,Fname,Minit,Lname employee)-(π Ssn,Fname,Minit,Lname (employee⨝Ssn=Essn works_on))
```

### *f)* 

```
DEP = department ⨝Dnumber=Dno σ Sex='F' (employee)
γ Dname; avg(Salary) -> Avg_Salary (DEP)
```


### *g)* 

```
Two_or_more_DEP = σ count_dep >= 2 (γ Essn; count(Essn) -> count_dep (dependent))
π Fname,Minit,Lname (Two_or_more_DEP ⨝Essn=Ssn (employee))
```


### *h)* 

```
No_Dep = σ Essn= null (dependent ⨝Essn=Ssn (employee))
π Fname,Minit,Lname (department ⨝Mgr_ssn=Ssn (No_Dep))
```


### *i)* 

```
OneProjAveiro_DepNotAveiro = σ Plocation='Aveiro' ∧ Dlocation!='Aveiro' (project ⨝Dnum=Dnumber dept_location)
π Fname, Minit, Lname, Address (employee ⨝Dno=Dnum OneProjAveiro_DepNotAveiro)
```


## ​Problema 5.2

### *a)*

```
π nome (σ fornecedor = null (encomenda⟗fornecedor = nif (fornecedor)))
```

### *b)* 

```
π nome,average (γ codProd; avg(unidades) -> average (item) ⨝codProd=codigo (produto))
```


### *c)* 

```
γ avg(num_products) -> average_number_per_delivery (γ item.numEnc; count(produto.codigo) -> num_products (item ⨝ codProd = codigo (produto)))
```


### *d)* 

```
π fornecedor.nome, fornecedor.nif, produto.nome, produto.codigo, item.unidades (produto ⨝item.codProd=codigo (fornecedor ⨝encomenda.fornecedor= nif (item ⨝numero=numEnc  (encomenda))))
```


## ​Problema 5.3

### *a)*

```
π nome, paciente.numUtente (σ numPresc=null (prescricao ⟗prescricao.numUtente=paciente.numUtente (paciente)))
```

### *b)* 

```
γ especialidade; count(numPresc)-> Total (prescricao ⨝numMedico=numSNS (medico))
```


### *c)* 

```
γ nome; count(numPresc)-> Total (prescricao ⨝farmacia=nome (farmacia))
```


### *d)* 

```
FARMACO_no906 = πfarmaco.nome (σ numRegFarm = 906 (farmaco ⨝numRegFarm=numReg (farmaceutica)))
PRESC_no906 = πnomeFarmaco (σ numRegFarm = 906 (presc_farmaco))
FARMACO_no906 - PRESC_no906
```

### *e)* 

```
DiffDoc = σ dif_docs > 1 (γ numUtente; count(numMedico) -> dif_docs (π numUtente,numMedico prescricao))
πnome (paciente ⨝paciente.numUtente = prescricao.numUtente DiffDoc)
```

### *f)* 

```
DiffDoc = σ dif_docs > 1 (γ numUtente; count(numMedico) -> dif_docs (π numUtente,numMedico prescricao))
πnome (paciente ⨝paciente.numUtente = prescricao.numUtente DiffDoc)
```
