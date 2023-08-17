Feature: Create Account and generate token
 
Background: Setup test and generate.
* def result = callonce read('GenerateToken.feature')
And print result
* def validToken = result.response.token
Given url "https://tek-insurance-api.azurewebsites.net"

Scenario: Create Valid account
Given path "/api/accounts/add-primary-account"
And header Authorization = "Bearer " + validToken

 #creating auto email
 #calling Java class in feature file. this utilty will create object from java class.
* def generateDataObject = Java.type('apiUtility.GenerateData')
* def GeneratedEmail = generateDataObject.getEmail();
And request
"""
{
     
        "email": "#(GeneratedEmail)",
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
    And assert response.email == GeneratedEmail