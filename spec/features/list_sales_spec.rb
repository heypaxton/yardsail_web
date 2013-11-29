require 'spec_helper'

feature 'List sales' do
  scenario 'show sales on homepage' do
    @sale = 10.times { FactoryGirl.create(:sale) }
    visit root_path
    page.should have_content '123 Easy St' 
  end
end
