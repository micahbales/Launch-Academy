RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  def login_user
    click_link "Sign In"
    fill_in("Email", with: "bob@thebuilder.com")
    fill_in("Password", with: "password")
    click_button "Log In"
  end

  def login_admin
    click_link "Sign In"
    fill_in("Email", with: "micahbales@gmail.com")
    fill_in("Password", with: "password")
    click_button "Log In"
  end
end
