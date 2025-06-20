@REQ_BTPMCDP-999 @HU999 @automatizacion_marvel_api @marvel_characters_api @Agente2 @E2 @iniciativa_qa_automatizacion
Feature: BTPMCDP-999 Consultar eventos por ID de personaje desde la API de Marvel

  Background:
    * def username = 'testuser'
    * url port_marvel_characters_api
    * path username, 'api', 'characters'
    * def generarHeaders =
    """
    function() {
      return {
        "Accept": "application/json"
      };
    }
    """
    * def headers = generarHeaders()
    * headers headers

    * def ts = call read('classpath:utils/generarTimestamp.feature')
    * def publicKey = karate.properties['marvel.publicKey']
    * def privateKey = karate.properties['marvel.privateKey']
    * def hash = call read('classpath:utils/generarHash.feature') { ts: '#(ts)', publicKey: '#(publicKey)', privateKey: '#(privateKey)' }


  @id:9 @consultarEventosPorPersonajeInexistente @error500
  Scenario: T-API-BTPMCDP-999-CA09-Consultar eventos por ID de personaje inexistente 404 - karate
    Given path '9999999', 'events'
    And param ts = ts
    And param apikey = publicKey
    And param hash = hash
    When method GET
    Then status 500
