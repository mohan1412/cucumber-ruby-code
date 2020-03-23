Feature: My Rap Name Page
  As a user I should able to generate rap name by entering input fields(first name and last initial)
#  Scenario: An example scenario
#    Given   I am on the homepage
#    Then    I see the text "You don't join us, we join you"

  # setup function
  Background: Visit home page
    Given I am on the homepage

  Scenario: Verify the first name exist
    Then    I see displayed title "First Name:"
    And     I see input field having name "firstname"

  Scenario: Verify the last initial exist
    Then    I see displayed title "Last Initial:"
    And     I see input field having name "lastinitial"

  Scenario: Verify the user nickname exist
    Then    I see displayed title "Use Nickname:"
    And     I see input field having name "shorten"

  Scenario Outline: A negative scenario using the input fields
    Then    I enter <inputData> into input field having name <fieldName>
    Then    I click on button having name <button>
    And     I wait for 2 sec
    Then    I should see "You must enter your first name." message
    Examples:
      | inputData| fieldName  | button   |
      |""        |"firstname" |  "Male"  |
      |"@#%^^&"  |"firstname" |  "Male"  |
      |""        |"firstname" | "Female" |
      |"@#%^^&"  |"firstname" | "Female" |

  Scenario: Submit a name for male with a nickname
    Then    I enter "Mohan" into input field having name "firstname"
    Then    I click on checkbox having name "shorten"
    Then    I click on button having name "Male"
    And     I wait for 2 sec
    Then    I see displayed title "Your rap name is:"
    And     I should see new rap name has been prepended to the list with row count 1

  Scenario: Submit twice for a female with a last initial
    Then    I enter "Corona" into input field having name "firstname"
    Then    I enter "K" into input field having name "lastinitial"
    Then    I click on button having name "Female"
    And     I wait for 2 sec
    Then    I see displayed title "Your rap name is:"
    And     I should see new rap name has been prepended to the list with row count 1
    Then    I enter "Virus" into input field having name "firstname"
    Then    I enter "V" into input field having name "lastinitial"
    Then    I click on button having name "Female"
    And     I should see new rap name has been prepended to the list with row count 2