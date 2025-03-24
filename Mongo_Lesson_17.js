// Пагинация и сортировка
// mysql
// select *
// from table1
// where ...
// limit N -- limit M, N

// db.collection_name.find().limit(целое число - кол/во документов, которое нужно вывести)
// db.collection_name.find().skip(целое число - кол/во документов, которое нужно пропустить)
// db.collection_name.find().limit().skip()
// db.collection_name.find().skip().limit()

db.restaurants.insertMany([
    {
      "name": "Restaurant 1",
      "cuisine": "Italian",
      "location": "New York",
      "menu": [
        { "name": "Pizza Margherita", "price": 12 },
        { "name": "Spaghetti Carbonara", "price": 15 },
        { "name": "Tiramisu", "price": 8 }
      ]
    },
    {
      "name": "Restaurant 2",
      "cuisine": "Mexican",
      "location": "Los Angeles",
      "menu": [
        { "name": "Tacos", "price": 10 },
        { "name": "Burritos", "price": 12 },
        { "name": "Guacamole", "price": 6 }
      ]
    },
    {
      "name": "Restaurant 3",
      "cuisine": "Japanese",
      "location": "Tokyo",
      "menu": [
        { "name": "Sushi", "price": 20 },
        { "name": "Ramen", "price": 15 },
        { "name": "Matcha Ice Cream", "price": 7 }
      ]
    }
  ])

  db.students.insertMany([
    {
      firstName: "Bob",
      lastName: "Smith",
      age: 22,
      course: "Mathematics",
      subjects: ["Calculus", "Algebra", "Statistics"],
      averageGrade: 90
    },
    {
      firstName: "Charlie",
      lastName: "Brown",
      age: 21,
      course: "Physics",
      subjects: ["Quantum Mechanics", "Thermodynamics", "Optics"],
      averageGrade: 78
    },
    {
      firstName: "David",
      lastName: "Williams",
      age: 23,
      course: "Chemistry",
      subjects: ["Organic Chemistry", "Inorganic Chemistry", "Biochemistry"],
      averageGrade: 82
    },
    {
      firstName: "Eva",
      lastName: "Davis",
      age: 19,
      course: "Biology",
      subjects: ["Genetics", "Microbiology", "Ecology"],
      averageGrade: 88
    },
    {
      firstName: "Frank",
      lastName: "Miller",
      age: 24,
      course: "Engineering",
      subjects: ["Mechanics", "Electronics", "Material Science"],
      averageGrade: 92
    },
    {
      firstName: "Grace",
      lastName: "Wilson",
      age: 20,
      course: "Medicine",
      subjects: ["Anatomy", "Physiology", "Pathology"],
      averageGrade: 87
    },
    {
      firstName: "Henry",
      lastName: "Moore",
      age: 21,
      course: "Economics",
      subjects: ["Microeconomics", "Macroeconomics", "Econometrics"],
      averageGrade: 80
    },
    {
      firstName: "Isabella",
      lastName: "Taylor",
      age: 22,
      course: "Law",
      subjects: ["Criminal Law", "Civil Law", "International Law"],
      averageGrade: 86
    },
    {
      firstName: "Jack",
      lastName: "Anderson",
      age: 23,
      course: "Philosophy",
      subjects: ["Ethics", "Metaphysics", "Logic"],
      averageGrade: 89
    }
  ])

  // Сортировка
  // mysql
  // select * from table1
  // where ...
  // order by column_name1 asc/desc;
  //
  // db.collection_name.find().sort({column_name: 1(по возр.)/-1(по убыв.)})

  // Вывести студентов, у которых средняя оценка больше 80.
db.students.find({averageGrade: {$gt: 80}})

// Вывести первых трех студентов, у которых средняя оценка больше 80.
db.students.find({averageGrade: {$gt: 80}}).limit(3)

// Вывести трех студенов, у которых средняя оценка больше 80, пропуская первых двух.
db.students.find({averageGrade: {$gt: 80}}).skip(2).limit(3)
db.students.find({averageGrade: {$gt: 80}}).limit(3).skip(2)

// Вывести двух студентов, которым меньше 23, пропуская первого.
db.students.find({age: {$lt: 23}}).skip(1).limit(2)

// Вывести студентов, у которых средняя оценка больше 80. Отсоритпвать по возр. средней оценки.
db.students.find({averageGrade: {$gt: 80}}).sort({averageGrade: 1})

// Вывести всех студентов и отсортировать по именам по алф. порядку.
db.students.find().sort({firstName: 1})

// Вывести студента с самой высокой средней оценкой.
db.students.find().sort({averageGrade: -1}).limit(1)

// Вывести второго студента с самой низкой оценкой.
db.students.find().sort({averageGrade: 1}).skip(1).limit(1)

// Пагинация массива
// Оператор $slice
// db.collection_name.find({Условие}, {Прокеция/Пагинация массива})
// Пагинация массива - {array_name: {$slice: N(кол/во элементов, которое нужно вывести)}}
// Пагинация массива - {array_name: {$slice: [M(кол/во эл. которое нужно пропустить), N(кол/во, которое нужно вывести)]}}
// $slice: limit
// $slice: [skip, limit]

// Вывести всех студентов, оставляя в предметах(subjects) только первые два. 
db.students.find({}, {subjects: {$slice: 2}})
// Вывести студентов, которым больше 20, оставляя только один предмет(subjects) пропуская первые два.
db.students.find({age: {$gt: 20}}, {subjects: {$slice: [2, 1]}})

// Вывести студентов, которым больше 20 и у которых средняя оценка больше 85, оставляя только первый предмет из subjects.
db.students.find({age: {$gt: 20},averageGrade: {$gt: 85}}, {subjects: {$slice: 1}})

// Вывести имена, первые два предмета и средние оценки студентов.
db.students.find({}, {_id: 0, firstName: 1, averageGrade: 1, subjects: {$slice: 2}})

// Если нужно в массиве оставить какое-то кол/во элементов с конца, то можно использовать отрицательное значение.
// Вывести всех студентов, оставляя в предметах(subjects) только последний.
db.students.find({}, {subjects: {$slice: -1}})
// Вывести всех студентов, оставляя в предметах(subjects) только последние два.
db.students.find({}, {subjects: {$slice: -2}})

// Вывести первых двух студентов, которые не проходят предмет "Logic", оставляя в выборке только их имена, фамилии, последние два предмета и среднюю оценку. Отсортировать выборку по убыв. средних оценок.
db.students.find(
    { subjects: { $ne: "Logic" } }, 
    { _id: 0, firstName: 1, lastName: 1, averageGrade: 1, subjects: { $slice: -2 } }
  ).sort({ averageGrade: -1 }).limit(2)
  
  // Вывести рестораны, где название первого блюда 'Tacos'.
db.restaurants.find({'menu.0.name': 'Tacos'})

// Вывести рестораны, где название второго блюда 'Tacos'.
db.restaurants.find({'menu.1.name': 'Tacos'})

// Вывести рестораны, где в меню есть 'Tacos'.
db.restaurants.find({'menu.name': 'Tacos'})

// Вывести рестораны, где есть блюда со стоимостью выше 10.
db.restaurants.find({'menu.price': {$gt: 10}})

// 'array.index' если есть вложенный массив 
// 'object.key' если есть вложенный объект
// 'array.index.key' если есть вложенный массив из объектов, с указанием конкретного индекса
// 'array.key' если есть вложенный массив из объектов, без индекса

db.restaurants.find({'menu.price': {$lt: 8}}, {munu: {$slice: -1}})
