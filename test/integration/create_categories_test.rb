require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
    
def setup

@user = User.create(username: "v152kuma", email: "vivek.kumar450028@gmail.com", password: "boot@123", admin: true)

end


test "get new category form and create category" do

sign_in_as(@user, "boot@123")

get new_category_path

assert_template 'categories/new'

assert_difference 'Category.count', 1 do

post_via_redirect categories_path, category: {name: "Bio-Chemistry"}

end

assert_template 'categories/index'

assert_match "Bio-Chemistry", response.body

end

test "invalid category submission results in failure" do

sign_in_as(@user, "boot@123")

get new_category_path

assert_template 'categories/new'

assert_no_difference 'Category.count' do

post categories_path, category: {name: " "}

end

assert_template 'categories/new'

assert_select 'h2.panel-title'

assert_select 'div.panel-body'

end
        
end
