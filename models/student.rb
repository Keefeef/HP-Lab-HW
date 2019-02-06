require_relative('../db/sql_runner')
require('pry')



class Student

attr_reader :id, :first_name, :last_name, :age, :house_id

  def initialize(options)
    @id = options["id"].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @age = options['age'].to_i
    @house_id = options['house_id'].to_i
  end

  def pretty_name
    return "#{@first_name} #{@last_name}"
  end

  def student_house
    sql = "SELECT FROM students WHERE house_id = $1"
    values = [@house_id]
    houses = SqlRunner.run(sql, values)
    result = houses.map{ |house| House.new(house)}
  end


  def house_name
    if @house_id == 1
      return "Gryffindor"
    else @house_id == 2
      return "Slytherin"
    end
  end
end

  def save()
    sql = "INSERT INTO students
    (
      first_name,
      last_name,
      age,
      house_id
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING *"
    values = [@first_name, @last_name, @age, @house_id]
    student = SqlRunner.run(sql, values)
    @id = student.first()['id'].to_i
  end

  def self.all()
  sql = "SELECT * FROM students"
  students = SqlRunner.run( sql )
  result = students.map { |student| Student.new( student) }
  return result
end


def self.find( id )
  sql = "SELECT * FROM students WHERE id = $1"
  values = [id]
  student = SqlRunner.run( sql, values )
  result = Student.new( student.first )
  return result
end
