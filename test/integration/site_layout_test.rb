require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    # if root_path renders homepage
    assert_template 'static_pages/home'

    assert_select "header a[href=?]", root_path, count: 2
    assert_select "header a[href=?]", help_path
    assert_select "footer a[href=?]", about_path
    assert_select "footer a[href=?]", contact_path

    get contact_path
    assert_select "title", full_title("Contact")

    get signup_path
    assert_select "title", full_title("Sign up")
  end
  # test "the truth" do
  #   assert true
  # end
end
