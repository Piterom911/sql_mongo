// Обновление данных
// db.collection_name.replaceOne(filter, update [, options]) //options - true/false(по умолч.)
// db.collection_name.updateOne({filter}, {update})
// db.collection_name.updateMany({filter}, {update})
// $set - если нужно обновить отдельное поле, или если обновляемого поля нет, то оно создается
// $inc - для увеличения значения числового поля на определенное кол/во единиц, если обновляемого поля нет, то оно создается
// $unset - для удаления поля
// Обновление массивов
// $push - добавление элемента в массив
// $addToSet - Отличие от push в том, что addToSet добавляет данные, если их еще нет в массиве(через push данные дублируются)
// $push/$addToSet + $each - можно добавить сразу несколько значений
// $position - задает позицию в массиве для вставки элементов
// $slice -  указывает, сколько элементов оставить в массиве после вставки
// Работают только с $push и $each

// $pop - позволяет удалить один эл. из массива либо первый, либо последний
// если значение 1 то удалет последний эл., если -1, то первый
// $pull - удаляет каждое вхождение эл. в массив (можно удалить только один элемент)
// $pullAll - удаляет несколько элементов из массива

db.employees1.insertMany([
  {
    firstname: "John",
    lastname: "Doe",
    age: 28,
    position: "Developer",
    salary: 2500,
    skills: ["JavaScript", "HTML", "CSS"],
  },
  {
    firstname: "Jane",
    lastname: "Smith",
    age: 35,
    position: "Project Manager",
    salary: 4000,
    skills: ["Management", "Planning", "Team Leading"],
  },
  {
    firstname: "Mike",
    lastname: "Johnson",
    age: 32,
    position: "Designer",
    salary: 3000,
    skills: ["Photoshop", "Illustrator", "Creativity"],
  },
  {
    firstname: "Emily",
    lastname: "Davis",
    age: 25,
    position: "Tester",
    salary: 2000,
    skills: ["Attention to detail", "Scripting", "Testing"],
  },
]);

// 1. Создать коллекцию employees1.
//github.com/annykh/GT130824/blob/main/Summary%2018.js

// 2. Полностью заменить документ сотрудника с именем John и фамилией Doe на новый.
// Новый документ:
// Имя: John
// Фамилия: Doe
// Возраст: 29
// Должность: Full Stack Developer
// Зарплата: 3500
// Навыки: ['JavaScript', 'Node.js', 'React']
https: db.employees1.replaceOne(
  { firstname: "John", lastname: "Doe" },
  {
    firstname: "John",
    lastname: "Doe",
    age: 29,
    position: "Full Stack Developer",
    salary: 3500,
    skills: ["JavaScript", "Node.js", "React"],
  }
);

// 3. Увеличить зарплату на 500 всем сотрудникам старше 30 лет.
db.employees1.updateMany({ age: { $gt: 30 } }, { $inc: { salary: 500 } });

// 4. Добавить поле bonus со значением 0 для всех сотрудников.
db.employees1.updateMany({}, { $set: { bonus: 0 } });

// 5. Установить значение поля bonus в 100 для сотрудников с зарплатой больше 3000.
db.employees1.updateMany({ salary: { $gt: 3000 } }, { $set: { bonus: 100 } });

// 6. Увеличить зарплату сотрудника Emily Davis на 1000.
db.employees1.updateMany(
  { firstname: "Emily", lastname: "Davis" },
  { $inc: { salary: 1000 } }
);

// 7. Уменьшить зарплату сотрудника Mike Johnson на 300.
db.employees1.updateMany(
  { firstname: "Mike", lastname: "Johnson" },
  { $inc: { salary: -300 } }
);

// 8. Добавить поле department со значением IT для сотрудника Jane Smith.
db.employees1.updateMany(
  { firstname: "Jane", lastname: "Smith" },
  { $set: { department: "IT" } }
);

// 9. Удалить поле skills у сотрудника Mike Johnson.
db.employees1.updateMany(
  { firstname: "Mike", lastname: "Johnson" },
  { $unset: { skills: 1 } }
);

// 10. Удалить поле bonus для всех сотрудников, кроме Jane Smith.
db.employees1.updateMany(
  { firstname: { $ne: "Jane" }, lastname: { $ne: "Smith" } },
  { $unset: { bonus: "" } }
);

// 11. Добавить поле experience со значением 5 для всех сотрудников старше 30 лет.
db.employees1.updateMany({ age: { $gt: 30 } }, { $set: { experience: 5 } });

// 12. Установить значение поля experience в 2 для сотрудников младше 30 лет.
db.employees1.updateMany({ age: { $lt: 30 } }, { $set: { experience: 2 } });

// 13. Создать новое поле position_level и установить его значение в зависимости от зарплаты:
// Junior — зарплата меньше 2500.
// Middle — зарплата от 2500 до 3500.
// Senior — зарплата больше 3500.
db.employees1.updateMany(
  { salary: { $lt: 2500 } },
  { $set: { position_level: "Junior" } }
);
db.employees1.updateMany(
  { salary: { $gte: 2500, $lte: 3500 } },
  { $set: { position_level: "Middle" } }
);
db.employees1.updateMany(
  { salary: { $gt: 3500 } },
  { $set: { position_level: "Senior" } }
);

// 14. Добавить новый навык "HTML" для сотрудника с именем "John".
db.employees1.updateOne({ firstname: "John" }, { $push: { skills: "HTML" } });

// 15. Добавить сразу два навыка "Scrum" и "Kanban" для сотрудника "Jane".
db.employees1.updateOne(
  { firstname: "Jane" },
  { $push: { skills: { $each: ["Scrum", "Kanban"] } } }
);

// 16. Добавить навык "React" для "John" только в том случае, если его еще нет.
db.employees1.updateOne(
  { firstname: "John" },
  { $addToSet: { skills: "React" } }
);

// 17. Добавить навык "Agile" для "Jane" на вторую позицию в массиве.
db.employees1.updateOne(
  { firstname: "Jane" },
  { $push: { skills: { $each: ["Agile"], $position: 1 } } }
);

// 18. Удалить последний элемент из массива навыков "Emily".
db.employees1.updateOne({ firstname: "Emily" }, { $pop: { skills: 1 } });

// 19. Удалить навык "Planning" у "Jane".
db.employees1.updateOne(
  { firstname: "Jane" },
  { $pull: { skills: "Planning" } }
);

// 20. Удалить навыки "Javascript" и "HTML" у "John".
db.employees1.updateOne(
  { firstname: "John" },
  { $pullAll: { skills: ["Javascript", "HTML"] } }
);
