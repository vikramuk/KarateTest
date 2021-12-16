Feature: Match the CPE calculated Response for Various Lens Type/Formula Selection 
#cd C:\Users\vikram.uk old\Documents\Data\Alcon\AlconProject\Tests\Sprint81\Formal\Hotfix1\Karate\src\test\java\11BoxFormula
#C:\Progapps\apache-maven-3.6.3\bin\mvn test -Dkarate.options="classpath:11BoxFormula/Test_CalculateFormula.feature"
Background:
* url 'https://vandv-planningenginec.smartsuite-cataract.com/api/planningenginec/calculateelevenbox'
* def data = read('classpath:11BoxFormula/Json/SendRequest.json')
* def expectedOutput = read('classpath:11BoxFormula/Json/Sample.json')

#  // .modelEntries.SV25Tx[]?|select(.recommendedFlag =="True")
# // https://jqplay.org/s/UCg_y_y7Go
# //  $.modelEntries.SV25Tx[?(@.recommendedFlag =="True")]
# // https://stackoverflow.com/questions/54012378/karate-json-response-parsing
# //https://stackoverflow.com/questions/57063957/expression-with-string-placeholder-in-the-filter-part-of-jsonpath-using-karate/57065176#57065176
Scenario: Get the 11 Box calculation response from CPE
* def result = call read('classpath:11BoxFormula/Login_Surgeon.feature')
* def Truth = 'True'
    Given header Accept = 'application/json, text/plain, */*'
    And  header Content-Type = 'application/json'
    And header api-version = '1'
    Given header Authorization = 'Bearer ' + result.response.access_token
	#Given url https://vandv-planningenginec.smartsuite-cataract.com/api/planningenginec/calculateelevenbox
	And request data
    When method POST
    And print response
* def lensRecommended = karate.jsonPath(response,"$.modelEntries.SV25Tx[?(@.recommendedFlag=='" + Truth + "')]")
	And print lensRecommended
*   match lensRecommended[0].predictedSeq == "0.124397277832031"
*   match lensRecommended[0].toricity == "T4"
	#Then match $ == expectedOutput 
	#Then assert response == expectedOutput
	#And assert response.arr != null
	#And assert response.arr == null
	#And match response.modelEntries.length == '#[17]'
	#And assert response.modelEntries.length == 17
	And status 200
	
