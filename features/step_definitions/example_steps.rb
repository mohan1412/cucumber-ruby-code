
Given(/^I am on the homepage$/) do
  find('h1', text: 'Welcome to MyRapName.com')
end

Then("I see displayed title {string}") do |text|
  expect(page).to have_css('h2', text: text)
end

And("I see input field having name {string}") do |fieldName|
  # find_field(fieldName, type: fieldType)
  expect(page).to have_field(fieldName)
end

Then("I enter {string} into input field having name {string}") do |inputData, fieldName|
  fill_in(fieldName, :with => inputData)
end

Then("I click on button having name {string}") do |button|
  click_button(button)
end

And("I wait for {int} sec") do |time|
  sleep time
end

Then("I should see {string} message") do |errorMsg|
  # find('h1', text: errorMsg)
  expect(page).to have_css('h1', text: errorMsg)
end

Then("I click on checkbox having name {string}") do |checkBox|
  enableCheckBox(checkBox, true)
end

And("I should see new rap name has been prepended to the list with row count {int}") do |expectedRowCount|
  rowCount = getRowCount('/html/body/table/tbody/tr/td/table/tbody/tr/td[1]/div/table')
  expect(rowCount).to eq(expectedRowCount)
end

def enableCheckBox(checkBox, enable)
  if (enable)
    check(checkBox)
    puts "Use Nickname is enabled."
  else
    uncheck(checkBox)
    puts "Use Nickname is disabled."
  end
end

def getRowCount(xpathValue)
  # get the specific table using xpath and then call all on that with 'tr' css field
  table = find(:xpath, xpathValue)
  rowCount = table.all(:css, 'tr').size
  return rowCount
end