@REQ_BTPMCDP-999 @HU999 @automatizacion_marvel_api @marvel_characters_api @Agente2 @E2 @iniciativa_qa_automatizacion
Feature: BTPMCDP-999 Consultar todos los personajes de Marvel

  Background:
    * url 'http://bp-se-test-cabcd9b246a5.herokuapp.com'
    * path 'testuser', 'api', 'characters'
    * header Accept = 'application/json'

  @id:01 @consultarTodosLosPersonajes @solicitudExitosa200
  Scenario: T-API-BTPMCDP-999-CA01 - Consultar todos los personajes (200 OK)
    When method GET
    Then status 200
