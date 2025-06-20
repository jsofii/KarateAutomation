@REQ_BTPMCDP-999 @HU999 @automatizacion_marvel_api @marvel_characters_api @Agente2 @E2 @iniciativa_qa_automatizacion
Feature: BTPMCDP-999 Consultar personaje por ID desde la API de Marvel

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

    # Reutilización de lógica para autenticación Marvel
    * def ts = call read('classpath:utils/generarTimestamp.feature')
    * def publicKey = karate.properties['marvel.publicKey']
    * def privateKey = karate.properties['marvel.privateKey']
    * def hash = call read('classpath:utils/generarHash.feature') { ts: '#(ts)', publicKey: '#(publicKey)', privateKey: '#(privateKey)' }

  @id:4 @consultarPersonajePorId @solicitudExitosa200
  Scenario: T-API-BTPMCDP-999-CA04-Consultar personaje por ID válido 200 - karate
    Given path '1009368'
    And param ts = ts
    And param apikey = publicKey
    And param hash = hash
    When method GET
    Then status 200
    And match response.data.results[0].name == 'Iron Man'

  @id:5 @consultarPersonajePorIdInexistente @error404
  Scenario: T-API-BTPMCDP-999-CA05-Consultar personaje con ID inexistente 404 - karate
    Given path '9999999'
    And param ts = ts
    And param apikey = publicKey
    And param hash = hash
    When method GET
    Then status 404
