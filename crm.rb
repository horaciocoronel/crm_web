require_relative 'contact'
require 'sinatra'

  get '/' do
    erb :index
  end

  get '/contacts' do
    @contacts = Contact.all
    @count = Contact.all.count
    # puts @contacts
    erb :contacts
  end

  get '/contacts/:id' do
  # params[:id] contains the id from the URL
  @contact = Contact.find_by({id: params[:id].to_i})
    if @contact
      erb :show_contact
    else
      raise Sinatra::NotFound
    end
  end

  not_found do
  "'Sinatra doesn't know this ditty...'"
  end

after do
  ActiveRecord::Base.connection.close
end
