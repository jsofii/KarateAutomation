@REQ_BTPMCDP-999 @HU999 @automatizacion_marvel_api @create_character @E2
Feature: Crear personaje

  Background:
    * url 'http://bp-se-test-cabcd9b246a5.herokuapp.com'
    * def username = 'testuser'
    * path username, 'api', 'characters'
    * header Content-Type = 'application/json'

  @id:4 @crearExitoso
  Scenario: Crear personaje (exitoso)
    Given request
    """
    {
      "name": "Iron Man45bbbbbb66777",
      "alterego": "Tony Stark",
      "description": "Genius billionaire",
      "powers": ["Armor", "Flight"]
    }
    """
    When method POST
    Then status 201
  @id:5 @nombreDuplicado
  Scenario: Crear personaje (nombre duplicado)
    Given request
    """
    {
      "name": "Iron Man",
      "alterego": "Otro",
      "description": "Otro",
      "powers": ["Armor"]
    }
    """
    When method POST
    Then status 400
    And match response.error == 'Character name already exists'

  @id:6 @camposFaltantes
  Scenario: Crear personaje (faltan campos requeridos)
    Given request
    """
    {
      "name": "",
      "alterego": "",
      "description": "",
      "powers": []
    }
    """
    When method POST
    Then status 400
    And match response.name == 'Name is required'

