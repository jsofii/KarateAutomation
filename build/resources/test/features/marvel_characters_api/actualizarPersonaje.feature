@REQ_BTPMCDP-999 @HU999 @automatizacion_marvel_api @update_character @E2
Feature: Actualizar personaje

  Background:
    * url 'http://bp-se-test-cabcd9b246a5.herokuapp.com'
    * def username = 'testuser'
    * path username, 'api', 'characters'
    * header Content-Type = 'application/json'

  @id:7 @actualizarExitoso
  Scenario: Actualizar personaje (exitoso)
    Given path '118'
    And request
    """
    {
      "name": "Iron Man",
      "alterego": "Tony Stark",
      "description": "Updated description",
      "powers": ["Armor", "Flight"]
    }
    """
    When method PUT
    Then status 200

  @id:8 @actualizarNoExiste
  Scenario: Actualizar personaje (no existe)
    Given path '999'
    And request
    """
    {
      "name": "Iron Man",
      "alterego": "Tony Stark",
      "description": "Updated description",
      "powers": ["Armor", "Flight"]
    }
    """
    When method PUT
    Then status 404
    And match response.error == 'Character not found'
