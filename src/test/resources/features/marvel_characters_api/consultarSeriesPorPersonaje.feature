@REQ_BTPMCDP-999 @HU999 @automatizacion_marvel_api @marvel_characters_api @Agente2 @E2 @iniciativa_qa_automatizacion
Feature: BTPMCDP-999 Consultar series por ID de personaje desde la API de Marvel

  Background:
    * def username = 'testuser'
    * def baseUrl = port_marvel_characters_api
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

  @id:10 @consultarSeriesPorPersonaje @solicitudExitosa200
  Scenario: T-API-BTPMCDP-999-CA10 - Consultar series por ID de personaje válido (200 OK)
    * def characterId = '1009368'
    * def fullUrl = baseUrl + '/' + username + '/api/characters/' + characterId + '/series?ts=' + ts + '&apikey=' + publicKey + '&hash=' + hash
    Given url fullUrl
    When method GET
    Then status 200
    And match response.data.results == '#[]' || response.data.results[*].title contains any ['Iron', 'Man']

  @id:11 @consultarSeriesPorPersonajeInexistente @error500
  Scenario: T-API-BTPMCDP-999-CA11 - Consultar series por ID de personaje inexistente (404)
    * def nonExistentCharacterId = '9999999'
    * def fullUrl = baseUrl + '/' + username + '/api/characters/' + nonExistentCharacterId + '/series?ts=' + ts + '&apikey=' + publicKey + '&hash=' + hash
    Given url fullUrl
    When method GET
    Then status 404
