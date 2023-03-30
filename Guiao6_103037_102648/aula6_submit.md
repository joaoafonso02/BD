# BD: Guião 6

## Problema 6.1

### *a)* Todos os tuplos da tabela autores (authors);

```
SELECT * FROM authors
```

### *b)* O primeiro nome, o último nome e o telefone dos autores;

```
SELECT authors.au_fname, authors.au_lname, authors.phone
FROM authors
```

### *c)* Consulta definida em b) mas ordenada pelo primeiro nome (ascendente) e depois o último nome (ascendente); 

```
SELECT authors.au_fname, authors.au_lname, authors.phone
FROM authors
ORDER BY authors.au_fname, authors.au_lname
```

### *d)* Consulta definida em c) mas renomeando os atributos para (first_name, last_name, telephone); 

```
SELECT au_fname AS first_name, au_lname AS last_name, phone AS telephone
FROM authors
ORDER BY first_name, last_name
```

### *e)* Consulta definida em d) mas só os autores da Califórnia (CA) cujo último nome é diferente de ‘Ringer’; 

```
SELECT au_fname AS first_name, au_lname AS last_name, phone AS telephone, state
	FROM authors
	WHERE au_fname != 'Ringer' AND authors.state = 'CA'
	ORDER BY au_fname, au_lname
```

### *f)* Todas as editoras (publishers) que tenham ‘Bo’ em qualquer parte do nome; 

```
SELECT *
	FROM publishers
	WHERE pub_name LIKE  '%BO%'
```

### *g)* Nome das editoras que têm pelo menos uma publicação do tipo ‘Business’; 

```
SELECT pub_name 
	FROM publishers
	INNER JOIN titles on publishers.pub_id=titles.pub_id
	WHERE titles.type = 'Business'
```

### *h)* Número total de vendas de cada editora; 

```
SELECT pub_name, SUM(qty) AS Quantaty
	FROM sales 
	INNER JOIN titles ON sales.title_id=titles.title_id
	INNER JOIN publishers ON publishers.pub_id=titles.pub_id
	GROUP BY pub_name;
```

### *i)* Número total de vendas de cada editora agrupado por título; 

```
SELECT pub_name, title, SUM(qty) AS Quantaty
	FROM sales 
	INNER JOIN titles ON sales.title_id=titles.title_id
	INNER JOIN publishers ON publishers.pub_id=titles.pub_id
	GROUP BY pub_name, titles.title
	ORDER BY pub_name;
```

### *j)* Nome dos títulos vendidos pela loja ‘Bookbeat’; 

```
SELECT title, stor_name
	FROM titles 
	INNER JOIN sales ON titles.title_id=sales.title_id
	INNER JOIN stores ON sales.stor_id=stores.stor_id
	WHERE stor_name LIKE 'Bookbeat';
```

### *k)* Nome de autores que tenham publicações de tipos diferentes; 

```
SELECT au_fname, au_lname
	FROM authors
	INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id
	INNER JOIN titles ON titles.title_id=titleauthor.title_id
	GROUP BY au_fname, au_lname
	HAVING COUNT(DISTINCT type) > 1;
```

### *l)* Para os títulos, obter o preço médio e o número total de vendas agrupado por tipo (type) e editora (pub_id);

```
SELECT avg(price) AS AvgPrice,  titles.pub_id, type, COUNT(ytd_sales) AS sales_amount
	FROM publishers 
	INNER JOIN titles ON titles.pub_id=publishers.pub_id
	GROUP BY titles.pub_id, type
```

### *m)* Obter o(s) tipo(s) de título(s) para o(s) qual(is) o máximo de dinheiro “à cabeça” (advance) é uma vez e meia superior à média do grupo (tipo);

```
SELECT [type] 
	FROM titles
	GROUP BY [type]
	HAVING MAX(advance) > 1.5*AVG(advance);
```

### *n)* Obter, para cada título, nome dos autores e valor arrecadado por estes com a sua venda;

```
SELECT title, au_fname, au_lname, ytd_sales as sales 
	FROM titles
	INNER JOIN titleauthor ON titleauthor.title_id=titles.title_id
	INNER JOIN authors ON authors.au_id=titleauthor.au_id
	GROUP BY title, price, au_fname, au_lname, ytd_sales, royalty
```

