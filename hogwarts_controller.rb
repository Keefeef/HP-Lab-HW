require('sinatra')
require('sinatra/contrib/all')
require('pry')

require_relative('./models/house')
require_relative('./models/student')
also_reload('./models/*')

House.find(1)
House.all

Student.find(1)
Student.all

binding.pry
nil
