require 'spec_helper'



feature 'Post a new sale' do
  before :each do
    visit '/sales/new'
  end
  
  scenario 'creating a sale with valid attributes' do
    select 'garage', from: 'Sale type'
    fill_in 'Sale date', with: '01/01/2014'
    fill_in 'Address', with: '123 Easy St'
    fill_in 'City', with: 'Salem'
    select 'OR', from: 'State'
    fill_in 'Zip', with: '97304'
    fill_in 'Description', with: "This is the most ballin sale eva. When I was mad broke, I couldn't picture this."
    submit_form
    expect(page).to have_content('Your sale has been posted')
  end
  
  scenario 'creating a sale with an blank address' do
    fill_in 'Address', with: ''
    submit_form 
    expect(page).to have_content("Address can't be blank")
  end
  
  scenario 'creating a sale with a blank sale date' do
    fill_in 'Sale date', with: ''
    submit_form
    expect(page).to have_content("Sale date can't be blank")
  end
  
  scenario 'creating a sale with a blank city' do
    fill_in 'City', with: ''
    submit_form
    expect(page).to have_content("City can't be blank")
  end
  
  scenario 'creating a sale with a blank state' do
    select '', from: 'State'
    submit_form
    expect(page).to have_content("State can't be blank")
  end

  scenario 'creating a sale with too short description' do
    fill_in 'Description', with: 'Hello'
    click_button 'Post Sale'
    expect(page).to have_content('Description is too short')
  end

  scenario 'creating a sale with an invalid date' do
    fill_in 'Sale date', with: 'invalid date'
    submit_form
    expect(page).to have_content('is not a valid date')
  end

  scenario 'creating a sale with a past date' do
    today = Date.current
    yesterday = Date.yesterday
    fill_in 'Sale date', with: yesterday 
    submit_form
    expect(page).to have_content("must be on or after #{today}")
  end
end

def submit_form
  click_button 'Post Sale'
end
