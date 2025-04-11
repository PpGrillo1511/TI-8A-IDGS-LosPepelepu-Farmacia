# 📦 Consultas Avanzadas - Colección `lotes_medicamentos`

Este archivo contiene ejemplos de consultas avanzadas para interactuar con la colección `lotes_medicamentos` en una base de datos MongoDB.

---

## 1. 🔍 Buscar lotes "En transito" con costo mayor a $500 y registrados en los últimos 7 días

```js
db.lotes_medicamentos.find({
  estatus: "En transito",
  costo_total: { $gt: 500 },
  fecha_registro: { $gte: new Date(Date.now() - 7 * 24 * 60 * 60 * 1000) }
})
```

---

## 2. 📦 Agrupar por ubicación y contar lotes en estatus "En transito"

```js
db.lotes_medicamentos.aggregate([
  { $match: { estatus: "En transito" } },
  { $group: { _id: "$ubicacion", total_lotes: { $sum: 1 } } },
  { $sort: { total_lotes: -1 } }
])
```

---

## 3. 📊 Promedio de costo total y cantidad por médico para lotes con estatus "Recibido"

```js
db.lotes_medicamentos.aggregate([
  { $match: { estatus: "Recibido" } },
  {
    $group: {
      _id: "$personal_medico_id",
      promedio_costo: { $avg: "$costo_total" },
      promedio_cantidad: { $avg: "$cantidad" }
    }
  },
  { $sort: { promedio_costo: -1 } }
])
```

---

💡 Estas consultas permiten analizar el movimiento, distribución y eficiencia de la gestión de lotes en el sistema.
