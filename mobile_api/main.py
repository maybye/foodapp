from flask import Flask, jsonify
import mysql.connector
import json

app = Flask(__name__)


def get_db_connection():
    connection = mysql.connector.connect(
        host='localhost',
        port=8889,
        user='root',
        password='root',
        database='foodapp'
    )
    return connection


@app.route('/restaurants', methods=['GET'])
def get_restaurants():
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)

    # Получение данных о ресторанах
    cursor.execute('SELECT * FROM restaurants')
    restaurants = cursor.fetchall()

    restaurant_list = []
    for restaurant in restaurants:
        # Получение данных о меню для каждого ресторана
        cursor.execute('SELECT name, price, url FROM menus WHERE restaurant_id = %s', (restaurant['id'],))
        menus = cursor.fetchall()

        restaurant_data = {
            "name": restaurant['name'],
            "address": restaurant['address'],
            "delivery_charge": restaurant['delivery_charge'],
            "image": restaurant['image'],
            "hours": json.loads(restaurant['hours']),
            "menus": menus
        }
        restaurant_list.append(restaurant_data)

    cursor.close()
    connection.close()

    return jsonify(restaurant_list)


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5555)
