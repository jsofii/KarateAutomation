Feature: Generar timestamp

  Scenario: Obtener timestamp actual
    * def timestamp = java.lang.System.currentTimeMillis()
    * print 'Timestamp generado:', timestamp
