@REQ_BTPMCDP-999 @HU999 @automatizacion_marvel_api @marvel_characters_api @Agente2 @E2 @iniciativa_qa_automatizacion
Feature: BTPMCDP-999 Consultar cómics por ID de personaje desde la API de Marvel

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

    * def tsObject = call read('classpath:utils/generarTimestamp.feature')
    * def ts = tsObject.timestamp
    * def publicKey = karate.properties['marvel.publicKey']
    * def privateKey = karate.properties['marvel.privateKey']
    * def hashResponse = call read('classpath:utils/generarHash.feature') { ts: '#(ts)', publicKey: '#(publicKey)', privateKey: '#(privateKey)' }
    * def hash = hashResponse.hash

  @id:6 @consultarComicsPorPersonaje @solicitudExitosa200
  Scenario: T-API-BTPMCDP-999-CA06-Consultar cómics por ID de personaje válido 200 - karate
    # 1009368 = Iron Man
    Given path '1009368', 'comics'
    And param ts = ts
    And param apikey = publicKey
    And param hash = hash
    When method GET
    Then status 500
    * print response
    And match response.data.results[*].title contains 'Iron Man'

  @id:7 @consultarComicsPorPersonajeInexistente @error404
  Scenario: T-API-BTPMCDP-999-CA07-Consultar cómics por ID de personaje inexistente 404 - karate
    Given path '9999999', 'comics'
    And param ts = ts
    And param apikey = publicKey
    And param hash = hash
    When method GET
    Then status 500
    And match response.error == 'Internal server error'
