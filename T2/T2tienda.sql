-- 1
SELECT nombre FROM producto;
-- 2
SELECT nombre,precio FROM producto;
-- 3
SELECT * FROM producto;
-- 
SELECT precio AS euros, ROUND(precio * 1.0831) AS dollars FROM producto;
-- 5
SELECT  nombre AS nombreDeProducto, precio AS euros, ROUND (precio * 1.0831) AS dollars FROM producto;
-- 6
SELECT UPPER(nombre) AS nombresMayusculas,precio FROM producto;
-- 7
SELECT LOWER(nombre) AS nombresMinusculas,precio FROM producto;
-- 8
SELECT UPPER(SUBSTRING(nombre, 1, 2)) AS nombresPrimerasCaps FROM fabricante;
-- 9
SELECT nombre,ROUND (precio) AS precioRedondeado FROM producto; 
-- 10
SELECT nombre, TRUNCATE(precio, 0) AS precioTruncado  FROM producto;
-- 11
SELECT codigo_fabricante AS codigoDeProductosDeFabricantes FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante;
-- 12
SELECT DISTINCT codigo_fabricante AS codigoDeProductosDeFabricantes FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante;
-- 13
SELECT nombre FROM fabricante ORDER BY nombre;
-- 14
SELECT nombre FROM fabricante ORDER BY nombre DESC;
-- 15
SELECT nombre,precio FROM producto ORDER BY nombre ASC, precio DESC;
-- 16
SELECT * FROM fabricante LIMIT 5;
-- 17
SELECT * FROM fabricante LIMIT 3,2;
-- 18
SELECT nombre,precio FROM producto ORDER BY precio LIMIT 1;
-- 19
SELECT nombre,precio FROM producto ORDER BY precio DESC LIMIT 1;
-- 20
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
-- 21
SELECT p.nombre AS nombreProducto, p.precio,f.nombre AS nombreFabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;
-- 22
SELECT p.nombre AS nombreProducto, p.precio,f.nombre AS nombreFabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY f.nombre;
-- 23
SELECT p.codigo, p.nombre AS nombreProducto, f.nombre AS nombreFabricante, p.codigo_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;
-- 24
SELECT p.nombre AS nombreProducto, p.precio, f.nombre AS nombreFabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio = (SELECT MIN(precio) FROM producto);
-- 25
SELECT p.nombre AS nombreProducto, p.precio, f.nombre AS nombreFabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio = (SELECT MAX(precio) FROM producto);
-- 26
SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Lenovo";
-- 27
SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Crucial" AND p.precio <= 200;
-- 28
SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Asus" OR f.nombre = "Hewlett-Packard" OR f.nombre = "Seagate";
-- 29
SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ("Asus","Hewlett-Packard","Seagate");
-- 30
SELECT p.nombre, p.precio, f.nombre AS nombreFabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre REGEXP "e$";
-- 31
SELECT p.nombre, p.precio, f.nombre AS nombreFabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre REGEXP "w";
-- 32
SELECT p.nombre, p.precio, f.nombre AS nombreFabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre ASC;
-- 33
SELECT f.nombre FROM fabricante f JOIN producto p ON f.codigo = p.codigo_fabricante;
-- 34
SELECT f.nombre, p.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;
-- 35
SELECT f.nombre, p.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE p.codigo is null;
-- 36
SELECT * FROM producto p RIGHT JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Lenovo";
-- 37
SELECT * FROM producto p LEFT JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio = (SELECT MAX(p.precio) FROM producto p JOIN fabricante f ON p.codigo_fabricante=f.codigo WHERE f.nombre = "Lenovo");
-- 38
SELECT p.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Lenovo" ORDER BY precio DESC LIMIT 1;
-- 39
SELECT p.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Hewlett-Packard" ORDER BY precio LIMIT 1;
-- 40
SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE precio >= (SELECT MAX(p.precio) FROM producto WHERE f.nombre = "Lenovo");
-- 41
SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE precio > (SELECT AVG(p.precio) FROM producto WHERE f.nombre = "Asus");
