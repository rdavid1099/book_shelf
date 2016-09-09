require 'test_helper'

class AdminBooksTest < ActionDispatch::IntegrationTest
  test 'logged in admin sees books index' do
    admin = User.create(name: "test", username: "test", password: "password", role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit admin_books_path
    assert page.has_content?("Admin Books")
  end

  test 'logged in admin sees all books' do
    admin = User.create(name: "test", username: "test", password: "password", role: 1)
    category = Category.create(genre: "test")
    user1 = User.create(name: "test", username: "bob", password: "dude")
    user1.books.create(title: "test1", price: 1, quantity: 1, category: category)
    user2 = User.create(name: "test", username: "bobo", password: "dude")
    user2.books.create(title: "test2", price: 1, quantity: 1, category: category)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit admin_books_path
    both_books = page.has_content?("test1") && page.has_content?("test2")

    assert both_books
  end

  test 'default user does not see admin books index' do
    user = User.create(name: "test", username: "bob", password: "dude")

    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit admin_books_path
    refute page.has_content?("Admin Books")
    assert page.has_content?("The page you were looking for doesn't exist.")
  end

end
