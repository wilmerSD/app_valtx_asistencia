String getMonthName(int month) {
  // Lista de nombres de meses en español
  final monthNames = [
    'Enero',
    'Febrero',
    'Marzo',
    'Abril',
    'Mayo',
    'Junio',
    'Julio',
    'Agosto',
    'Setiembre',
    'Octubre',
    'Noviembre',
    'Diciembre'
  ];
  return monthNames[month - 1]; // Restamos 1 porque los índices comienzan en 0
}