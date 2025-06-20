@REQ_BTPMCDP-999 @HU999 @automatizacion_marvel_api @marvel_characters_api @ejecucion_maestra @E2
Feature: BTPMCDP-999 Ejecución maestra de pruebas para la API Marvel Characters

  Scenario: Ejecutar todos los features de consulta de personajes Marvel
    * call read('classpath:features/marvel_characters_api/consultarPersonajes.feature')
    * call read('classpath:features/marvel_characters_api/consultarPersonajePorId.feature')
    * call read('classpath:features/marvel_characters_api/consultarComicsPorPersonaje.feature')
    * call read('classpath:features/marvel_characters_api/consultarEventosPorPersonaje.feature')
    * call read('classpath:features/marvel_characters_api/consultarSeriesPorPersonaje.feature')
    * call read('classpath:features/marvel_characters_api/consultarHistoriasPorPersonaje.feature')
