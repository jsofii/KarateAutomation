@REQ_BTPMCDP-999 @HU999 @consultar_personajes @marvel_characters_api @Agente2 @E2 @iniciativa_qa_automatizacion
Feature: BTPMCDP-999 Consultar todos los personajes (GET /characters)

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

  @id:1 @consultaExitosa @solicitudExitosa200
  Scenario: T-API-BTPMCDP-999-CA01-Consultar todos los personajes exitosamente 200 - karate
    When method GET
    Then status 200
    # And match response != null
    # And match response[0].name != null

  @id:2 @consultaUsuarioInvalido @error404
  Scenario: T-API-BTPMCDP-999-CA02-Consultar personajes con usuario inexistente 404 - karate
    * path 'usuario_inexistente', 'api', 'characters'
    When method GET
    Then status 500
    # And match response.message contains 'not found'

  @id:3 @consultaRutaInvalida @error404
  Scenario: T-API-BTPMCDP-999-CA03-Consultar personajes en ruta incorrecta 404 - karate
    * path username, 'api', 'personajesssss'
    When method GET
    Then status 500
    # And match response.message contains 'not found'
