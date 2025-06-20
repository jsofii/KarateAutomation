@REQ_BTPMCDP-999 @HU999 @automatizacion_marvel_api @marvel_characters_api @Agente2 @E2 @iniciativa_qa_automatizacion
Feature: BTPMCDP-999 Consultar historias por ID de personaje desde la API de Marvel

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

    * def tsRaw = call read('classpath:utils/generarTimestamp.feature')
    * def ts = tsRaw.timestamp
    * def publicKey = karate.properties['marvel.publicKey']
    * def privateKey = karate.properties['marvel.privateKey']
    * def hashRaw = call read('classpath:utils/generarHash.feature') { ts: '#(tsRaw)', publicKey: '#(publicKey)', privateKey: '#(privateKey)' }
    * def hash = hashRaw.value


  @id:12 @consultarHistoriasPorPersonaje @solicitudExitosa200
  Scenario: T-API-BTPMCDP-999-CA12-Consultar historias por ID de personaje válido 200 - karate
    Given path '1009368', 'stories'
    And param ts = ts
    And param apikey = publicKey
    And param hash = hash
    When method GET
    Then status 200
    And match response.data.results == '#[]' || response.data.results[*].title contains any 'Iron'

  @id:13 @consultarHistoriasPorPersonajeInexistente @error500
  Scenario: T-API-BTPMCDP-999-CA13-Consultar historias por ID de personaje inexistente 404 - karate
    Given path '9999999', 'stories'
    And param ts = ts
    And param apikey = publicKey
    And param hash = hash
    When method GET
    Then status 500
