#1. Llista el nom de tots els productes que hi ha en la taula "producto".
SELECT nombre FROM producto;

#2. Llista els noms i els preus de tots els productes de la taula "producto".
SELECT nombre, precio FROM producto;

#3. Llista totes les columnes de la taula "producto".
SELECT * FROM producto;

#4. Llista el nom dels "productos", el preu en euros i el preu en dòlars nord-americans (USD).
SELECT nombre, precio, precio * 0.9793256 FROM producto;

#5. Llista el nom dels "productos", el preu en euros i el preu en dòlars nord-americans. Utilitza els següents àlies per a les columnes: nom de "producto", euros, dòlars nord-americans.
SELECT nombre AS 'nom de "producto"', precio AS 'euros', precio * 0.9793256 AS 'dòlars nord-americans' FROM producto;

#6. Llista els noms i els preus de tots els productes de la taula "producto", convertint els noms a majúscula.
SELECT UPPER(nombre), precio FROM producto;

#7. Llista els noms i els preus de tots els productes de la taula "producto", convertint els noms a minúscula.
SELECT LOWER(nombre), precio FROM producto;

#8. Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.
SELECT nombre, UPPER(LEFT(nombre, 2)) FROM fabricante;

#9. Llista els noms i els preus de tots els productes de la taula "producto", arrodonint el valor del preu.
SELECT nombre, ROUND(precio) FROM producto;

#10. Llista els noms i els preus de tots els productes de la taula "producto", truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
SELECT nombre, TRUNCATE(precio, 0) FROM producto;

#11. Llista el codi dels fabricants que tenen productes en la taula "producto".
SELECT codigo_fabricante FROM producto;

#12. Llista el codi dels fabricants que tenen productes en la taula "producto", eliminant els codis que apareixen repetits.
SELECT DISTINCT codigo_fabricante FROM producto;

#13. Llista els noms dels fabricants ordenats de manera ascendent.
SELECT nombre FROM fabricante ORDER BY nombre ASC; 

#14. Llista els noms dels fabricants ordenats de manera descendent.
SELECT nombre FROM fabricante ORDER BY nombre DESC; 

#15. Llista els noms dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, pel preu de manera descendent.
SELECT nombre FROM producto ORDER BY nombre ASC, precio DESC;

#16. Retorna una llista amb les 5 primeres files de la taula "fabricante".
SELECT * FROM fabricante LIMIT 5;

#17. Retorna una llista amb 2 files a partir de la quarta fila de la taula "fabricante". La quarta fila també s'ha d'incloure en la resposta.
SELECT * FROM fabricante LIMIT 3, 2;

#18. Llista el nom i el preu del producte més barat. (Utilitza solament les clàusules ORDER BY i LIMIT).
SELECT nombre, precio FROM producto ORDER BY precio LIMIT 1;


#19. Llista el nom i el preu del producte més car. (Fes servir solament les clàusules ORDER BY i LIMIT).
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

#20. Llista el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2.
SELECT nombre FROM fabricante WHERE codigo = 2;

#21. Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades
SELECT producto.nombre AS 'Nom del producte', precio AS 'Preu', fabricante.nombre AS 'Nom de fabricant' FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante;

#22. Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordena el resultat pel nom del fabricant, per ordre alfabètic.
SELECT producto.nombre AS 'Nom del producte', precio AS 'Preu', fabricante.nombre AS 'Nom de fabricant' FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante ORDER BY fabricante.nombre;

#23. Retorna una llista amb el codi del producte, nom del producte, codi del fabricant i nom del fabricant, de tots els productes de la base de dades.
SELECT producto.codigo AS 'Codi del producte', producto.nombre AS 'Nom del producte', producto.codigo_fabricante AS 'Codi del fabricant', fabricante.nombre AS 'Nom de fabricant' FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante;

#24. Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
SELECT producto.nombre AS 'Nom del producte', precio AS 'Preu', fabricante.nombre AS 'Nom de fabricant' FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante ORDER BY producto.precio LIMIT 1;

#25. Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
SELECT producto.nombre AS 'Nom del producte', precio AS 'Preu', fabricante.nombre AS 'Nom de fabricant' FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante ORDER BY producto.precio DESC LIMIT 1;

#26. Retorna una llista de tots els productes del fabricant Lenovo.
SELECT producto.nombre FROM productO INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre LIKE 'lenovo';

#27. Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200 €.
SELECT producto.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre LIKE 'crucial' AND precio > 200;

#28. Retorna una llista amb tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Sense utilitzar l'operador IN.
SELECT producto.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Asus' OR fabricante.nombre = 'Hewlett-Packard' OR fabricante.nombre = 'Seagate';

#29. Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Usant l'operador IN.
SELECT producto.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre IN ('Asus', 'Hewlett-Packard','Seagate');

#30 Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
SELECT producto.nombre, producto.precio FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre LIKE '%e';

#31. Retorna un llistat amb el nom i el preu de tots els productes dels fabricants dels quals contingui el caràcter w en el seu nom.
SELECT *, producto.nombre, producto.precio FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre LIKE '%w%';

#32. Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180 €. Ordena el resultat, en primer lloc, pel preu (en ordre descendent) i, en segon lloc, pel nom (en ordre ascendent).
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE producto.precio >= 180 ORDER BY producto.precio DESC, producto.nombre ASC;

#33.Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
SELECT producto.codigo_fabricante, fabricante.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante GROUP BY fabricante.nombre;

#34. Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
SELECT fabricante.nombre, producto.nombre FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante;

#35. Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
SELECT fabricante.nombre FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE producto.nombre IS NULL;

#36. Retorna tots els productes del fabricant Lenovo. (Sense utilitzar INNER JOIN).
SELECT producto.nombre FROM producto, fabricante WHERE (producto.codigo_fabricante = fabricante.codigo) AND (fabricante.nombre LIKE 'Lenovo');
#no vàlid. seria una join implícita i vol que ho fem diferent

#37. Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense fer servir INNER JOIN).
/* 
NO FUNCIONA
SELECT * FROM producto, fabricante WHERE (producto.codigo_fabricante = fabricante.codigo) AND (producto.precio >= (SELECT producto.precio FROM producto WHERE fabricante.nombre LIKE 'Lenovo' ORDER BY producto.precio DESC LIMIT 1));
SELECT * FROM producto WHERE producto.precio = (SELECT producto.precio FROM producto WHERE producto.codigo_fabricante LIKE '2' ORDER BY producto.precio DESC LIMIT 1);
SELECT * FROM producto WHERE producto.precio = (SELECT producto.precio FROM producto WHERE producto.codigo_fabricante LIKE '2' ORDER BY producto.precio DESC LIMIT 1 (producto.codigo_fabricante = fabricante.codigo));

SELECT name, cost
FROM product
WHERE id=(SELECT product_id
  FROM sale
    WHERE price=2000
    AND product_id=product.id
  );
*/

#38. Llista el nom del producte més car del fabricant Lenovo.
SELECT producto.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre LIKE "Lenovo" ORDER BY producto.precio DESC LIMIT 1;

#39. Llista el nom del producte més barat del fabricant Hewlett-Packard.
SELECT producto.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre LIKE "Hewlett-Packard" ORDER BY producto.precio ASC LIMIT 1;

#40. Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.
SELECT producto.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE producto.precio >= (SELECT producto.precio FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre LIKE "Lenovo" ORDER BY producto.precio DESC LIMIT 1);

#41. Llista tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.
SELECT producto.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE producto.precio > (SELECT AVG (producto.precio)FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre LIKE "Asus");
