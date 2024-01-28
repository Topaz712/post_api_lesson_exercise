# Exercise for lesson "One-to-many: belongs to and has many associations"

- Create a new Rails application as an API of course, then create the following tables
  - post
    - title:string
    - body:text
  
  - comment
    - post:references
    - body:text
    - published:boolean
      
- Create a one-to-many relationship between the post and comment table.

- Then create a new post along with their comments.

Answer:

1. run  `rails new post_api_lesson_exercise --api`

2. In vscode terminal run `rails generate model Post title:string body:text`
Then after this, run `rails generate model Comment post:references body:text published:boolean`

3. In *post.rb* and *comment.rb files, located in app/models/ add the following code:

post.rb:
```
class Post < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :body, presence: true

  has_many :comments
end
```

comment.rb:
```
class Comment < ApplicationRecord
  validates :body, presence: true

  belongs_to :post
end
```

4. Now in vscode terminal run:
`rails db:migrate`

5. Now that we ran the migrations to create the database tables, we run `rails console` to create a new post with the comment

6. Run in rails console: `post = Post.create(title: "Hello World", body: "This is my first post", comments: [Comment.new(body: "This is my first comment", published: true)])`
