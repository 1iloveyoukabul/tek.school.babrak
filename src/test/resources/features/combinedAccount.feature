    
    Feature: updating an account

  Background: Test setup and Create New Account.
    * def createAccount = callonce read('CreateAccount.feature')
    * def validToken = createAccount.validToken
    * def createdAccountId = createAccount.response.id
    And print createAccount
    Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: Adding Phone number to an Account
    Given path "/api/accounts/add-account-phone"
    And param primaryPersonId = createdAccountId
    And header Authorization = "Bearer " + validToken
    * def dataGenerator = Java.type('apiUtility.GenerateData')
    * def phoneNumber = dataGenerator.getPhnoneNumber()
    And request
      """
      {
      
        "phoneNumber": "#(phoneNumber)",
        "phoneExtension": "502",
        "phoneTime": "Evening",
        "phoneType": "Mobile"
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.phoneNumber == phoneNumber

  Scenario: Adding a vehicle to the account
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
    
    

  Scenario: adding address to the account
    Given path "/api/accounts/add-account-address"
    And param primaryPersonId = createdAccountId
    And header Authorization = "Bearer " + validToken
    And request
      """
      {
      
      "id": 0,
      "addressType": "Home",
      "addressLine1": "Park",
      "city": "Richmond",
      "state": "Virginia",
      "postalCode": "302",
      "countryCode": "1010",
      "current": true
      }
      """
    When method post
    Then status 201
    And print response
    

  Scenario: Delete Accont.
    Given path "/api/accounts/delete-account"
    And param primaryPersonId = createdAccountId
    And header Authorization = "Bearer " + validToken
    When method delete
    Then status 200
    And assert response == "Account Successfully deleted"
    
    
    
    
    
    
    
    
    
    
    #Given path "/api/accounts/delete-account"
    #And param primaryPersonId = createdAccountId
    #And header Authorization = "Bearer " + validToken
    #When method delete
    #Then status 404
    #And print response
    #And assert response.errorMessage == "Account with id " + createdAccountId + " not exist"
    
 
