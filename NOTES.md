SPEND-IT-HERE DOMAIN

Models
1. Business
2. User
    email
    password
3. Cart
4. Item
5. LineItem

* use Devise for User


Controllers
1. BusinessesController
2. UsersController
3. CartsController
4. ItemsController
5. SessionsController
6. StaticPagesController

Views
1. businesses
2. users
3. static_pages
4. sessions

- add devise to User model

    class User < ActiveRecord::Base
      enum role: [:normal, :admin]
    end
