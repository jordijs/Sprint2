#1. Llista el nom de tots els productes que hi ha en la taula "producto".
SELECT nombre FROM producto;

#2. Llista els noms i els preus de tots els productes de la taula "producto".
SELECT nombre, precio FROM producto;

#3. Llista totes les columnes de la taula "producto".
SELECT * FROM producto;
#3: És correcta, però pots fer servir també SHOW_COLUMNS()
SHOW COLUMNS FROM producto;

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
*/

#38. Llista el nom del producte més car del fabricant Lenovo.
SELECT producto.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre LIKE "Lenovo" ORDER BY producto.precio DESC LIMIT 1;

#39. Llista el nom del producte més barat del fabricant Hewlett-Packard.
SELECT producto.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre LIKE "Hewlett-Packard" ORDER BY producto.precio ASC LIMIT 1;

#40. Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.
SELECT producto.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE producto.precio >= (SELECT producto.precio FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre LIKE "Lenovo" ORDER BY producto.precio DESC LIMIT 1);

#41. Llista tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.
SELECT producto.alumno_se_matricula_asignaturanombre FROM producto LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE producto.precio > (SELECT AVG (producto.precio)FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre LIKE "Asus") AND fabricante.nombre LIKE "Asus";
#41: No és correcta. CORREGIT. ARA JA FUNCIONA

#UNIVERSIDAD

#1. Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo LIKE "alumno" ORDER BY apellido1, apellido2, nombre	ASC;

#2. Esbrina el nom i els dos cognoms dels/les alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo LIKE "alumno" AND telefono IS NULL;

#3. Retorna el llistat dels/les alumnes que van néixer en 1999.
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo LIKE "alumno" AND fecha_nacimiento LIKE "1999%";

#4. Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo LIKE "profesor" AND telefono IS NULL AND nif LIKE "%K";

#5. Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
SELECT nombre FROM asignatura WHERE cuatrimestre LIKE "1" AND curso LIKE "3" AND id_grado LIKE "7";

#6. Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats/des. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre FROM persona, profesor, departamento WHERE persona.id = profesor.id_profesor AND departamento.id = profesor.id_departamento ORDER BY persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;

#7. Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.
SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM alumno_se_matricula_asignatura INNER JOIN persona ON persona.id = alumno_se_matricula_asignatura.id_alumno INNER JOIN asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura INNER JOIN curso_escolar ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar WHERE persona.nif LIKE "26902806M";

#8. Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
SELECT DISTINCT d.nombre AS "Nom de departament" FROM departamento d INNER JOIN profesor p ON p.id_departamento = d.id INNER JOIN asignatura a ON a.id_profesor = p.id_profesor INNER JOIN grado g ON g.id = a.id_grado WHERE g.nombre LIKE "Grado en Ingeniería Informática (Plan 2015)";

#9. Retorna un llistat amb tots els/les alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
SELECT DISTINCT p.apellido1, p.apellido2, p.nombre FROM persona p INNER JOIN alumno_se_matricula_asignatura asma ON asma.id_alumno = p.id INNER JOIN curso_escolar ce ON ce.id = asma.id_curso_escolar WHERE ce.anyo_inicio LIKE "2018";

#Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.
#1. Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats/des. El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.
SELECT departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre FROM persona RIGHT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN departamento ON departamento.id = profesor.id_profesor ORDER BY departamento.nombre ASC, persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;
#1: No mostres profes sense departament. Que no hi hagi a les dades, no vol dir que no es puguin crear. I si es crean, han d'entrar en aquesta consulta.

#2. Retorna un llistat amb els professors/es que no estan associats a un departament.
SELECT persona.apellido1, persona.apellido2, persona.nombre FROM persona RIGHT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN departamento ON departamento.id = profesor.id_profesor WHERE departamento.nombre IS NULL;
#Incorrecte

#3. Retorna un llistat amb els departaments que no tenen professors/es associats.
SELECT departamento.nombre FROM persona RIGHT JOIN profesor ON persona.id = profesor.id_profesor RIGHT JOIN departamento ON departamento.id = profesor.id_profesor WHERE persona.apellido1 IS NULL;
#Incorrecte

#4. Retorna un llistat amb els professors/es que no imparteixen cap assignatura.
SELECT persona.apellido1, persona.apellido2, persona.nombre FROM persona RIGHT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor WHERE asignatura.nombre IS NULL;

