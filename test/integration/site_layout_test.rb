require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
 test "layout links" do
   get root_path
   assert_template'static_pages/home'
   assert_select "a[href=?]", root_path, count:2
   assert_select "a[href=?]", help_path
   assert_select "a[href=?]", about_path
   assert_select "a[href=?]", contact_path
   get contact_path
   assert_select "title", ("Contact")
   get signup_path
   assert_select "title", ("Sign up")
   get users_path
   assert_select "a[href=?]", user_path(@user)
   assert_select log_in_as (@user)
   assert_not select log_in_as(@user) 
 end
end
