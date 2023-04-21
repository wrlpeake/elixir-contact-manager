defmodule User do
  defstruct [:name, :age]
end

defmodule ContactManager do
  def addUser(list, name, age) do
    user = %User{name: name, age: age}
    List.insert_at(list, -1, user)
  end

  def removeUser(list, name) do
    Enum.filter(list, fn x -> x.name != name end)
  end

  def incrementAge(list, name) do
    index = Enum.find_index(list, fn x -> x.name === name end)
    user = Enum.at(list, index)
    List.replace_at(list, index, %User{name: user.name, age: user.age + 1})
  end

  def incrementAllAges(list) do
    Enum.map(list, fn x -> %User{name: x.name, age: x.age + 1} end)
  end

  def sortUsersByName(list, direction) do
    Enum.sort_by(list, fn x -> x.name end, direction)
  end

  def sortUsersByAge(list, direction) do
    Enum.sort_by(list, fn x -> x.age end, direction)
  end

  def call do
  end
end
