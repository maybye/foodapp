-- Создание таблицы restaurants
CREATE TABLE restaurants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    delivery_charge DECIMAL(5, 2) NOT NULL,
    image VARCHAR(255) NOT NULL,
    hours JSON NOT NULL
);

-- Создание таблицы menus
CREATE TABLE menus (
    id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_id INT,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(5, 2) NOT NULL,
    url VARCHAR(255) NOT NULL,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id)
);

-- Вставка данных в таблицу restaurants
INSERT INTO restaurants (name, address, delivery_charge, image, hours) VALUES
("Пицца Московская", "ул. Ленина, д. 10", 300.00, "https://example.com/moscow_pizza.jpg", '{"Sunday":"11:00 AM - 7:00 PM","Monday":"10:00 AM - 9:00 PM","Tuesday":"10:00 AM - 10:00 PM","Wednesday":"10:00 AM - 11:00 PM","Thursday":"10:00 AM - 10:00 PM","Friday":"10:00 AM - 11:00 PM","Saturday":"10:00 AM - 2:00 PM"}'),
("Хот-доги Петровича", "ул. Гагарина, д. 5", 250.00, "https://example.com/petrovich_hotdogs.jpg", '{"Sunday":"11:00 AM - 7:00 PM","Monday":"10:00 AM - 10:00 PM","Tuesday":"10:00 AM - 10:00 PM","Wednesday":"10:00 AM - 8:00 PM","Thursday":"10:00 AM - 10:00 PM","Friday":"10:00 AM - 10:00 PM","Saturday":"9:00 AM - 1:00 PM"}'),
("Быстрый перекус", "ул. Комсомольская, д. 20", 300.00, "https://example.com/fast_food.jpg", '{"Sunday":"11:00 AM - 7:00 PM","Monday":"10:00 AM - 10:00 PM","Tuesday":"10:00 AM - 10:00 PM","Wednesday":"10:00 AM - 8:00 PM","Thursday":"10:00 AM - 10:00 PM","Friday":"10:00 AM - 10:00 PM","Saturday":"9:00 AM - 2:00 PM"}'),
("Кафе Ивановича", "ул. Пушкина, д. 15", 350.00, "https://example.com/ivanovich_cafe.jpg", '{"Sunday":"11:00 AM - 7:00 PM","Monday":"10:00 AM - 10:00 PM","Tuesday":"10:00 AM - 10:00 PM","Wednesday":"10:00 AM - 8:00 PM","Thursday":"10:00 AM - 10:00 PM","Friday":"10:00 AM - 10:00 PM","Saturday":"10:00 AM - 3:00 PM"}');

