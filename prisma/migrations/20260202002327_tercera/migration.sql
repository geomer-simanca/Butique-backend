/*
  Warnings:

  - You are about to drop the column `nombre_cliente` on the `Creditos` table. All the data in the column will be lost.
  - You are about to drop the column `proveetor` on the `Productos` table. All the data in the column will be lost.
  - Added the required column `proveedor` to the `Productos` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Creditos" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "id_cliente" TEXT NOT NULL,
    "id_factura" TEXT NOT NULL,
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
INSERT INTO "new_Creditos" ("debe", "estado", "fecha_inicio", "id", "id_cliente", "id_factura", "monto_total", "numero_cuotas", "tipo_interes", "valor_interes") SELECT "debe", "estado", "fecha_inicio", "id", "id_cliente", "id_factura", "monto_total", "numero_cuotas", "tipo_interes", "valor_interes" FROM "Creditos";
DROP TABLE "Creditos";
ALTER TABLE "new_Creditos" RENAME TO "Creditos";
CREATE TABLE "new_Productos" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nombre" TEXT NOT NULL,
    "genero" TEXT,
    "precio_costo" REAL NOT NULL,
    "precio_venta" REAL NOT NULL,
    "stock_inicial" INTEGER NOT NULL,
    "stock_minimo" INTEGER NOT NULL DEFAULT 5,
    "proveedor" TEXT NOT NULL,
    "descripcion" TEXT
);
INSERT INTO "new_Productos" ("descripcion", "genero", "id", "nombre", "precio_costo", "precio_venta", "stock_inicial", "stock_minimo") SELECT "descripcion", "genero", "id", "nombre", "precio_costo", "precio_venta", "stock_inicial", "stock_minimo" FROM "Productos";
DROP TABLE "Productos";
ALTER TABLE "new_Productos" RENAME TO "Productos";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
