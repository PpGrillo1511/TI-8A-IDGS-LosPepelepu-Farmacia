## 🧩 Estructura de Campos

| Campo                 | Tipo de Dato                 | Descripción                                                                                              | Naturaleza        | Dominio / Validaciones                                                                 |
|----------------------|------------------------------|----------------------------------------------------------------------------------------------------------|-------------------|----------------------------------------------------------------------------------------|
| `ID`                 | `INT UNSIGNED AUTO_INCREMENT`| Identificador único del registro (lote).                                                                 | Cualitativo/Cuantitativo | UUID simulado (formato hexadecimal). Valor incremental en la base de datos.            |
| `Medicamento_ID`     | `INT UNSIGNED`               | Identificador único del medicamento dentro del lote.                                                     | Cualitativo/Cuantitativo | UUID simulado en formato hexadecimal.                                                  |
| `Personal_Medico_ID` | `INT UNSIGNED`               | Identificador del personal médico responsable del lote.                                                  | Cualitativo/Cuantitativo | UUID simulado en formato hexadecimal.                                                  |
| `Clave`              | `VARCHAR(50)`                | Código de identificación del medicamento en el inventario.                                               | Cualitativo        | De 5 a 50 caracteres alfanuméricos (`a-z`, `A-Z`, `0-9`, `-`).                         |
| `Estatus`            | `ENUM`                       | Estado actual del lote de medicamentos.                                                                  | Cualitativo        | Valores permitidos: `Reservado`, `En transito`, `Recibido`, `Rechazado`.              |
| `Costo_Total`        | `DECIMAL(10,2)`              | Costo total del lote.                                                                                     | Cuantitativo       | Número decimal positivo con dos decimales. Ej: `1234.56`.                             |
| `Cantidad`           | `INT UNSIGNED`               | Cantidad de unidades en el lote.                                                                         | Cuantitativo       | Entero positivo igual o mayor a 0.                                                     |
| `Ubicacion`          | `VARCHAR(100)`               | Lugar físico donde está almacenado el lote.                                                              | Cualitativo        | Entre 5 y 100 caracteres alfanuméricos.                                                |
| `Fecha_Registro`     | `DATETIME`                   | Fecha y hora cuando el lote fue ingresado al sistema.                                                    | Cuantitativo       | Formato `YYYY-MM-DD HH:MM:SS`, generado automáticamente.                              |
| `Fecha_Actualizacion`| `DATETIME`                   | Fecha y hora de la última modificación. Puede ser `NULL` si no ha sido editado.                         | Cuantitativo       | Formato `YYYY-MM-DD HH:MM:SS`.                                                        |

---

## 🔑 Llaves y Reglas

- **Llave primaria (PK):** `ID`
- **Relaciones sugeridas:**
  - `Medicamento_ID` → Tabla de medicamentos
  - `Personal_Medico_ID` → Tabla de personal médico

---