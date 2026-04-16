create table Clientes(
	dpi_cliente int auto_increment not null,
    nombre_cliente varchar(50),
    apellido_cliente varchar(50),
    direccion varchar(100),
    estado int,
    constraint dpi_cliente primary key(dpi_cliente) 
);
 
create table Usuarios(
	codigo_usuario int auto_increment not null,
    username varchar(45),
    password varchar(100),
    email varchar(60),
    rol varchar(45),
    estado int,
    constraint codigo_usuario primary key(codigo_usuario)
);
 
create table Ventas(
	codigo_venta int auto_increment not null,
    fecha_venta date,
    total decimal(10,2),
    estado int,
    FKdpi_cliente int,
    FKcodigo_usuario int,
    constraint codigo_venta primary key(codigo_venta),
    foreign key(FKdpi_cliente) references Clientes(dpi_cliente) on delete cascade,
    foreign key(FKcodigo_usuario) references Usuarios(codigo_usuario) on delete cascade
);
 
create table Productos(
	codigo_producto int auto_increment not null,
    nombre_producto varchar(60),
    precio decimal(10,2),
    stock int,
    estado int,
    constraint codigo_producto primary key (codigo_producto)
);
 
create table DetalleVenta(
	codigo_detalle_venta int,
	cantidad int,
    precio_unitario decimal(10,2),
    subtotal decimal(10,2),
    FKcodigo_producto int,
    FKcodigo_venta int,
    constraint codigo_detalle_venta primary key(codigo_detalle_venta),
    foreign key(FKcodigo_producto) references Productos(codigo_producto) on delete cascade,
    foreign key(FKcodigo_venta) references Ventas(codigo_venta) on delete cascade
);
 
-- PROCEDIMENTOS ALMACENADOS --
 
-- CLIENTES --
 
delimiter $$
create procedure sp_cliente_create(
	in p_nombre_cliente varchar(50),
    in p_apellido_cliente varchar(50),
    in p_direccion varchar(100),
    in p_estado int
)
begin
	insert into Clientes(nombre_cliente, apellido_cliente, direccion, estado)
    values (p_nombre_cliente, p_apellido_cliente, p_direccion, p_estado);
end$$
delimiter ;
 
delimiter $$
create procedure sp_clientes_read_all()
begin
	select * from Clientes;
end$$
delimiter ;
 
delimiter $$
create procedure sp_clientes_read_by_id(in p_id int)
begin
	select * from Clientes
    where dpi_cliente = p_id;
end$$
delimiter ;
 
delimiter $$
create procedure sp_clientes_update(
	in p_id int,
    in p_nombre_cliente varchar(50),
    in p_apellido_cliente varchar(50),
    in p_direccion varchar(100),
    in p_estado int
)
begin
	update Clientes
    set nombre_cliente = p_nombre_cliente,
		apellido_cliente = p_apellido_cliente,
        direccion = p_direccion,
        estado = p_estado
        where dpi_cliente = p_id;
        select row_count() as filas_afectadas;
end$$
delimiter ;
 
delimiter $$
create procedure sp_clientes_delete(p_id int)
begin
	delete from Clientes
    where dpi_cliente = p_id;
    select row_count() as filas_afectadas;
end$$
delimiter ;
 
-- USUARIOS --
 
delimiter $$
create procedure sp_usuarios_create(
	in p_username varchar(45),
    in p_password varchar(45),
    in p_email varchar(60),
    in p_rol varchar(45),
    in p_estado int
)
begin
	insert into Usuarios(username, password, email, rol, estado)
    values (p_username, p_password, p_email, p_rol, p_estado);
end$$
delimiter ;
 
delimiter $$
create procedure sp_usuarios_read_all()
begin
	select * from Usuarios;
end$$
delimiter ;
 
delimiter $$
create procedure sp_usuarios_read_by_id(in p_id int)
begin
	select * from Usuarios
    where codigo_usuario = p_id;
end$$
delimiter ;
 
delimiter $$
create procedure sp_usuarios_update(
	in p_id int,
    in p_username varchar(45),
    in p_password varchar(45),
    in p_email varchar(60),
    in p_rol varchar(45),
    in p_estado int
)
begin
	update Usuarios
    set username = p_username,
		password = p_password,
        email = p_email,
        rol = p_rol,
        estado = p_estado
        where codigo_usuario = p_id;
        select row_count() as filas_afectadas;
end$$
delimiter ;
 
delimiter $$
create procedure sp_usuarios_delete(p_id int)
begin
	delete from Usuarios
    where codigo_usuario = p_id;
    select row_count() as filas_afectadas;
end$$
delimiter ;
 
-- VENTAS --
 
delimiter $$
create procedure sp_ventas_create(
	in p_fecha_venta date,
    in p_total decimal(10,2),
    in p_estado int,
    in p_FKdpi_cliente int,
    in p_FKcodigo_usuario int
)
begin
	insert into Ventas(fecha_venta, total, estado, FKdpi_cliente, FKcodigo_usuario)
    values (p_fecha_venta, p_total, p_estado, p_FKdpi_cliente, p_FKcodigo_usuario);
