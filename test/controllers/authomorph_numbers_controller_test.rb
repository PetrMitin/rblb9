require "test_helper"
require "selenium-webdriver"

class AuthomorphNumbersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @@driver = Selenium::WebDriver.for :chrome
    @@driver.navigate.to "http://127.0.0.1/authonumous-numbers/input"
  end

  test "should get input" do
    get authomorph_numbers_input_url
    assert_response :success
  end

  test "should get view" do
    get authomorph_numbers_view_url
    assert_response :success
  end

  test "should render N <= 0 when n is not provided" do
    element = @@driver.find_element(id: 'n-input')
    wait = Selenium::WebDriver::Wait.new(timeout: 30)
    wait.until { element.displayed? }
    @@driver.find_element(id: 'submit-button').click
    wait.until { @@driver.find_element(id: 'results').text }
    puts @@driver.find_element(id: 'results').text
  end
end
