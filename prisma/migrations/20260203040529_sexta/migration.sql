-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Pago_interes" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "id_cuota" TEXT NOT NULL,
    "fecha_pago" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "monto_pagado" REAL NOT NULL,
    "metodo_pago" TEXT NOT NULL,
    CONSTRAINT "Pago_interes_id_cuota_fkey" FOREIGN KEY ("id_cuota") REFERENCES "Cuotas" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Pago_interes" ("fecha_pago", "id", "id_cuota", "metodo_pago", "monto_pagado") SELECT "fecha_pago", "id", "id_cuota", "metodo_pago", "monto_pagado" FROM "Pago_interes";
DROP TABLE "Pago_interes";
ALTER TABLE "new_Pago_interes" RENAME TO "Pago_interes";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