-- Вставка данных в таблицу menus
INSERT INTO menus (restaurant_id, name, price, url) VALUES
((SELECT id FROM restaurants WHERE name="Пицца Московская"), "Спагетти", 350.00, "https://example.com/spaghetti.jpg"),
((SELECT id FROM restaurants WHERE name="Пицца Московская"), "Пицца с сардинами", 500.00, "https://example.com/sardine_pizza.jpg"),
((SELECT id FROM restaurants WHERE name="Пицца Московская"), "Шоколадная пицца", 200.00, "https://example.com/chocolate_pizza.jpg"),
((SELECT id FROM restaurants WHERE name="Пицца Московская"), "Сырные палочки", 250.00, "https://example.com/cheese_sticks.jpg"),
((SELECT id FROM restaurants WHERE name="Пицца Московская"), "Куриный бургер", 300.00, "https://example.com/chicken_burger.jpg"),
((SELECT id FROM restaurants WHERE name="Пицца Московская"), "Обед бокс", 250.00, "https://example.com/lunch_box.jpg"),
((SELECT id FROM restaurants WHERE name="Пицца Московская"), "Салат Цезарь", 400.00, "https://example.com/caesar_salad.jpg"),
((SELECT id FROM restaurants WHERE name="Пицца Московская"), "Салат Кобб", 350.00, "https://example.com/cobb_salad.jpg"),
((SELECT id FROM restaurants WHERE name="Пицца Московская"), "Печенье и брауни", 500.00, "https://example.com/cookies_brownie.jpg"),
((SELECT id FROM restaurants WHERE name="Пицца Московская"), "Брауни на подносе", 450.00, "https://example.com/brownie_platter.jpg"),
((SELECT id FROM restaurants WHERE name="Хот-доги Петровича"), "Хот-дог", 150.00, "https://example.com/hotdog.jpg"),
((SELECT id FROM restaurants WHERE name="Хот-доги Петровича"), "Сырный хот-дог", 200.00, "https://example.com/cheese_hotdog.jpg"),
((SELECT id FROM restaurants WHERE name="Хот-доги Петровича"), "Монстр хот-дог", 300.00, "https://example.com/monster_hotdog.jpg"),
((SELECT id FROM restaurants WHERE name="Хот-доги Петровича"), "Картошка фри", 100.00, "https://example.com/fries.jpg"),
((SELECT id FROM restaurants WHERE name="Хот-доги Петровича"), "Молочный коктейль", 250.00, "https://example.com/milkshake.jpg"),
((SELECT id FROM restaurants WHERE name="Хот-доги Петровича"), "Шоколадный коктейль", 300.00, "https://example.com/chocolate_shake.jpg"),
((SELECT id FROM restaurants WHERE name="Хот-доги Петровича"), "Клубничный коктейль", 200.00, "https://example.com/strawberry_shake.jpg"),
((SELECT id FROM restaurants WHERE name="Хот-доги Петровича"), "Филе-о-фиш", 350.00, "https://example.com/filet_o_fish.jpg"),
((SELECT id FROM restaurants WHERE name="Хот-доги Петровича"), "Наггетсы", 250.00, "https://example.com/nuggets.jpg"),
((SELECT id FROM restaurants WHERE name="Хот-доги Петровича"), "Комбо обед", 500.00, "https://example.com/combo_meal.jpg"),
((SELECT id FROM restaurants WHERE name="Хот-доги Петровича"), "Завтрак МакМаффин", 400.00, "https://example.com/mcmuffin_meal.jpg"),
((SELECT id FROM restaurants WHERE name="Быстрый перекус"), "Шоколадный коктейль", 300.00, "https://example.com/chocolate_shake.jpg"),
((SELECT id FROM restaurants WHERE name="Быстрый перекус"), "Клубничный коктейль", 200.00, "https://example.com/strawberry_shake.jpg"),
((SELECT id FROM restaurants WHERE name="Быстрый перекус"), "Филе-о-фиш", 350.00, "https://example.com/filet_o_fish.jpg"),
((SELECT id FROM restaurants WHERE name="Быстрый перекус"), "Наггетсы", 250.00, "https://example.com/nuggets.jpg"),
((SELECT id FROM restaurants WHERE name="Быстрый перекус"), "Комбо обед", 500.00, "https://example.com/combo_meal.jpg"),
((SELECT id FROM restaurants WHERE name="Быстрый перекус"), "Завтрак МакМаффин", 400.00, "https://example.com/mcmuffin_meal.jpg"),
((SELECT id FROM restaurants WHERE name="Кафе у дороги"), "Куриный бургер", 300.00, "https://example.com/chicken_burger.jpg"),
((SELECT id FROM restaurants WHERE name=" Кафе у дороги"), "Обед бокс", 250.00, "https://example.com/lunch_box.jpg"),
((SELECT id FROM restaurants WHERE name=" Кафе у дороги"), "Салат Цезарь", 400.00, "https://example.com/caesar_salad.jpg"),
((SELECT id FROM restaurants WHERE name=" Кафе у дороги"), "Салат Кобб", 350.00, "https://example.com/cobb_salad.jpg"),
((SELECT id FROM restaurants WHERE name=" Кафе у дороги"), "Печенье и брауни", 500.00, "https://example.com/cookies_brownie.jpg"),
((SELECT id FROM restaurants WHERE name=" Кафе у дороги"), "Брауни на подносе", 450.00, "https://example.com/brownie_platter.jpg");