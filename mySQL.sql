/*Consultando la version y fecha del DBMS*/
 SELECT VERSION(), CURRENT_DATE;
 
 /*Un comando no necesita ser escrito en una sóla línea, así que los comandos que requieran 
 de varias líneas no son un problema. mysql determinará en dónde finaliza la sentencia 
 cuando encuentre el punto y coma, no cuando encuentre el fin de línea.*/
 
 /*LA SENTENCIA SELECT NOW() MUESTRA LA FECHA Y HORA*/
 SELECT version(); SELECT now();
 
/*CREAR UNA BASE DE DATOS*/
create database miPrueba;

/*SHOW: Lista las bases de datos que hay en el servidor MySQL o las
tablas de la base de datos */
show databases;
show tables;

/*DESCRIBE permite obtener información sobre una tabla, para saber qué
campos tiene y de qué tipo*/
describe nombre_tabla;

/*USE db_nombre: indica a MySQL que use la base de datos db_nombre
como la base de datos por defecto. */

use miPrueba;

/*QUIT permite salir de la línea de comandos de MySQL.*/

CREATE TABLE ESTADOS
(
idEstado INT NOT NULL,
nomEstado VARCHAR(40) NOT NULL,

CONSTRAINT PK_Estados_IdEstado PRIMARY KEY(idEstado)
);

CREATE TABLE CIUDADES
(
idCiudad INT NOT NULL,
nomCiudad VARCHAR(40) NOT NULL,

CONSTRAINT PK_Ciudades_IdCiudad PRIMARY KEY(idCiudades)
);

CREATE TABLE TIPOSPRODUCTO
(
idTipoProd INT NOT NULL,
nomTipoProd VARCHAR(40) NOT NULL,

CONSTRAINT PK_TiposProducto_IdTipoProd PRIMARY KEY(idTipoProd)
);

CREATE TABLE PRODUCTO
(
idProducto INT NOT NULL,
nomProducto VARCHAR(40) NOT NULL,
idTipoProd INT NOT NULL,

CONSTRAINT PK_Estados_IdEstado PRIMARY KEY(idProducto),
CONSTRAINT FK_Productos_idTipoProd FOREIGN KEY (idTipoProd)
REFERENCES TIPOSPRODUCTO(idTipoProd)
);

CREATE TABLE TAMANOS
(
idTamano INT NOT NULL,
nomTamano VARCHAR(40) NOT NULL,

CONSTRAINT PK_Tamanos_IdTamano PRIMARY KEY(idTamano)
);


CREATE TABLE TAMANOPRODUCTO
(
idProducto INT NOT NULL,
idTamano INT NOT NULL,
costo DECIMAL(6,2) NOT NULL,

CONSTRAINT PK_TamanoProducto_idProducto PRIMARY KEY (idProducto, idTamano),
CONSTRAINT FK_TamanoProducto_idProducto FOREIGN KEY(idProducto)
REFERENCES Productos(idProducto),
CONSTRAINT FK_TamanoProducto_idTamano FOREIGN KEY(idTamano)
REFERENCES Tamano(idTamano)
);

CREATE TABLE TIPOLOCAL
(
idTipoLocal INT NOT NULL,
nomTipoLocal VARCHAR(40) NOT NULL,

CONSTRAINT PK_TipoLocal_IdTipoLocal PRIMARY KEY(idTipoLocal)
);

CREATE TABLE LOCALES
(
idLocal INT NOT NULL,
nomLocal VARCHAR(40) NOT NULL,
idTipoLocal INT NOT NULL,
idCiudad INT NOT NULL,

CONSTRAINT PK_Locales_IdLocal PRIMARY KEY(idLocal),
CONSTRAINT FK_Locales_idTipoLocal FOREIGN KEY(idTipoLocal)
REFERENCES TipoLocal(idTamano),
CONSTRAINT FK_Locales_idCiudad FOREIGN KEY(idCiudad)
REFERENCES Ciudades(idCiudad)
);

CREATE TABLE PRECIOTIPOLOCAL
(
idProducto INT NOT NULL,
idLocal INT NOT NULL,
precio DECIMAL(6,2),

CONSTRAINT PK_PrecioProducto_idProducto PRIMARY KEY (idProducto, idLocal),
CONSTRAINT FK_PrecioProducto_idProducto FOREIGN KEY(idProducto)
REFERENCES Productos(idProducto),
CONSTRAINT FK_PrecioProducto_idLocal FOREIGN KEY(idLocal)
REFERENCES Locales(idLocal)
);

CREATE TABLE TICKETS
(
idTicket INT NOT NULL,
idLocal INT NOT NULL,
fecVenta DATE NOT NULL,
fecSeparacion DATE NOT NULL,
status CHAR(2) NOT NULL,

CONSTRAINT PK_Ticket_idTicket PRIMARY KEY (idTicket)
);

CREATE TABLE TICKETITEMS
(
idTicket INT NOT NULL,
idProducto INT NOT NULL,
idTamano INT NOT NULL,
idLocal INT NOT NULL,

CONSTRAINT PK_TicketItems_idTicket PRIMARY KEY (idTicket),
CONSTRAINT FK_TicketItems_idTicket FOREIGN KEY(idTicket)
REFERENCES Tickets(idTicket),
CONSTRAINT FK_TicketItems_idProducto FOREIGN KEY(idLocal)
REFERENCES Productos(idProductos),
CONSTRAINT FK_TicketItems_idTamano FOREIGN KEY(idTamano)
REFERENCES Tamano(idTamano),
CONSTRAINT FK_TicketItems_idLocal FOREIGN KEY(idLocal)
REFERENCES Locales(idLocal)
);




