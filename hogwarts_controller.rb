require('sinatra')
require('sinatra/contrib/all')
require('pry')

require_relative('./models/house')
require_relative('./models/student')
also_reload('./models/*')




get '/hogwarts' do
  @students = Student.all()
  erb(:index)
end


get '/hogwarts/new' do
  erb(:new)
end

post '/hogwarts' do
  @student = Student.new(params)
  @student.save
end
