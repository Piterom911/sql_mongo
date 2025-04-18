// 1. Создать базу данных store.
// use store

// 2. Создать коллекцию users и заполнить её следующими данными:
db.users.insertMany([
  {
    _id: 1,
    name: "Alice",
    age: 28,
    email: "alice@example.com",
    address: {
      city: "New York",
      zipcode: 10001,
    },
    hobbies: ["reading", "traveling", "cooking"],
    orders: [
      { orderId: 101, amount: 250, date: "2024-01-01" },
      { orderId: 102, amount: 150, date: "2024-02-15" },
    ],
  },
  {
    _id: 2,
    name: "Bob",
    age: 35,
    email: "bob@example.com",
    address: {
      city: "Los Angeles",
      zipcode: 90001,
    },
    hobbies: ["sports", "photography"],
    orders: [{ orderId: 103, amount: 300, date: "2024-03-01" }],
  },
  {
    _id: 3,
    name: "Charlie",
    age: 42,
    email: "charlie@example.com",
    address: {
      city: "Chicago",
      zipcode: 60601,
    },
    hobbies: ["writing", "music", "hiking"],
    orders: [],
  },
  {
    _id: 4,
    name: "Diana",
    age: 30,
    email: "diana@example.com",
    address: {
      city: "Houston",
      zipcode: 77001,
    },
    hobbies: ["gardening", "reading", "fitness"],
    orders: [
      { orderId: 104, amount: 400, date: "2024-04-10" },
      { orderId: 105, amount: 100, date: "2024-05-01" },
      { orderId: 106, amount: 200, date: "2024-06-15" },
    ],
  },
  {
    _id: 5,
    name: "Edward",
    age: 45,
    email: "edward@example.com",
    address: {
      city: "Seattle",
      zipcode: 98101,
    },
    hobbies: ["chess", "gardening", "traveling"],
    orders: [
      { orderId: 107, amount: 350, date: "2024-07-01" },
      { orderId: 108, amount: 120, date: "2024-07-15" },
    ],
  },
  {
    _id: 6,
    name: "Fiona",
    age: 29,
    email: "fiona@example.com",
    address: {
      city: "San Francisco",
      zipcode: 94101,
    },
    hobbies: ["photography", "baking", "yoga"],
    orders: [],
  },
  {
    _id: 7,
    name: "George",
    age: 33,
    email: "george@example.com",
    address: {
      city: "Austin",
      zipcode: 73301,
    },
    hobbies: ["gaming", "coding", "cycling"],
    orders: [{ orderId: 109, amount: 500, date: "2024-08-10" }],
  },
  {
    _id: 8,
    name: "Hannah",
    age: 38,
    email: "hannah@example.com",
    address: {
      city: "Denver",
      zipcode: 80201,
    },
    hobbies: ["painting", "reading", "running"],
    orders: [
      { orderId: 110, amount: 180, date: "2024-09-05" },
      { orderId: 111, amount: 220, date: "2024-09-20" },
    ],
  },
]);

// 3. Найти всех пользователей старше 30 лет.
db.users.find({ age: { $gt: 30 } });

// 4. Найти всех пользователей, чей город указан как "Los Angeles".
db.users.find({ "address.city": "Los Angeles" });

// 5. Вывести только имя и электронную почту всех пользователей.
db.users.find({}, { _id: 0, name: 1, email: 1 });

// 6. Найти пользователей, у которых хобби включает "reading".
db.users.find({ hobbies: "reading" });

// 7. Найти пользователей, у которых сумма первого заказа больше 200.
db.users.find({ "orders.0.amount": { $gt: 200 } });

// 8. Отсортировать пользователей по возрасту в порядке убывания.
db.users.find({}, { _id: 0, age: 1 }).sort({ age: -1 }); // { _id: 0, age: 1 } easier to see the order

// 9. Найти пользователей, у которых есть заказы с суммой более 300.
db.users.find({ orders: { $elemMatch: { amount: { $gt: 300 } } } });

// 10. Пропустить первых двух пользователей и вернуть только следующие два.
db.users.find().skip(2).limit(2);

// 11. Найти пользователей, у которых возраст не равен 28.
db.users.find({ age: { $ne: 28 } });

// 12. Найти пользователей, живущих не в "New York".
db.users.find({ "address.city": { $ne: "New York" } });

// 13. Для всех пользователей показать имя, город и электронную почту.
db.users.find({}, { _id: 0, name: 1, "address.city": 1, email: 1 });

// 14. Вывести пользователей, живущих в "Denver" или "Seattle", и показать только имя и почтовый индекс.
db.users.find(
  {
    $or: [{ "address.city": "Denver" }, { "address.city": "Seattle" }],
  },
  { _id: 0, name: 1, "address.zipcode": 1 }
);

// 15. Вывести первых трех пользователей.
db.users.find().limit(3);

// 16. Вывести пользователей, отсортированных по возрасту по возрастанию, но показать только первых двух.
db.users.find().sort({ age: 1 }).limit(2);

// 17. Пропустить трех пользователей и вывести следующих двух, отсортировав их по имени по убыванию.
db.users.find().sort({ name: -1 }).skip(3).limit(2);

// 18. Отсортировать пользователей по возрасту в порядке убывания и вывести их имена и возраст.
db.users.find({}, { _id: 0, name: 1, age: 1 }).sort({ age: -1 });

// 19. Найти пользователей, у которых сумма второго заказа больше 150.
db.users.find({ "orders.1.amount": { $gt: 150 } });

// 20. Вывести пользователей, у которых хобби включает слово "coding" или "cycling".
db.users.find({ $or: [{ hobbies: "coding" }, { hobbies: "cycling" }] });
