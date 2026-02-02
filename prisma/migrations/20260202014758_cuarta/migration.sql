-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Productos" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nombre" TEXT NOT NULL,
    "genero" TEXT,
    "precio_costo" REAL NOT NULL,
    "precio_venta" REAL NOT NULL,
    "stock_inicial" INTEGER NOT NULL,
    "stock_minimo" INTEGER NOT NULL DEFAULT 5,
    "proveedor" TEXT,
    "descripcion" TEXT
);
INSERT INTO "new_Productos" ("descripcion", "genero", "id", "nombre", "precio_costo", "precio_venta", "proveedor", "stock_inicial", "stock_minimo") SELECT "descripcion", "genero", "id", "nombre", "precio_costo", "precio_venta", "proveedor", "stock_inicial", "stock_minimo" FROM "Productos";
DROP TABLE "Productos";
ALTER TABLE "new_Productos" RENAME TO "Productos";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
