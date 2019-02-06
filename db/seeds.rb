require_relative('../models/house')
require_relative('../models/student')

student1 = Student.new({
  "first_name" => "Harry",
  "last_name" => "Potter",
  "age" => 20,
  "house_id" => 1
  })

student2 = Student.new({
    "first_name" => "Neville",
    "last_name" => "Longbottom",
    "age" => 20,
    "house_id" => 1
    })

house1 = House.new({
  "name" => "Gryffindor",
  "url" => "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/Gryffindorcolours.svg/200px-Gryffindorcolours.svg.png"
  })

house2 = House.new({
  "name" => "Slytherin",
  "url" => "https://upload.wikimedia.org/wikipedia/commons/thumb/0/07/Slytherin_colours.svg/200px-Slytherin_colours.svg.png"
  })

house1.save
house2.save

student1.save
student2.save
