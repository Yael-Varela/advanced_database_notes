# Concept name
ORM

## My understanding
It's a technique that allows the conversion of code into queries that modifies the database structure. Instead of using normal SQL commands we use classes and objects to map the database table and then control the changes using the code. 

## Why it matters
Because it can reduce manual work like typing multiple times an SQL command (Reducing repetition) making the database easier to maintain and modify in a controlled manner.

## Example
user = User.get(id=1)
print(user.name)