
### Setup
1. Download and unzip file
2. Make sure your Ruby environment is using `ruby 2.3.3`
3. Be sure to bundle install
4. Run the example feature file:
    - `bundle exec cucumber features/myRapNamePage.feature`

Homepage='http://www.myrapname.com/'

### Tests scenarios covered
1. The input fields exist
2. A negative scenario using the input fields
3. Input data into the fields
4. Submit a name for male with a nickname and validate that a new name has been prepended to the list
5. Submit twice for a female with a last initial and validate that a new name has been prepended to the list
