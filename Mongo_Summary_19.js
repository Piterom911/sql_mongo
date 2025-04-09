// Функция aggregate
// db.collection_name.aggregate([Операторы функции aggregate])
// Операторы функции aggregate:
// $match - Фильтрация/условие
// $project - Проекция(поля, которые нужно вывести)
// $skip - Пагинация(кол/во документов, которое нужно пропусить)
// $limit - Пагинация(кол/во документов, которое нужно вывести)
// $sort - Сортировка
// $group - Группировка
// Агрегатные операторы
// $sum
// $avg
// $min
// $max
// db.collection_name.aggregate([
//     {$match: {Условие}},
//     {$project: {Проекция}}, //поле1: 1, поле2: 0
//     {$sort: {Сортировка}}, // поле1: 1/-1
//     {$skip: {Пагинация}}, // кол/во
//     {$limit: {Пагинация}}, // кол/во
//     {$group: {_id: null(если нет группировки)/'$поле'(поле группировки),
// имя_агрегатного_поля: {агрегатный_оператор: '$поле'}}}
// ])

// _id и имя_агрегатного_поля - новые поля, где в _id хранится null, если нет группировки,
// или УНИКАЛЬНЫЕ значения поля '$поле', если есть группировка по этому полю.
// А 'имя_агрегатного_поля' это название нового поля, в котором храним значения агрегатной функции.

// 1. Создать коллекцию orders со свойствами _id, customer, product, amount,
// city используя следующие данные:
db.orders.insertMany([
  { customer: "Olga", product: "Apple", amount: 15.55, city: "Berlin" },
  { customer: "Anna", product: "Apple", amount: 10.05, city: "Madrid" },
  { customer: "Olga", product: "Kiwi", amount: 9.6, city: "Berlin" },
  { customer: "Anton", product: "Apple", amount: 20, city: "Roma" },
  { customer: "Olga", product: "Banana", amount: 8, city: "Madrid" },
  { customer: "Peter", product: "Orange", amount: 18.3, city: "Paris" },
]);

// 2. Найти сколько всего было совершено покупок.
db.orders.aggregate([{ $group: { _id: "product", all_orders: { $sum: 1 } } }]);

// 3. Найти сколько всего раз были куплены яблоки.
db.orders.aggregate([
  { $match: { product: "Apple" } },
  { $group: { _id: "product", apple_count: { $sum: 1 } } },
]);

// 4. Вывести все документы отсортированными по стоимости покупки - от самой недорогой до самой дорогой.
db.orders.aggregate([{ $sort: { amount: 1 } }]);

// 5. Вывести три самые дорогие покупки.
db.orders.aggregate([{ $sort: { amount: -1 } }, { $limit: 3 }]);

// 6. Найти сколько всего покупок было совершено в Берлине
db.orders.aggregate([
  { $match: { city: "Berlin" } },
  { $group: { _id: null, orders_in_berlin: { $sum: 1 } } },
]);

// 7. Найти количество покупок яблок в городах Берлин и Мадрид
db.orders.aggregate([
  {
    $match: {
      product: "Apple",
      city: { $in: ["Berlin", "Madrid"] },
    },
  },
  {
    $group: {
      _id: "$city",
      apple_orders: { $sum: 1 },
    },
  },
]);
// 8. Найти сколько было потрачено каждым покупателем
db.orders.aggregate([
  { $group: { _id: "$customer", sum_amount: { $sum: "$amount" } } },
]);

// 9. Найти сколько было потрачено на каждый товар
db.orders.aggregate([
  { $group: { _id: "$product", sum_amount: { $sum: "$amount" } } },
]);
