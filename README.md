A simple way for our archivist to keep track of her records.

App requires a user to be logged in in order to access anything. When the app is first installed you must:
```
> bundle install
> rails db:migrate
```
then add your first user manually
```
> rails console
> user = User.create(first_name: 'Example', last_name: 'User', username: 'exampleuser', password: 'foobar', password_confirmation: 'foobar')
> user.save
```
Password and password_confirmation must be the same. Once the user is created, you will be able to log in and create users through the interface.
