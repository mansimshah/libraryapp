require 'rails_helper'

RSpec.describe Api::V1::BooksController, type: :controller do

  let(:user) { FactoryGirl.create(:user) }
  let(:book) { FactoryGirl.create(:book) }

  before :each do
    login_as(user, scope: user)
    puts "====user====",user.inspect
    puts "====book====",book.inspect
  end

  it "allows authenticated access to get list of books" do
    # xhr :get, :index
    get :index
    # expect(response).to be_success
    expect(response.status).to eql(200)
  end

  it "get book details" do
    # xhr :get, :index, id: book
    get :index, id: book
    # expect(response).to be_success
    expect(response.status).to eql(200)
  end

  it "create book" do
    # xhr :post, :create, book: FactoryGirl.attributes_for(:book)
    expect {
      post :create, book: FactoryGirl.attributes_for(:book), format: :json
    }.to change(Book, :count).by(1)

    puts "===book====",book.inspect
    expect(response).to be_success
  end

  it "delete book" do
    delete :destroy, id: book.id, format: :json
    expect(response.status).to eql(200)
  end

end