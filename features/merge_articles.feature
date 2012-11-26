Feature: Merge Articles
  As a blog administrator
  In order to display same blog content in one article
  I want to be able to merge articles in my blog

  Background:
    Given the blog is set up
    And the following articles exist:
    | title        | author | body     |
    | First article | admin | Some text |
    | Second article | admin | More text |
    | Third article | publisher | UserA text |
    
  Scenario: Non-admin cannot merge articles
    Given I am logged into the publisher panel
    And I am on the edit article page for "First article"
    Then I should not see "Merge Articles"

  Scenario: Admin can see merge articles
    Given I am logged into the admin panel
    And I am on the edit article page for "First article"
    Then I should see "Merge Articles"

  Scenario: Article content must be merged
    Given I am logged into the admin panel
    And I am on the edit article page for "First article"
    When I merge article "First article" with article "Third article"
    Then I should see "Some text" 
    And I should see "UserA text"

  Scenario: Merged article should have one of previous authors set as author
    Given I am logged into the admin panel
    And I am on the edit article page for "First article"
    When I merge article "First article" with article "Third article"
    Then as author I should see "admin" or "publisher"

  Scenario: Merged article should have one of previous titles set as title
    Given I am logged into the admin panel
    And I am on the edit article page for "First article"
    When I merge article "First article" with article "Third article"
    Then as title I should see "First article" or "Third article"

  Scenario: Form field for ID should have ID attribute set to merge_with
    Given I am logged into the admin panel
    And I am on the edit article page for "First article"
    Then I should see an form field with ID attribute "merge_with"

  Scenario: After merge comments from both articles must be also merged
    Given I am logged into the admin panel
    And the following comments exist:
    | TODO |
    And I am on the edit article page for "First article"
    When I merge article "First article" with article "Third article"
    Then I should see comments from "First article"
    And I should see comments from "Third article"
