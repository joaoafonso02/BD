USE pubs
GO

-- j)

SELECT title, stor_name
	FROM titles 
	INNER JOIN sales ON titles.title_id=sales.title_id
	INNER JOIN stores ON sales.stor_id=stores.stor_id
	WHERE stor_name LIKE 'Bookbeat';

-- k)

SELECT au_fname, au_lname
	FROM authors
	INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id
	INNER JOIN titles ON titles.title_id=titleauthor.title_id
	GROUP BY au_fname, au_lname
	HAVING COUNT(DISTINCT type) > 1;

-- 



