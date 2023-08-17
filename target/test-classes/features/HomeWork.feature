Feature: Create an account with all requirements

  Background: Setup test envoirment
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def generatedToken = callonce read('GenerateToken.feature')
    And print generatedToken
    * def CallexistingToken = generatedToken.response.token
    And print generatedToken
    

  Scenario: Create an Account
  Given path "/api/accounts/add-primary-account"
  And header Authorization = "Bearer " + CallexistingToken
  * def existData = Jave.type('apiUtility.GenerateData')
  * def callexistData = existData.getEmail()
  And request
  
  """
  """
{
     
        "email": "#(callexistData)",
        "title": "Mr.",
        "firstName": "John",
        "lastName": "Alex",
        "gender": "MALE",
        "maritalStatus": "MARRIED",
        "employmentStatus": "Tester",
        "dateOfBirth": 618105600000,
        
    }
"""
    When method post
    Then status 201
    And print response
    And assert response.email == callexistData
  """
