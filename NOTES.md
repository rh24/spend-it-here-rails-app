SPEND-IT-HERE DOMAIN

Models
1. Business (attributes: service_type, rating, price_range)
2. User
    email
    password
3. Order
4. Item
5. LineItem (attributes: quantity (user submittable))
6. Review (attributes: business_id, user_id, comment, rating)
7. Category

*  Devise for User

Model Relationships:
  Category has_many Businesses

  Business belongs_to Category
  Business has_many Items
  Business has_many Users, through: Orders
  Business has_many Reviews
  <!-- Business has_many Users, through: Reviews (user submittable attribute: rating) --> Can I still make this data useful through a polymorphic association?

  Item belongs_to Business

  User has_many Orders
  User has_many Reviews

  LineItem belongs_to Order
  LineItem belongs_to Item

  Order belongs_to User
  Order has_many LineItems
  Order has_many Items, through: LineItems (user submittable attribute: quantity)

  Review belongs_to User
  Review belongs_to Business
  Review belongs_to Rating

  Rating has_many Reviews
  Rating has_many Businesses, through: Reviews (w/ user submittable attributes)

  Wouldn't it be cool if you could check out a bunch of things at the same time? Like order food, buy toiletries all in one order. Is that weird?

  Just because a relationship is there, does it mean I have to use it/define it?

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
