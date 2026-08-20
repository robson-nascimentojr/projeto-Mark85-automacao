from robot.api.deco import keyword
from pymongo import MongoClient

client = MongoClient(
    "")

db = client['mark85_db']


@keyword('Remove user from database')
def remove_user(email):
    users = db['users']
    users.delete_many({'email': email})
    print('removing user by' + email)

@keyword('Insert user into database')
def insert_user(name, email, password):
    users = db['users']
    users.insert_one({
        'name': name,
        'email': email,
        'password': password
    })
    print('inserting user: ' + name + ' | ' + email)