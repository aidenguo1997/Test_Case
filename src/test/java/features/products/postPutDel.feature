Feature: Testing product API with POST、PUT、DELETE requests

  Background:
    * url "http://localhost:8085/"

  Scenario: post the product、modify price for product and delete the product by id
    Given   path "products"
    And     request {"name":"The Light We Carry: Overcoming in Uncertain Times", "category":"Humanity & Social Science", "language":"English", "publisher":"Crown Publishing Group (NY)", "author":"Michelle Obama", "price": 599}
    When    method Post
    Then    status 201
    And     match response != ""

    * print response
    * def id = response.id
    * print id

    Given   path "products", id
    And     request {"name":"The Light We Carry: Overcoming in Uncertain Times", "category":"Humanity & Social Science", "language":"English", "publisher":"Crown Publishing Group (NY)", "author":"Michelle Obama", "price": 888}
    When    method Put
    Then    status 200
    And     match response.price == 888

    Given   path "products", id
    When    method Delete
    Then    status 200
    And     match response == "Deleted"

    Given   path "products", id
    When    method Get
    Then    status 404
    And     match response.error == "Not Found"
