create database SIA1;
create user 'testuser'@'localhost' identified by 'pass';
grant select, insert, delete on * . * to 'testuser'@'localhost';
use SIA1;

create table empleado(
rut_ep	int not null,
nom_ep		varchar(30) not null,
ape_ep		varchar(20) not null,
sueldo_ep	int not null,
fono_ep		int not null,
direcc_ep	varchar(30),
primary key (rut_ep)
);

create table clasificacion(
id_cf	int not null,
nom_cf	varchar(30) not null,
primary key (id_cf)
);

create table proveedor(
rut_pv		int not null,
nom_pv		varchar(30),
ape_pv		varchar(20),
fono_pv		int,
empresa_pv	varchar(30),
primary key (rut_pv)
);

create table horario(
id_ho		int not null auto_increment,
rut_ep		int not null,
ho_en_ho	time,
ho_sa_ho	time,
fe_tb_ho	date,
primary key (id_ho),
foreign key (rut_ep) references empleado	(rut_ep)
);

create table venta(	
id_venta	int not null auto_increment,
rut_ep		int not null,
fecha_vt	date,
hora_vt		time,
primary key (id_venta),
foreign key (rut_ep) references empleado	(rut_ep)
);

create table producto(
cod_br_pd int not null,
id_cf int not null,
nom_pd varchar (30),
precio_pd int not null,
cant_crit_pd int not null,
primary key (cod_br_pd),
foreign key (id_cf) references clasificacion (id_cf)
);

create table provision(
id_pv 			int not null,
rut_pv 			int not null,
fecha_pi		date,
hora_pi			time,
fecha_max_pi	date,
deuda_pi	 	int,
primary key (id_pv),
foreign key (rut_pv) references proveedor	(rut_pv)
);

create table reg_venta(
id_rv 		int not null auto_increment,
cod_br_pd	int not null,	
id_venta	int not null,
cant_rv		int not null,
primary key	(id_rv),
foreign key (cod_br_pd) references producto 	(cod_br_pd),
foreign key (id_venta) 	references venta 		(id_venta)
);

create table reg_provision(
id_rp			int not null,
cod_br_pd		int not null,
id_pv			int not null,
cantidad_rp		int,
fecha_venci_rp	date,
primary key (id_rp),
foreign key (cod_br_pd) references producto 	(cod_br_pd),
foreign key (id_pv) 	references provision 	(id_pv)
);
