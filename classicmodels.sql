USE classicmodels;
SELECT *
FROM customers;

/* ¿Cuántos clentes hay? 
- ¿Qué dato me interesa coger de la tabla? 
El número que identifica cada cliente: customerNumber
- ¿Cuántos customerNumer diferentes podemos encontrar en la tabla Customer? 
Debemos contar el número de filas COUNT(). En el caso de que hubiera duplicaciones, deberiamos utilizar DISTINCT
*/
SELECT COUNT(customerNumber) AS Número_de_Clientes
FROM customers; 

SELECT COUNT(DISTINCT customerNumber) AS Número_de_Clientes
FROM customers; 

/* ¿De qué ciudades son nuestros clientes? 
- ¿Qué dato me interesa coger de la tabla? 
Las ciudad: city
- ¿Tengo clientes de la misma ciudad?
si. Como quiero unicamente la ciudad utilizamos DISTINCT
*/

SELECT DISTINCT city AS CIUDAD
FROM customers
;

/* ¿Cuántos clientes hay de la ciudad Nantes?
- ¿Qué dato me interesa coger de la tabla? 
Ciudad y Número del cliente
Recuento de clientes: COUNT()
Las agrupaciones son entre las ciudades: GROUP BY
*/

SELECT city AS Ciudad, COUNT(customerNumber) AS Número_de_Clientes
FROM customers
GROUP BY city
;

/* Para conectar más tablas
¿Cuántos empleados atiende cada ciudad?
*/
SELECT C.city AS Ciudad, COUNT(E.employeeNumber) AS Número_de_empleados
FROM customers AS C, employees AS E
GROUP BY C.city
;

/* ¿Cuántos empleados y clientes hay en cada ciudad?
- ¿Qué dato me interesa coger de la tabla? 
Ciudad y Número del cliente y Número de empleado
Recuento de clientes: COUNT()
Debemos utilizar DISTINCT para contar el número de clientes únicos
Recuento de empleado: COUNT()
Las agrupaciones son entre las ciudades: GROUP BY
*/
SELECT C.city AS Ciudad, COUNT(DISTINCT C.customerNumber) AS Cliente,  
COUNT(E.employeeNumber) AS Número_de_empleados
FROM customers AS C, employees AS E
GROUP BY C.city
;

