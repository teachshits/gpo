# IMPORTANT: This file is generated by cucumber-rails - edit at your own peril.
# It is recommended to regenerate this file in the future when you upgrade to a
# newer version of cucumber-rails. Consider adding your own code to a new file
# instead of editing this one. Cucumber will automatically load all features/**/*.rb
# files.


require 'uri'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

# Commonly used webrat steps
# http://github.com/brynary/webrat

def get_pattern(text)
  if text.match(/^\/.*\/$/)
    Regexp.new(text[1..-2])
  elsif text.match(/^".*"$/)
    text[1..-2]
  else
    text
  end
end


Given /^я нахожусь на (.*)$/ do |page_name|
  visit path_to(page_name)
end

Given /^я зайду на (.*)$/ do |page_name|
  visit path_to(page_name)
end

When /^я нажимаю "([^\"]*)"$/ do |button|
  click_button(button)
end

When /^я перехожу по ссылке "([^\"]*)"$/ do |link|
  click_link(link)
end

When /^я перехожу по ссылке "([^\"]*)" в "([^\"]*)"$/ do |link, parent|
  click_link_within(parent, link)
end

When /^я перехожу по(?: связанной)? ссылке "(.*)" рядом с "(.*)"$/ do |link, text|
  click_link_within("li:contains('#{text}')", link)
end

When /^я ввожу в поле "([^\"]*)" значение "([^\"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

# Используйте, чтобы вводить данные из таблицы, например:
#
#   Если я ввожу значения:
#     | Номер счёта       | 5002       |
#     | Дата окончания    | 2009-11-01 |
#     | Примечание        | Nice guy   |
#     | Отослать письмо?  |            |
#
# TODO: Add support for checkbox, select og option
# based on naming conventions.
#
When /^я ввожу значения:$/ do |fields|
  fields.rows_hash.each do |name, value|
    When %{я ввожу в поле "#{name}" значение "#{value}"}
  end
end

When /^я выбираю "([^\"]*)" из списка "([^\"]*)"$/ do |value, field|
  select(value, :from => field)
end

When /^я ставлю гал\w+ "(.*)"$/ do |field|
  check(field)
end

When /^я убираю галочку "(.*)"$/ do |field|
  uncheck(field)
end

When /^я выбираю "([^\"]*)"$/ do |field|
  choose(field)
end

# Adds support for validates_attachment_content_type. Without the mime-type getting
# passed to attach_file() you will get a "Photo file is not one of the allowed file types."
# error message
When /^(?:|I )attach the file "([^\"]*)" to "([^\"]*)"$/ do |path, field|
  type = path.split(".")[1]

  case type
  when "jpg"
    type = "image/jpg"
  when "jpeg"
    type = "image/jpeg"
  when "png"
    type = "image/png"
  when "gif"
    type = "image/gif"
  end

  attach_file(field, path, type)
end

Then /^я вижу "([^"]*)"$/ do |text|
  if defined?(Spec::Rails::Matchers)
    response.should contain(text)
  else
    assert_contain text
  end
end

Then /^я вижу "([^"]+)" в "([^"]*)"$/ do |text, selector|
  within(selector) do |content|
    if defined?(Spec::Rails::Matchers)
      content.should contain(text)
    else
      hc = Webrat::Matchers::HasContent.new(text)
      assert hc.matches?(content), hc.failure_message
    end
  end
end

Then /^я вижу \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)
  if defined?(Spec::Rails::Matchers)
    response.should contain(regexp)
  else
    assert_match(regexp, response_body)
  end
end

Then /^я вижу \/([^\/]*)\/ в "([^\"]*)"$/ do |regexp, selector|
  within(selector) do |content|
    regexp = Regexp.new(regexp)
    if defined?(Spec::Rails::Matchers)
      content.should contain(regexp)
    else
      assert_match(regexp, content)
    end
  end
end

Then /^я не вижу "([^"]*)"$/ do |text|
  if defined?(Spec::Rails::Matchers)
    response.should_not contain(text)
  else
    assert_not_contain(text)
  end
end

Then /^я не вижу "([^\"]*)" в "([^\"]*)"$/ do |text, selector|
  within(selector) do |content|
    if defined?(Spec::Rails::Matchers)
      content.should_not contain(text)
    else
      hc = Webrat::Matchers::HasContent.new(text)
      assert !hc.matches?(content), hc.negative_failure_message
    end
  end
end

Then /^я не вижу \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)
  if defined?(Spec::Rails::Matchers)
    response.should_not contain(regexp)
  else
    assert_not_contain(regexp)
  end
end

Then /^я не вижу \/([^\/]*)\/ в "([^\"]*)"$/ do |regexp, selector|
  within(selector) do |content|
    regexp = Regexp.new(regexp)
    if defined?(Spec::Rails::Matchers)
      content.should_not contain(regexp)
    else
      assert_no_match(regexp, content)
    end
  end
end

Then /^в списке "([^\"]*)"(?:, находящемся в "(.*?)",)? выбрано значение "([^\"]*)"$/ do |field, selector, value|
  selected = false
  selector ||= "*"
  within(selector) do |current_scope|
    field_labeled(field, Webrat::SelectField).element.children.each do |option|
      selected = true if option.to_s.match("selected.*#{value}")
    end
  end
  assert selected, "Значение #{value} не выбрано в списке #{field}"
end

Then /^выбран радиобатон "(.*)"$/ do |name_or_label|
  field_labeled(name_or_label).should be_checked
end

Then /^поле "([^\"]*)" содержит "([^\"]*)"$/ do |field, value|
  if defined?(Spec::Rails::Matchers)
    field_labeled(field).value.should =~ /#{value}/
  else
    assert_match(/#{value}/, field_labeled(field).value)
  end
end

Then /^поле "([^\"]*)" не содержит "([^\"]*)"$/ do |field, value|
  if defined?(Spec::Rails::Matchers)
    field_labeled(field).value.should_not =~ /#{value}/
  else
    assert_no_match(/#{value}/, field_labeled(field).value)
  end
end

Then /^the "([^\"]*)" checkbox should be checked$/ do |label|
  if defined?(Spec::Rails::Matchers)
    field_labeled(label).should be_checked
  else
    assert field_labeled(label).checked?
  end
end

Then /^the "([^\"]*)" checkbox should not be checked$/ do |label|
  if defined?(Spec::Rails::Matchers)
    field_labeled(label).should_not be_checked
  else
    assert !field_labeled(label).checked?
  end
end

Then /^я должен быть на (.+)$/ do |page_name|
  current_path = URI.parse(current_url).select(:path, :query).compact.join('?')
  if defined?(Spec::Rails::Matchers)
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end

Then /^покажи хтмл$/ do
  save_and_open_page
end

Then /^нет селектора "([^\"]*)"$/ do |selector|
  assert_have_no_selector(selector)
end
