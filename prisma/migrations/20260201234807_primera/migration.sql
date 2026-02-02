-- CreateTable
CREATE TABLE "Clientes" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "cedula" TEXT NOT NULL,
    "nombre" TEXT NOT NULL,
    "telefono" TEXT,
    "email" TEXT,
    "compras" INTEGER NOT NULL DEFAULT 0,
    "total_comprado" REAL NOT NULL DEFAULT 0,
    "creditos" INTEGER NOT NULL DEFAULT 0,
    "ultima_compra" DATETIME,
    "fecha_creacion" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateIndex
CREATE UNIQUE INDEX "Clientes_cedula_key" ON "Clientes"("cedula");
