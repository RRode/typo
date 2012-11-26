And /the following articles exist/ do |articles_table|
  articles_table.hashes.each do |article|
    Article.create( :id => article[:id], :title => article[:title], :author => article[:author], :body => article[:body]  )
  end
end

When /^I merge article "([^"]*)" with article "([^"]*)"$/ do |title1, title2|
  id = Article.find_by_title(title2).id
  fill_in("merge_with", :with => id)
  step(%{I press "Merge"})
  step(%{I am on the edit article page for "#{title1}"})
end

Then /^as author I should see "([^"]*)" or "([^"]*)"$/ do |author1, author2|
 pending
t= current_url #get article id
debugger
  post = Article.find_by_id(arg1)

  assert post.author.should == author1 || post.author.should == author2
end

Then /^as title I should see "([^"]*)" or "([^"]*)"$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see an form field with ID attribute "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given /^the following comments exist:$/ do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end

Then /^I should see comments from "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

