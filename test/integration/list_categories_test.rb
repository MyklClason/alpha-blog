require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: "books")
    @category2 = Category.create(name: "progrmaming")
  end


    test "should show categories listing" do
      get categories_path
      assert_template 'categories/index'

      assert_select "a[href=?]", category_path(@category), text: @category.name
      assert_select "a[href=?]", category_path(@category2), text: @category2.name


      assert_difference 'Category.count', 1 do
        post_via_redirect categories_path, category: {name: "sports"}
      end
      assert_template 'categories/index'
      assert_match "sports", response.body
    end

end