#5. Retorna un llistat amb les assignatures que no tenen un professor/a assignat.
SELECT asignatura.nombre FROM persona RIGHT JOIN profesor ON persona.id = profesor.id_profesor RIGHT JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor WHERE persona.nombre IS NULL;

#6. Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
SELECT DISTINCT departamento.nombre FROM departamento LEFT JOIN profesor ON profesor.id_profesor = departamento.id LEFT JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor LEFT JOIN alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id WHERE id_curso_escolar IS NULL;
#Incorrecte

#Consultes resum:
#1. Retorna el nombre total d'alumnes que hi ha.
SELECT COUNT(id) FROM persona WHERE tipo LIKE "alumno";

#2. Calcula quants/es alumnes van néixer en 1999.
SELECT COUNT(id) FROM persona WHERE tipo LIKE "alumno" AND fecha_nacimiento LIKE "1999%";
#Per preguntar per anys, també pots fer servir YEAR().
SELECT COUNT(id) FROM persona WHERE tipo LIKE "alumno" AND YEAR(fecha_nacimiento) LIKE "1999";

#3. Calcula quants/es professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es.
SELECT departamento.nombre AS "Nom del departament", COUNT(profesor.id_profesor) AS "Nombre de professors/es" FROM departamento RIGHT JOIN profesor ON profesor.id_departamento = departamento.id GROUP BY departamento.nombre ORDER BY COUNT(profesor.id_profesor) DESC;

#4. Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. Té en compte que poden existir departaments que no tenen professors/es associats/des. Aquests departaments també han d'aparèixer en el llistat.
SELECT departamento.nombre AS "Nom del departament", COUNT(profesor.id_profesor) AS "Nombre de professors/es" FROM departamento LEFT JOIN profesor ON profesor.id_departamento = departamento.id GROUP BY departamento.nombre;

#5. Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Té en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.
SELECT grado.nombre AS "Nom del grau", COUNT(asignatura.id) AS "Nombre d'assignatures" FROM grado LEFT JOIN asignatura ON asignatura.id_grado = grado.id GROUP BY grado.nombre ORDER BY COUNT(asignatura.id) DESC;

#6. Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.
SELECT grado.nombre AS "Nom del grau", COUNT(asignatura.id) AS "Nombre d'assignatures" FROM grado LEFT JOIN asignatura ON asignatura.id_grado = grado.id GROUP BY grado.nombre HAVING COUNT(asignatura.id_grado) > 40;

#7. Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.
SELECT grado.nombre AS "Nom del grau", asignatura.tipo AS "Tipus d'assignatura", SUM(creditos) AS "Suma dels crèdits" FROM asignatura LEFT JOIN grado ON asignatura.id_grado = grado.id GROUP BY asignatura.id_grado, asignatura.tipo;

#8. Retorna un llistat que mostri quants/es alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats/des.
SELECT curso_escolar.anyo_inicio AS "Any d'inici", COUNT(alumno_se_matricula_asignatura.id_alumno) AS "alumnes matriculats" FROM curso_escolar LEFT JOIN alumno_se_matricula_asignatura ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar GROUP BY curso_escolar.anyo_inicio;

#9. Retorna un llistat amb el nombre d'assignatures que imparteix cada professor/a. El llistat ha de tenir en compte aquells professors/es que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.
SELECT profesor.id_profesor AS "ID", persona.nombre AS "Nom", persona.apellido1 AS "Primer cognom", persona.apellido2 AS "Segon cognom", COUNT(asignatura.id) AS "Nombre d'assignatures" FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE persona.tipo LIKE "profesor" GROUP BY profesor.id_profesor ORDER BY COUNT(asignatura.id) DESC;

#10. Retorna totes les dades de l'alumne més jove.
SELECT * from persona WHERE tipo LIKE "alumno" ORDER BY fecha_nacimiento DESC LIMIT 1;

#11. Retorna un llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura.
SELECT DISTINCT persona.nombre, persona.apellido1, persona.apellido2 FROM profesor INNER JOIN departamento ON profesor.id_departamento = departamento.id RIGHT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor RIGHT JOIN persona ON profesor.id_profesor = persona.id WHERE asignatura.id IS NOT NULL;