### *o)* Obter uma lista que incluía o número de vendas de um título (ytd_sales), o seu nome, a faturação total, o valor da faturação relativa aos autores e o valor da faturação relativa à editora;

```
SELECT	title,
		ytd_sales, 
		ytd_sales * titles.price AS facturacao,
		price * royalty / 100 * ytd_sales  AS auths_revenue,
		price*ytd_sales-price*ytd_sales*royalty/100 AS publisher_revenue
		FROM	titles
		ORDER BY	titles.title
```

### *p)* Obter uma lista que incluía o número de vendas de um título (ytd_sales), o seu nome, o nome de cada autor, o valor da faturação de cada autor e o valor da faturação relativa à editora;

```
SELECT  title, ytd_sales, au_fname + ' ' + au_lname AS author, 
		ytd_sales*price*royalty/100 as auths_revenue,
		price*ytd_sales-price*ytd_sales*royalty/100 AS publisher_revenue
		FROM titles
		INNER JOIN titleauthor ON titleauthor.title_id=titles.title_id
		INNER JOIN authors ON authors.au_id=titleauthor.au_id
		GROUP BY title, price, au_fname, au_lname, ytd_sales, royalty
```

### *q)* Lista de lojas que venderam pelo menos um exemplar de todos os livros;

```
SELECT stor_id, title_id, COUNT(title_id) AS StoreTitles
	FROM sales
	GROUP BY stor_id, title_id
	HAVING COUNT(title_id) <=
		(SELECT COUNT(*) FROM titles)
```

### *r)* Lista de lojas que venderam mais livros do que a média de todas as lojas;

```
SELECT stor_name 
	FROM stores
	INNER JOIN sales ON stores.stor_id=sales.stor_id
	INNER JOIN titles ON sales.title_id=titles.title_id
	GROUP BY stores.stor_name
	HAVING SUM(sales.qty) > 
		(SELECT SUM(sales.qty) / COUNT(stor_id) FROM sales); -- average of all stores
```

### *s)* Nome dos títulos que nunca foram vendidos na loja “Bookbeat”;

```
SELECT title 
	FROM titles
	EXCEPT
		SELECT title
			FROM titles, stores, sales
			WHERE stores.stor_id = sales.stor_id AND 
				titles.title_id = sales.title_id AND 
				stores.stor_name = 'Bookbeat'
```

### *t)* Para cada editora, a lista de todas as lojas que nunca venderam títulos dessa editora; 

```
SELECT stor_name, stor_name
	FROM stores, publishers
	EXCEPT
		SELECT stor_name, stor_name
			FROM publishers
			INNER JOIN 
```

## Problema 6.2

### ​5.1

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_1_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_1_data.sql "SQLFileQuestion")

#### c) Queries

##### *a)*

```
... Write here your answer ...
```

##### *b)* 

```
... Write here your answer ...
```

##### *c)* 

```
... Write here your answer ...
```

##### *d)* 

```
... Write here your answer ...
```

##### *e)* 

```
... Write here your answer ...
```

##### *f)* 

```
... Write here your answer ...
```

##### *g)* 

```
... Write here your answer ...
```

##### *h)* 

```
... Write here your answer ...
```

##### *i)* 

```
... Write here your answer ...
```

### 5.2

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_2_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_2_data.sql "SQLFileQuestion")

#### c) Queries

##### *a)*

```
... Write here your answer ...
```

##### *b)* 

```
... Write here your answer ...
```


##### *c)* 

```
... Write here your answer ...
```


##### *d)* 

```
... Write here your answer ...
```

### 5.3

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_3_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_3_data.sql "SQLFileQuestion")

#### c) Queries

##### *a)*

```
... Write here your answer ...
```

##### *b)* 

```
... Write here your answer ...
```


##### *c)* 

```
... Write here your answer ...
```


##### *d)* 

```
... Write here your answer ...
```

##### *e)* 

```
... Write here your answer ...
```

##### *f)* 

```
... Write here your answer ...
```
