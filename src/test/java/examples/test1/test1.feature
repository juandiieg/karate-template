#Author: Juan Gomez
Feature: Validation new test

  Background:
    * def schemaGetUsers = read('classpath:resources/schemas/getUsers.json')
    * def requestCreateUser = read('classpath:resources/request/requestCreateUser.json')
    * def jsonHeaders = read('classpath:resources/headers/createUserHeader.json')
    * configure headers = jsonHeaders

  Scenario: Get the information
    Given url apiReqres
    When method get
    Then status 200
    And print response
    And match response == schemaGetUsers
    * def arraySchema =
    """
    {
      "id": #number,
      "email": #string,
      "first_name": #string,
      "last_name": #string,
      "avatar": #string
    }
    """
    And match response.data[0] == arraySchema

    Scenario Outline: Create an user
      Given url 'https://reqres.in/api/users'
      And request requestCreateUser
      When method Post
      Then status 201
      Examples:
        | name | job |
        | Juan | Seller|
        | Andrea | Cleaner |

