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

#2. Retorna un llistat amb els professors/es que no estan associats a un departament.
SELECT persona.apellido1, persona.apellido2, persona.nombre FROM persona RIGHT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN departamento ON departamento.id = profesor.id_profesor WHERE departamento.nombre IS NULL;

#3. Retorna un llistat amb els departaments que no tenen professors/es associats.
SELECT departamento.nombre FROM persona RIGHT JOIN profesor ON persona.id = profesor.id_profesor RIGHT JOIN departamento ON departamento.id = profesor.id_profesor WHERE persona.apellido1 IS NULL;

#4. Retorna un llistat amb els professors/es que no imparteixen cap assignatura.
SELECT persona.apellido1, persona.apellido2, persona.nombre FROM persona RIGHT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor WHERE asignatura.nombre IS NULL;

#5. Retorna un llistat amb les assignatures que no tenen un professor/a assignat.
SELECT asignatura.nombre FROM persona RIGHT JOIN profesor ON persona.id = profesor.id_profesor RIGHT JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor WHERE persona.nombre IS NULL;

#6. Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
SELECT DISTINCT departamento.nombre FROM departamento LEFT JOIN profesor ON profesor.id_profesor = departamento.id LEFT JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor LEFT JOIN alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id WHERE id_curso_escolar IS NULL;


#Consultes resum:
#1. Retorna el nombre total d'alumnes que hi ha.
SELECT COUNT(id) FROM persona WHERE tipo LIKE "alumno";

#2. Calcula quants/es alumnes van néixer en 1999.
SELECT COUNT(id) FROM persona WHERE tipo LIKE "alumno" AND fecha_nacimiento LIKE "1999%";

#3. Calcula quants/es professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es.
SELECT departamento.nombre AS "Nom del departament", COUNT(profesor.id_profesor) AS "Nombre de professors/es" FROM departamento RIGHT JOIN profesor ON profesor.id_departamento = departamento.id GROUP BY departamento.nombre ORDER BY COUNT(profesor.id_profesor) DESC;

#4. Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. Té en compte que poden existir departaments que no tenen professors/es associats/des. Aquests departaments també han d'aparèixer en el llistat.
SELECT departamento.nombre AS "Nom del departament", COUNT(profesor.id_profesor) AS "Nombre de professors/es" FROM departamento LEFT JOIN profesor ON profesor.id_departamento = departamento.id GROUP BY departamento.nombre;

#5. Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Té en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.
SELECT grado.nombre AS "Nom del grau", COUNT(asignatura.id) AS "Nombre d'assignatures" FROM grado LEFT JOIN asignatura ON asignatura.id_grado = grado.id GROUP BY grado.nombre ORDER BY COUNT(asignatura.id) DESC;
