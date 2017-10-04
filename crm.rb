require_relative 'contact'
require 'sinatra'

  get '/' do
    erb :index
  end

  get '/contacts' do
    @contacts = Contact.all
    # puts @contacts
    erb :contacts
  end

after do
  ActiveRecord::Base.connection.close
end
