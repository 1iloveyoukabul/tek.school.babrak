Feature: Updating exisiting car account

Background: setup test
* def id = callonce read('createAccount.feature')
    * def validToken = id.validToken
    * def createdAccountId = id.response.id
    And print id
    Given url "https://tek-insurance-api.azurewebsites.net"
    
Scenario: Updat exisiting Car Info
 
    Given path "/api/accounts/add-account-car"
    And param primaryPersonId = createdAccountId
    And header Authorization = "Bearer " + validToken
    * def dataGenerator = Java.type('apiUtility.GenerateData')
    * def licenseNumber = dataGenerator.getLicense()
    And request
      """
      {
      "id": 0,
      "make": "Acura",
      "model": "MDX",
      "year": "2021",
      "licensePlate": "#(licenseNumber)"
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.make == "Acura"
    And assert response.model == "MDX"
    
    * def CarId = response.id
    And path "/api/accounts/update-account-car"
    And header Authorization = "Bearer " + validToken
     And param primaryPersonId = createdAccountId
    And request
      """
      {
      "id": "#(CarId)",
      "make": "Acura",
      "model": "MDX",
      "year": "2022",
      "licensePlate": "#(licenseNumber)"
      }
      """
    
    When method put
    Then status 202
    And print response
    
    
    
    
    
    