end$$
delimiter ;
 
delimiter $$
create procedure sp_ventas_read_all()
begin
	select * from Ventas;
end$$
delimiter ;
 
delimiter $$
create procedure sp_ventas_read_by_id(in p_id int)
begin
	select * from Ventas
    where codigo_venta = p_id;
end$$
delimiter ;
 
delimiter $$
create procedure sp_ventas_update(
	in p_id int,
    in p_fecha_venta date,
    in p_total decimal(10,2),
    in p_estado int,
    in p_FKdpi_cliente int,
    in p_FKcodigo_usuario int
)
begin
	update Ventas
    set fecha_venta = p_fecha_venta,
        total = p_total,
        estado = p_estado,
        FKdpi_cliente = p_FKdpi_cliente,
        FKcodigo_usuario = p_FKcodigo_usuario
    where codigo_venta = p_id;
    select row_count() as filas_afectadas;
end$$
delimiter ;
 
delimiter $$
create procedure sp_ventas_delete(p_id int)
begin
	delete from Ventas
    where codigo_venta = p_id;
    select row_count() as filas_afectadas;
end$$
delimiter ;
 
-- PRODUCTOS --
 
delimiter $$
create procedure sp_productos_create(
	in p_nombre_producto varchar(60),
    in p_precio decimal(10,2),
    in p_stock int,
    in p_estado int
)
begin
	insert into Productos(nombre_producto, precio, stock, estado)
    values (p_nombre_producto, p_precio, p_stock, p_estado);
end$$
delimiter ;
 
delimiter $$
create procedure sp_productos_read_all()
begin
	select * from Productos;
end$$
delimiter ;
 
delimiter $$
create procedure sp_productos_read_by_id(in p_id int)
begin
	select * from Productos
    where codigo_producto = p_id;
end$$
delimiter ;
 
delimiter $$
create procedure sp_productos_update(
	in p_id int,
    in p_nombre_producto varchar(60),
    in p_precio decimal(10,2),
    in p_stock int,
    in p_estado int
)
begin
	update Productos
    set nombre_producto = p_nombre_producto,
        precio = p_precio,
        stock = p_stock,
        estado = p_estado
    where codigo_producto = p_id;
    select row_count() as filas_afectadas;
end$$
delimiter ;
 
delimiter $$
create procedure sp_productos_delete(p_id int)
begin
	delete from Productos
    where codigo_producto = p_id;
    select row_count() as filas_afectadas;
end$$
delimiter ;
 
-- DETALLES VENTA --
 
delimiter $$
create procedure sp_detalleventa_create(
	in p_codigo_detalle_venta int,
    in p_cantidad int,
    in p_precio_unitario decimal(10,2),
    in p_subtotal decimal(10,2),
    in p_FKcodigo_producto int,
    in p_FKcodigo_venta int
)
begin
	insert into DetalleVenta(
        codigo_detalle_venta,
        cantidad,
        precio_unitario,
        subtotal,
        FKcodigo_producto,
        FKcodigo_venta
    )
    values (
        p_codigo_detalle_venta,
        p_cantidad,
        p_precio_unitario,
        p_subtotal,
        p_FKcodigo_producto,
        p_FKcodigo_venta
    );
end$$
delimiter ;
 
delimiter $$
create procedure sp_detalleventa_read_all()
begin
	select * from DetalleVenta;
end$$
delimiter ;
 
delimiter $$
create procedure sp_detalleventa_read_by_id(in p_id int)
begin
	select * from DetalleVenta
    where codigo_detalle_venta = p_id;
end$$
delimiter ;
 
delimiter $$
create procedure sp_detalleventa_update(
	in p_id int,
    in p_cantidad int,
    in p_precio_unitario decimal(10,2),
    in p_subtotal decimal(10,2),
    in p_FKcodigo_producto int,
    in p_FKcodigo_venta int
)
begin
	update DetalleVenta
    set cantidad = p_cantidad,
        precio_unitario = p_precio_unitario,
        subtotal = p_subtotal,
        FKcodigo_producto = p_FKcodigo_producto,
        FKcodigo_venta = p_FKcodigo_venta
    where codigo_detalle_venta = p_id;
    select row_count() as filas_afectadas;
end$$
delimiter ;
 
delimiter $$
create procedure sp_detalleventa_delete(p_id int)
begin
	delete from DetalleVenta
    where codigo_detalle_venta = p_id;
    select row_count() as filas_afectadas;
end$$
delimiter ;
 
-- REGISTROS --
 
