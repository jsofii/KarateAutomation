@REQ_BTPMCDP-999 @HU999 @automatizacion_marvel_api @delete_character @E2
Feature: Eliminar personaje

  Background:
    * url 'http://bp-se-test-cabcd9b246a5.herokuapp.com'
    * def username = 'testuser'
    * path username, 'api', 'characters'

  @id:9 @eliminarExitoso
  Scenario: Eliminar personaje (exitoso)
    Given path '118''
    When method DELETE
    Then status 204

  @id:10 @eliminarNoExiste
  Scenario: Eliminar personaje (no existe)
    Given path '999'
    When method DELETE
    Then status 404
    And match response.error == 'Character not found'
