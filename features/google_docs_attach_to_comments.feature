Feature:  Linking to or uploading and linking to a google document 

Background:
   Given a project exists with name: "Ruby Rockstars"
   And a confirmed user exists with login: "mislav", first_name: "Mislav", last_name: "Marohnić"
   And I am logged in as "mislav"
   And I am in the project called "Ruby Rockstars"
   And I am in the task "Feeding Penguins"
   
Scenario: Mislav  attaches a G! doc to a comment successfully
   When I open "Attach G! doc"
   And I am logged in and have linked my G! account
   I am presented with a list of G! docs owned by the teambox G! account for this project
   And I select a document
   And I press "Link to Task"
   Then I am asked if I would like to see more options ( update teambox task when the G! doc is updated, add G! comments into the teambox task comment stream )
   Then I press "Done"

  