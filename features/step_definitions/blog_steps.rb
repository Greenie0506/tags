Given /^a post tagged with Basketball$/ do
  tag = Tag.create(name: 'Basketball')
  post = Post.create(title: 'Knicks Winning', content: 'Knicks Winning!!')
  post.tags << tag
  post.save

  @basketball = tag
end

Given /^another post tagged with Basketball$/ do
  post = Post.create(title: 'Knicks Linning', content: 'Knicks Linning!!!')
  post.tags << @basketball
  post.save
end

Given /^a post tagged with Soccer and Basketball$/ do
  tag = Tag.create(name: 'Soccer')
  post = Post.create(
    title: 'Arsenal',
    content: 'Some player that plays for Arsenal and the Knicks'
  )
  post.tags << tag
  post.tags << @basketball
  post.save
end

Given /^I visit the homepage$/ do
  visit("/")
end

Given /^I should see all posts$/ do
  page.should have_content("Knicks")
  page.should have_content("Cardinals")
  page.should have_content("Arsenal")
end

Given /^a post tagged with Baseball$/ do
  tag = Tag.create(name: 'baseball')
  post = Post.create(title: 'Cardinals', content: 'Cardinals')
  post.tags << tag
  post.save
end

When /^I click on Basketball$/ do
  click_on("Basketball")
end

When /^I click on Soccer$/ do
  click_on("Soccer")
end

Then /^I should only see the posts tagged with Basketball$/ do
  page.should have_content("Winning")
  page.should have_content("Linning")
  page.should have_content("Arsenal")
  page.should_not have_content("Cardinals")
end

Then /^I should only see the posts tagged with Basketball and Soccer$/ do
  page.should have_content("Arsenal")

  page.should_not have_content("Winning")
  page.should_not have_content("Linning")
  page.should_not have_content("Cardinals")
end
