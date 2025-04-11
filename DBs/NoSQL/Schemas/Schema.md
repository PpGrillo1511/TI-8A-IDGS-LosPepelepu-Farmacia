
# 📦 Esquema de la Colección NoSQL - Medicamentos en Tránsito

Este documento describe el esquema de validación para los documentos almacenados en la colección NoSQL relacionada con el seguimiento de medicamentos en tránsito.

## 📄 Estructura del Documento

| Campo                | Tipo de Dato     | Descripción                                                                 |
|---------------------|------------------|-----------------------------------------------------------------------------|
| `_id`               | `int32`          | Identificador único del documento.                                         |
| `cantidad`          | `int32`          | Cantidad de unidades del medicamento.                                      |
| `clave`             | `string`         | Clave identificadora del medicamento.                                      |
| `costo_total`       | `double`         | Costo total de los medicamentos.                                           |
| `estatus`           | `string`         | Estado actual del traslado o solicitud (ej. "En tránsito").                |
| `fecha_actualizacion` | `null` o `date` | Fecha de la última actualización del documento (puede ser nula).          |
| `fecha_registro`    | `date`           | Fecha y hora en que se registró el documento.                              |
| `medicamento_id`    | `int32`          | ID del medicamento relacionado.                                            |
| `personal_medico_id`| `int32`          | ID del personal médico que realizó el movimiento.                          |
| `ubicacion`         | `string`         | Ubicación actual del medicamento.                                          |

## 🧪 Ejemplo de Schema (MongoDB)

```json
{
  "bsonType": "object",
  "required": [
    "_id",
    "cantidad",
    "clave",
    "costo_total",
    "estatus",
    "fecha_registro",
    "medicamento_id",
    "personal_medico_id",
    "ubicacion"
  ],
  "properties": {
    "_id": {
      "bsonType": "int",
      "description": "Identificador único del documento"
    },
    "cantidad": {
      "bsonType": "int",
      "description": "Cantidad de unidades del medicamento"
    },
    "clave": {
      "bsonType": "string",
      "description": "Clave identificadora del medicamento"
    },
    "costo_total": {
      "bsonType": "double",
      "description": "Costo total de los medicamentos"
    },
    "estatus": {
      "bsonType": "string",
      "description": "Estado actual del traslado o solicitud"
    },
    "fecha_actualizacion": {
      "bsonType": ["null", "date"],
      "description": "Fecha de la última actualización"
    },
    "fecha_registro": {
      "bsonType": "date",
      "description": "Fecha de creación del documento"
    },
    "medicamento_id": {
      "bsonType": "int",
      "description": "ID del medicamento relacionado"
    },
    "personal_medico_id": {
      "bsonType": "int",
      "description": "ID del personal médico que realizó el movimiento"
    },
    "ubicacion": {
      "bsonType": "string",
      "description": "Ubicación del medicamento"
    }
  }
}
```

## 📌 Notas

- El campo `fecha_actualizacion` puede no estar presente al momento de la creación del documento.
- Este esquema puede ser utilizado con validadores JSON Schema en MongoDB para asegurar la integridad de los datos.
