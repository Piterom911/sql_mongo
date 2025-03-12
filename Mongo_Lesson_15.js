// MONGODB
// Созаднине базы данных/активация базы данных 
// use db_name
    // use GT130824

// Создание коллекции
// db.createCollection('collection_name')
db.createCollection('users')

// Очистить скрипт/терминал
    // cls

// Показать все базы данных 
    // show databases

// Показать все коллекции
    // show collections

// Удалить коллекцию
db.collection_name.drop()
// Удалить базу данных 
db.dropDatabase()

// use GT130824
db.createCollection('users')
 
// Добавить в коллекцию один документ
db.collection_name.insertOne({Объект/Документ})
// Добавить в коллекцию несколько документов(массив документов)
db.collection_name.insertMany([{Объект}, {Объект}, ...])
// enter - Запуск кода
// shift+enter - Перенос сторки

db.users.insertOne({
    first_name: 'John', 
    last_name: 'Smith', 
    age: 25,
    email: 'jsmith@gmail.com'
})

db.insertMany([
    {
        first_name: 'Alex', 
        last_name: 'Johnson', 
        age: 15,
        email: 'someemail@gmail.com'
    },
    {
        first_name: 'Sara', 
        last_name: 'Silly', 
        age: 45,
        email: 'saraconor@gmail.com'
    },
    {
        first_name: 'Fill', 
        last_name: 'Peterson', 
        age: 24,
        email: 'fillius@gmail.com'
    },
    {
        first_name: 'Dana', 
        last_name: 'Dell', 
        age: 19,
        email: 'dandel@gmail.com'
    },
])

// insertOne и insertMany создают новую коллекцию (если ее нет) и заполняют документами

// Создать коллекцию fruits и заполнить документами со следующими свойствами: 
// title, price, count. Используйте следующие данные:

//  Apple 280 4
//  Lemon 300 8
//  Lime 500 3
//  Orange 200 8
db.fruits.insertMany([
    {
            title: "Apple",
            price: 280,
            count: 4
        },
        {
            title: "Lemon",
            price: 300,
            count: 8
        },
        {
            title: "Lime",
            price: 500,
            count: 3
        },
        {
            title: "Orange",
            price: 200,
            count: 8
        }
    ])