-- CLIENTES --
CALL sp_cliente_create('Juan', 'Pérez', '7ma Avenida, Zona 1', 1);
CALL sp_cliente_create('María', 'García', 'Calzada Roosevelt, Zona 11', 1);
CALL sp_cliente_create('Carlos', 'López', 'Avenida Las Américas, Zona 14', 1);
CALL sp_cliente_create('Ana', 'Martínez', 'Ruta 6, Zona 4', 1);
CALL sp_cliente_create('Luis', 'Rodríguez', 'Km 15 Carretera a El Salvador', 1);
CALL sp_cliente_create('Elena', 'Sánchez', 'Colonia El Maestro, Zona 15', 1);
CALL sp_cliente_create('Roberto', 'Gómez', 'Bulevar Liberación, Zona 13', 0);
CALL sp_cliente_create('Sofía', 'Díaz', 'Condominio Las Luces, Zona 16', 1);
CALL sp_cliente_create('Fernando', 'Torres', 'San José Pinula', 1);
CALL sp_cliente_create('Lucía', 'Morales', 'Avenida Reforma, Zona 10', 1);
 
-- USUARIOS --
CALL sp_usuarios_create('admin', '12345', 'admin@tienda.com', 'ADMIN', 1);
CALL sp_usuarios_create('vendedor1', 'pass123', 'juan@tienda.com', 'VENDEDOR', 1);
CALL sp_usuarios_create('vendedor2', 'pass123', 'lucia@tienda.com', 'VENDEDOR', 1);
CALL sp_usuarios_create('gerente', 'gerente789', 'ana@tienda.com', 'ADMIN', 1);
CALL sp_usuarios_create('cajero1', 'caja01', 'pedro@tienda.com', 'VENDEDOR', 1);
CALL sp_usuarios_create('cajero2', 'caja02', 'marta@tienda.com', 'VENDEDOR', 1);
CALL sp_usuarios_create('auditor', 'audit2024', 'luis@tienda.com', 'VENDEDOR', 1);
CALL sp_usuarios_create('soporte', 'soporteX', 'tecnico@tienda.com', 'VENDEDOR', 1);
CALL sp_usuarios_create('invitado', 'invitado', 'guest@tienda.com', 'VENDEDOR', 0);
CALL sp_usuarios_create('supervisor', 'super01', 'carlos@tienda.com', 'ADMIN', 1);
 
-- VENTAS --
CALL sp_ventas_create('2024-03-01', 1700.00, 1, 1, 1);
CALL sp_ventas_create('2024-03-02', 450.00, 1, 2, 2);
CALL sp_ventas_create('2024-03-03', 6250.00, 1, 3, 3);
CALL sp_ventas_create('2024-03-04', 185.50, 1, 4, 4);
CALL sp_ventas_create('2024-03-05', 1400.00, 1, 5, 1);
CALL sp_ventas_create('2024-03-06', 750.00, 1, 6, 2);
CALL sp_ventas_create('2024-03-07', 400.00, 1, 7, 3);
CALL sp_ventas_create('2024-03-08', 350.00, 0, 8, 4);
CALL sp_ventas_create('2024-03-09', 2500.00, 1, 9, 1);
CALL sp_ventas_create('2024-03-10', 900.00, 1, 10, 2);
 
-- PRODUCTOS --
CALL sp_productos_create('Monitor Gamer 24', 1250.00, 20, 1);
CALL sp_productos_create('Teclado Mecánico RGB', 450.00, 50, 1);
CALL sp_productos_create('Mouse Inalámbrico', 185.50, 100, 1);
CALL sp_productos_create('Laptop HP Core i5', 5600.00, 10, 1);
CALL sp_productos_create('Impresora Epson L3210', 1400.00, 15, 1);
CALL sp_productos_create('Memoria RAM 16GB', 650.00, 40, 1);
CALL sp_productos_create('Disco Duro 1TB', 400.00, 30, 1);
CALL sp_productos_create('Auriculares HyperX', 750.00, 25, 1);
CALL sp_productos_create('Cargador Universal', 250.00, 20, 1);
CALL sp_productos_create('Webcam Full HD', 350.00, 45, 1);
 
-- DETALLES VENTAS --
CALL sp_detalleventa_create(1, 1, 1250.00, 1250.00, 1, 1);
CALL sp_detalleventa_create(2, 1, 450.00, 450.00, 2, 1);
CALL sp_detalleventa_create(3, 1, 450.00, 450.00, 2, 2);
CALL sp_detalleventa_create(4, 1, 5600.00, 5600.00, 4, 3);
CALL sp_detalleventa_create(5, 1, 650.00, 650.00, 6, 3);
CALL sp_detalleventa_create(6, 1, 185.50, 185.50, 3, 4);
CALL sp_detalleventa_create(7, 1, 1400.00, 1400.00, 5, 5);
CALL sp_detalleventa_create(8, 1, 750.00, 750.00, 8, 6);
CALL sp_detalleventa_create(9, 1, 400.00, 400.00, 7, 7);
CALL sp_detalleventa_create(10, 2, 1250.00, 2500.00, 1, 9);