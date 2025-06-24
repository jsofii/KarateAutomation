@REQ_BTPMCDP-999 @HU999 @automatizacion_marvel_api @get_character_by_id @E2
Feature: Obtener personaje por ID

  Background:
    * url 'http://bp-se-test-cabcd9b246a5.herokuapp.com'
    * def username = 'jsguerre'
    * path username, 'api', 'characters'

  @id:2 @personajeExiste
  Scenario: Obtener personaje por ID (exitoso)
    Given path '118'
    When method GET
    Then status 200
    And match response.name == 'Iron Man'

  @id:3 @personajeNoExiste
  Scenario: Obtener personaje por ID (no existe)
    Given path '999'
    When method GET
    Then status 404
    And match response.error == 'Character not found'
