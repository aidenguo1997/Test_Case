Feature: Testing product API with Get requests

  Background:
    * url "http://http://127.0.0.1:8083/"

  Scenario: get all products
    Given path "products"
    When  method get
    Then  status 200
    * print response

  Scenario: get the first product by id
    Given   path "products"
    When    method get
    Then    status 200

    * def id = response[0].id
    * def bookName = "The Light We Carry: Overcoming in Uncertain Times"

    Given   path "products", id
    When    method get
    Then    status 200
    * print response.name
    And     match response.name == bookName
