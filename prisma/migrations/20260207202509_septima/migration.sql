-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Factura" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "id_carrito" TEXT NOT NULL,
    "id_cliente" TEXT NOT NULL,
    "fecha" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "total" REAL NOT NULL,
    "metodo_pago" TEXT,
    "descuento" REAL NOT NULL DEFAULT 0,
    "tipo_venta" TEXT NOT NULL,
    CONSTRAINT "Factura_id_cliente_fkey" FOREIGN KEY ("id_cliente") REFERENCES "Clientes" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Factura" ("descuento", "fecha", "id", "id_carrito", "id_cliente", "metodo_pago", "tipo_venta", "total") SELECT "descuento", "fecha", "id", "id_carrito", "id_cliente", "metodo_pago", "tipo_venta", "total" FROM "Factura";
DROP TABLE "Factura";
ALTER TABLE "new_Factura" RENAME TO "Factura";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
