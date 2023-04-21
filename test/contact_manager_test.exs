defmodule ContactManagerTest do
  use ExUnit.Case
  doctest ContactManager

  test "you add a user to the users list" do
    assert ContactManager.addUser([], "Earl", 44) === [%User{name: "Earl", age: 44}]
  end

  test "you can add multiple users to the users list" do
    users = ContactManager.addUser([], "Earl", 44) |> ContactManager.addUser("Earnest", 65)

    assert users === [
             %User{name: "Earl", age: 44},
             %User{name: "Earnest", age: 65}
           ]
  end

  test "you can remove users from the users list" do
    oneUser = ContactManager.addUser([], "Reggie", 32)
    noUsers = ContactManager.removeUser(oneUser, "Reggie")
    assert noUsers === []
  end

  test "you can increment a user's age" do
    users = ContactManager.addUser([], "Melvyn", 61) |> ContactManager.addUser("Charles", 25)

    melvynAgePlusOne = ContactManager.incrementAge(users, "Melvyn")
    assert melvynAgePlusOne === [%User{name: "Melvyn", age: 62}, %User{name: "Charles", age: 25}]
  end

  test "you can increment all users ages" do
    users = ContactManager.addUser([], "Melvyn", 61) |> ContactManager.addUser("Charles", 25)

    users = ContactManager.incrementAllAges(users)

    assert users === [%User{name: "Melvyn", age: 62}, %User{name: "Charles", age: 26}]
  end

  test "sort user list by name ascending" do
    users =
      ContactManager.addUser([], "Melvyn", 61)
      |> ContactManager.addUser("Julian", 25)
      |> ContactManager.addUser("Clive", 54)

    assert ContactManager.sortUsersByName(users, :asc) ===
             [
               %User{name: "Clive", age: 54},
               %User{name: "Julian", age: 25},
               %User{name: "Melvyn", age: 61}
             ]
  end

  test "sort user list by name descending" do
    users =
      ContactManager.addUser([], "Clive", 54)
      |> ContactManager.addUser("Julian", 25)
      |> ContactManager.addUser("Melvyn", 61)

    assert ContactManager.sortUsersByName(users, :desc) ===
             [
               %User{name: "Melvyn", age: 61},
               %User{name: "Julian", age: 25},
               %User{name: "Clive", age: 54}
             ]
  end

  test "sort user list by age ascending" do
    users =
      ContactManager.addUser([], "Julian", 54)
      |> ContactManager.addUser("Charles", 25)
      |> ContactManager.addUser("Melvyn", 61)

    assert ContactManager.sortUsersByAge(users, :asc) ===
             [
               %User{name: "Charles", age: 25},
               %User{name: "Julian", age: 54},
               %User{name: "Melvyn", age: 61}
             ]
  end

  test "sort user list by age descending" do
    users =
      ContactManager.addUser([], "Julian", 25)
      |> ContactManager.addUser("Melvyn", 61)
      |> ContactManager.addUser("Clive", 54)

    assert ContactManager.sortUsersByAge(users, :desc) ===
             [
               %User{name: "Melvyn", age: 61},
               %User{name: "Clive", age: 54},
               %User{name: "Julian", age: 25}
             ]
  end

  test "upon start, get new user name and age and store in a list" do
  end
end
