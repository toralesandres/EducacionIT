/*DML - Data Manipulation Language - INSERT */
	USE ventapps;
	## Tabla usuarios
		-- carga completa de datos
        INSERT INTO users 
        VALUES (0,'c215714n','cristiandracedo@hotmail.com','root');
        -- carga selectiva de datos
        INSERT INTO users(user_email,user_name)
        VALUES ('cristiandacedo@gmail.com','d477714n');
        INSERT INTO users(user_email, user_name)
        VALUES
			('raul2021@gmail.com','raul'),
			('alicia25@gmail.com','alicia'),
			('arbolito@hotmail.com','arbolito'),
			('carlos55@gmail.com','carlos');
	## Tabla Categorias
		-- carga multiple de datos
		INSERT INTO categories(description)
        VALUES 
			('Electronica'),
            ('Tecnologia'),
            ('Indumentaria'),
            ('Hogar'),
            ('Botanica'),
            ('Alimentos'),
            ('Libreria'),
            ('Transporte');
		INSERT INTO categories(description, active)
		VALUES
            ('Autopartes', false),
            ('Herramientas', true);
    ## Tabla Productos
		INSERT INTO products(product, category)
		VALUES
			('Notebook', 2),
			('Aire Acondicionado', 4),
			('Televisor',4),
			('Abono Mensual', 8),
			('Abono para Plantas',5),
			('Fideos',6),
			('Lapices de color', 7),
			('Libro', 7),
			('Destornillador', 13),
			('Martillo', 13),
			('Serrucho', 13),
			('Pantalones', 3);
     ## Tabla Publicaciones
     INSERT INTO posts(user, product)
     VALUES 
		(3,7),(3,8),(3,9), /*Vendedor Raul*/
		(4,2),(4,3), /*Vendedor Alicia*/
		(5,12),(5,1),(5,10),(5,5), /*Vendedor Arbolito*/
		(6,4); /*Vendedor Carlos*/

/*DML - Data Manipulation Language - SELECT*/
	## Tabla Usuarios
	SELECT * FROM users;
	## Tabla Categorias
		SELECT * FROM categories;
        SELECT * FROM categories
        WHERE cat_id BETWEEN 1 AND  5;
    ## Tabla Productos
    SELECT * FROM products;
    -- consulta selectiva
    SELECT product, category FROM products
    WHERE category = 13; -- condicion
    -- consulta anidada
    SELECT product, category FROM products
    WHERE category = (SELECT cat_id FROM categories WHERE description = 'hogar');
    -- consulta con multiples condiciones
    SELECT product, category FROM products
    WHERE category = (SELECT cat_id FROM categories WHERE description = 'hogar')
		OR category = (SELECT cat_id FROM categories WHERE description = 'herramientas')
		OR category = (SELECT cat_id FROM categories WHERE description = 'tecnologia');
	-- consulta con rango de valores
    SELECT product, category FROM products
    WHERE category IN(2,4,13) OR product LIKE 'Abono%';
    -- _ 1 caracter || % cualquier cantidad de caracteres
    /*
		AND|c1v |c1f		OR |c1v	|c1f		XOR	|c1v|c1f
        c1v| V	| F			c1v| V	| V			c1v	| F	| V
        c2f| F	| F			c2f| V	| F			c2f	| V	| F
    */
    ## Tabla Publicaciones
    SELECT * FROM posts;
    -- campo calculados
    SELECT 
		post_title, 
        quantity, 
        price,
        price * quantity AS total
	FROM posts;
    -- campos agrupados
    SELECT 
		user,
		ROUND(AVG(price), 2) AS promedio,
		MIN(price) AS producto_economico,
        MAX(price) AS producto_costoso,
        COUNT(price) AS publicaciones,
        SUM(price * quantity) AS recaudacion_maxima,
        SUM(price * quantity) * 0.15 AS comision
    FROM posts
    WHERE user IN (3,5) -- condicion para campos de tabla
	GROUP BY user -- condicion de agrupacion
    HAVING comision >= 1800000 -- condicion para campos calculados
	;