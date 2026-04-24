# Concept name
ACID 

## My understanding
Is a set of properties that guarantee that database transactions are reliable.

Atomicity : A transaction is all or nothing. If one operations fails, everything is undone.

Consistency : The database always moves from one valid state to another. 

Isolation : Transaction don't interere with each other, regardless if they run at each other.

Durability : Once a transaction is completed, it stays saved.

## Why it matters
Because it prevents problems that originate from an unreliable database.

## Example
 A key example is a bank transfer: money is deducted from Account A and added to Account B; if one step fails, the whole transaction rolls back, preventing lost funds