-- Crear la tabla Categoria
CREATE TABLE Categoria (
    id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL
);

-- Crear la tabla Producto
CREATE TABLE Producto (
    id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    marca TEXT NOT NULL,
    categoria_id INTEGER,
    precio_unitario REAL NOT NULL,
    FOREIGN KEY (categoria_id) REFERENCES Categoria(id)
);

-- Crear la tabla Sucursal
CREATE TABLE Sucursal (
    id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    direccion TEXT NOT NULL
);

-- Crear la tabla Stock
CREATE TABLE Stock (
    id INTEGER PRIMARY KEY,
    sucursal_id INTEGER,
    producto_id INTEGER,
    cantidad INTEGER NOT NULL,
    UNIQUE (sucursal_id, producto_id),
    FOREIGN KEY (sucursal_id) REFERENCES Sucursal(id),
    FOREIGN KEY (producto_id) REFERENCES Producto(id)
);

-- Crear la tabla Cliente
CREATE TABLE Cliente (
    id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    telefono TEXT NOT NULL
);

-- Crear la tabla Orden
CREATE TABLE Orden (
    id INTEGER PRIMARY KEY,
    cliente_id INTEGER,
    sucursal_id INTEGER,
    fecha TEXT NOT NULL,
    total REAL NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id),
    FOREIGN KEY (sucursal_id) REFERENCES Sucursal(id)
);

-- Crear la tabla Item
CREATE TABLE Item (
    id INTEGER PRIMARY KEY,
    orden_id INTEGER,
    producto_id INTEGER,
    cantidad INTEGER NOT NULL,
    monto_venta REAL NOT NULL,
    FOREIGN KEY (orden_id) REFERENCES Orden(id),
    FOREIGN KEY (producto_id) REFERENCES Producto(id)
);