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

  def addUserOption(list) do
    IO.puts("Please add a user.")
    parsedName = String.trim(IO.gets("Enter a name: "))
    parsedAge = Integer.parse(IO.gets("Enter an age: ")) |> elem(0)
    IO.puts("\n#{parsedName} has been added.")
    users = addUser(list, parsedName, parsedAge)
    printUserList(users)
    printOptions()
    options(users)
  end

  def removeUserOption(list) do
    IO.puts("Please remove a user.")
    parsedName = String.trim(IO.gets("Enter a name: "))
    IO.puts("\n#{parsedName} has been removed.")
    users = removeUser(list, parsedName)
    printUserList(users)
    printOptions()
    options(users)
  end

  def incrementAgeOption(list) do
    IO.puts("Please choose a user to increment their age.")
    parsedName = String.trim(IO.gets("Enter a name: "))
    IO.puts("\n#{parsedName}'s age has been incremented.")
    users = incrementAge(list, parsedName)
    printUserList(users)
    printOptions()
    options(users)
  end

  def incrementAllAgesOption(list) do
    IO.puts("\nAll ages have been incremented.")
    users = incrementAllAges(list)
    printUserList(users)
    printOptions()
    options(users)
  end

  def sortByNameAscendingOption(list) do
    IO.puts("\nAll users have been sorted by name ascending.")
    users = sortUsersByName(list, :asc)
    printUserList(users)
    printOptions()
    options(users)
  end

  def sortByNameDescendingOption(list) do
    IO.puts("\nAll users have been sorted by name descending.")
    users = sortUsersByName(list, :desc)
    printUserList(users)
    printOptions()
    options(users)
  end

  def sortByAgeAscendingOption(list) do
    IO.puts("\nll users have been sorted by age ascending.")
    users = sortUsersByAge(list, :asc)
    printUserList(users)
    printOptions()
    options(users)
  end

  def sortByAgeDescendingOption(list) do
    IO.puts("\nAll users have been sorted by age descending.")
    users = sortUsersByAge(list, :desc)
    printUserList(users)
    printOptions()
    options(users)
  end

  def options(list) do
    option = String.trim(IO.gets("Please select an option [1, 2, 3, 4, 5, 6, 7, 8]: "))
    case option do
     "1" ->
        addUserOption(list)
    "2" ->
        removeUserOption(list)
    "3" ->
        incrementAgeOption(list)
    "4" ->
        incrementAllAgesOption(list)
    "5" ->
        sortByNameAscendingOption(list)
    "6" ->
        sortByNameDescendingOption(list)
    "7" ->
        sortByAgeAscendingOption(list)
    "8" ->
        sortByAgeDescendingOption(list)
    end
  end

  def printOptions() do
    IO.puts("\nPlease select from the following options: \n")
    IO.puts("1. Add a User")
    IO.puts("2. Remove a User")
    IO.puts("3. Increment a user's age")
    IO.puts("4. Increment all users' ages")
    IO.puts("5. Sort all users by name, ascending")
    IO.puts("6. Sort all users by name, descending")
    IO.puts("7. Sort all users by age, ascending")
    IO.puts("8. Sort all users by age, descending\n")
  end

  def printUserList(list) do
    IO.puts("\nUser List:\n")
    for x <- list, do: IO.write("Name: #{x.name}, Age: #{x.age}\n")
  end

  def start do
    IO.puts("Welcome to the Contact Manager")
    printOptions()
    options([])
  end
end
