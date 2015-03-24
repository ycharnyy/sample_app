require 'spec_helper'

# def full_title(page_title)
#   base_title = "Ruby on Rails Tutorial Sample App"
#   if page_title.empty?
#     base_title
#   else
#     "#{base_title} | #{page_title}"
#   end
# end

include ApplicationHelper

describe "Static pages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title(full_title('About Us'))
    click_link  "Help"
    expect(page).to have_title(full_title('Help'))
    click_link "Contact"
    expect(page).to have_title(full_title('Contact'))
    click_link "Home"
    click_link "Sign up now!"
    expect(page).to have_title(full_title('Sign up'))
    click_link "sample app"
    expect(page).to have_title(full_title(''))
  end  

  # describe "layout" do

  #   before(:each) do
  #       visit root_path
  #   end

  #   it "should have About link" do
  #       click_link 'About'
  #       expect(page).to have_title(full_title('About Us'))
  #   end

  #   it "should have Help link" do
  #       click_link 'Help'
  #       expect(page).to have_title(full_title('Help'))
  #   end

  #   it "should have Sign Up link" do
  #       click_link "Sign up now!"
  #       expect(page).to have_title(full_title('Sign Up'))
  #   end
  # end

  describe "Home page" do
    before { visit root_path }
    let(:heading)    { 'Sample App' }
    let(:page_title) { '' }
    it_should_behave_like "all static pages"
    it { should_not have_title('| Home') }
  end

  describe "Help page" do
    before { visit help_path }
    let(:heading)    { 'Help' }
    let(:page_title) { '' }
    it_should_behave_like "all static pages"
  end

  describe "About page" do
    before { visit about_path }
    let(:heading)    { 'About' }
    let(:page_title) { '' }
    it_should_behave_like "all static pages"
  end

  describe "Contact page" do
    before { visit contact_path }
    let(:heading)    { 'Contact' }
    let(:page_title) { '' }
    it_should_behave_like "all static pages"
  end
end
