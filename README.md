# Ruby on Rails Order Application:

Devise and JWT for Users
after clone and setup the environment:
- rails add_csv_data:product_data to import products data if product.csv present
- rails db:seed to create some products
- rails s

- Sign up
POST localhost:3000/users
Body:
{
    "email": "email@gmail.com",
    "password": 123456,
    "password_confirmation": 123456
}

- Sign in
POST localhost:3000/users/sign_in
Body:
{
    "email": "email@gmail.com",
    "password": 123456,
}

- Create order
POST localhost:3000/api/v1/main_orders
Headers: Authorization => "user token"
Body:
{
    "products": [
        {"id": 1, "quantity": 2},
        {"id": 2, "quantity": 3}
    ]
}

- Get user orders
GET localhost:3000/api/v1/main_orders
Headers: Authorization => "user token"

- Update order Accept/ reject
PUT localhost:3000/api/v1/main_orders/1
Headers: Authorization => "user token"
Body:
{
    "status": "accepted" || "rejected"
}