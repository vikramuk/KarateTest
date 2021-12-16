Feature: Login using the Authentication Endpoint

Scenario: Login
  	print SURGEON
  	print PASSWORD
    Given header Content-Type = 'application/json'
    Given header api-version = '1'
    Given url AUTH_URL
	And request {	grant_type: "password",	username: '#(SURGEON)', password: '#(PASSWORD)' }
    When method POST
    Then status 200
