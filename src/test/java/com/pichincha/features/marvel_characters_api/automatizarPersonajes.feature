@REQ_BTPMCDP-999 @HU999 @automatizacion_marvel_api @marvel_characters_api @Agente2 @E2 @iniciativa_qa_automatizacion
Feature: BTPMCDP-999 Automatización de API Marvel Characters

  Background:
    * def username = 'testuser'
    * url port_marvel_characters_api
    * path username, 'api', 'characters'
    * def generarHeaders =
    """
    function() {
      return {
        "Content-Type": "application/json"
      };
    }
    """
    * def headers = generarHeaders()
    * headers headers

  @id:1 @crearPersonajeValido @solicitudExitosa200
  Scenario: T-API-BTPMCDP-999-CA01-Crear personaje válido 200 - karate
    * def jsonData = read('classpath:data/marvel_characters_api/request_crear_personaje_valido.json')
    And request jsonData
    When method POST
    Then status 200
    # And match response.id != null
    # And match response.name == "Spider-Man"

  @id:2 @crearPersonajeDuplicado @errorValidacion400
  Scenario: T-API-BTPMCDP-999-CA02-Crear personaje duplicado 400 - karate
    * def jsonData = read('classpath:data/marvel_characters_api/request_crear_personaje_duplicado.json')
    And request jsonData
    When method POST
    Then status 400
    # And match response.message contains 'duplicado'

  @id:3 @crearPersonajeInvalido @errorValidacion400
  Scenario: T-API-BTPMCDP-999-CA03-Crear personaje inválido 400 - karate
    * def jsonData = read('classpath:data/marvel_characters_api/request_crear_personaje_invalido.json')
    And request jsonData
    When method POST
    Then status 400
    # And match response.message contains 'datos inválidos'
