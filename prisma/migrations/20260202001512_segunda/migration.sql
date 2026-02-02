-- CreateTable
CREATE TABLE "Productos" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nombre" TEXT NOT NULL,
    "genero" TEXT,
    "precio_costo" REAL NOT NULL,
    "precio_venta" REAL NOT NULL,
    "stock_inicial" INTEGER NOT NULL,
    "stock_minimo" INTEGER NOT NULL DEFAULT 5,
    "proveetor" TEXT NOT NULL,
    "descripcion" TEXT
);

-- CreateTable
CREATE TABLE "Carrito" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "fecha" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "estado" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Carrito_detalle" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "id_carrito" TEXT NOT NULL,
    "id_producto" TEXT NOT NULL,
    "cantidad" INTEGER NOT NULL,
    "preciounitario" REAL NOT NULL,
    "subtotal" REAL NOT NULL,
    CONSTRAINT "Carrito_detalle_id_carrito_fkey" FOREIGN KEY ("id_carrito") REFERENCES "Carrito" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Carrito_detalle_id_producto_fkey" FOREIGN KEY ("id_producto") REFERENCES "Productos" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Factura" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "id_carrito" TEXT NOT NULL,
    "id_cliente" TEXT NOT NULL,
    "fecha" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "total" REAL NOT NULL,
    "metodo_pago" TEXT,
    "descuento" REAL NOT NULL DEFAULT 0,
    "tipo_venta" TEXT NOT NULL,
    CONSTRAINT "Factura_id_carrito_fkey" FOREIGN KEY ("id_carrito") REFERENCES "Carrito" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Factura_id_cliente_fkey" FOREIGN KEY ("id_cliente") REFERENCES "Clientes" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Creditos" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "id_cliente" TEXT NOT NULL,
    "id_factura" TEXT NOT NULL,
    "nombre_cliente" TEXT NOT NULL,
    "tipo_interes" TEXT NOT NULL,
    "valor_interes" REAL NOT NULL,
    "monto_total" REAL NOT NULL,
    "debe" REAL NOT NULL,
    "numero_cuotas" INTEGER NOT NULL,
    "fecha_inicio" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "estado" TEXT NOT NULL,
    CONSTRAINT "Creditos_id_cliente_fkey" FOREIGN KEY ("id_cliente") REFERENCES "Clientes" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Creditos_id_factura_fkey" FOREIGN KEY ("id_factura") REFERENCES "Factura" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Pago_interes" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "id_cuota" TEXT NOT NULL,
    "fecha_pago" DATETIME NOT NULL,
    "monto_pagado" REAL NOT NULL,
    "metodo_pago" TEXT NOT NULL,
    CONSTRAINT "Pago_interes_id_cuota_fkey" FOREIGN KEY ("id_cuota") REFERENCES "Cuotas" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Cuotas" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "id_credito" TEXT NOT NULL,
    "numero_cuota" INTEGER NOT NULL,
    "monto_cuota" REAL NOT NULL,
    "fecha_vencimiento" DATETIME NOT NULL,
    "estado" TEXT NOT NULL,
    CONSTRAINT "Cuotas_id_credito_fkey" FOREIGN KEY ("id_credito") REFERENCES "Creditos" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
