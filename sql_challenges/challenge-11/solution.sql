--exercise 1

## Questions
1. What relationships should `Comment` have? With Tasks and Users.
2. Should `Task` have a `comments` relationship? Yes, a task can have multiple comments.
3. What should happen to comments when a task is deleted? they also should be deleted.

Modified parts
class Comment(Base):
    __tablename__ = "comment"
    id           = Column(Integer, primary_key=True)
    task_id      = Column(Integer, ForeignKey("tasks.id"))
    user_id      = Column(Integer, ForeignKey("users.id"))
    content      = Column(Text, nullable = false)
    created_at   = Column(DateTime, server_default=func.current_timestamp())

    task = relationship("Task", back_populates="comments")
    user = relationship("User")

    def __repr__(self):
        return f"<Comment(id={self.id})>"

--And in the class Task we add the next part to be able to eliminate comments when a task is deleted.
comments = relationship(
        "Comment",
        back_populates="task",
        cascade="all, delete"
)

--exercise 2: Migration
Migration done.

/content/alembic/versions/17fc0a469810_add_comments_table.py
/content/alembic/versions/8e1ecc0811f5_initial_schema.py

1. What does `upgrade()` do? Applies the new changes to the database schema. In this case it creates the comment table.
2. What does `downgrade()` do? Reverts the changes made by upgrade. In this case it removes the comment table and restores the previous database state.
3. What happens if you downgrade this migration? The comment table will be deleted and any data stored in it will be lost.

--exercise 3 — CRUD Challenge
with Session(engine) as session:

    #Team creation
    devops_team = Team(
        name="DevOps",
        description="Infrastructure and deployment"
    )

    session.add(devops_team)
    session.commit()

    print("Team created")


    #User creation
    diana = User(
        username="diana_ops",
        email="diana@example.com",
        full_name="Diana Ops",
        team=devops_team
    )

    session.add(diana)
    session.commit()

    print("User created")


    # Task creation
    task1 = Task(
        title="Setup CI/CD",
        description="Configure pipelines",
        status="high",
        assignee=diana
    )

    task2 = Task(
        title="Monitor servers",
        description="Install monitoring",
        status="medium",
        assignee=diana
    )

    task3 = Task(
        title="Clean logs",
        description="Delete old logs",
        status="low",
        assignee=diana
    )

    session.add_all([task1, task2, task3])
    session.commit()

    print("Tasks created")


    # Task count
    count = session.query(Task).count()
    print(f"Total tasks: {count}")


    # Closing a task
    task1.status = "closed"
    session.commit()

    print(f"Task closed: {task1.title}")


    #Task deletion
    session.delete(task3)
    session.commit()

    print(f"Deleted task: {task3.title}")

--exercise 4 - Migration Rollback
1. What happens to the column? The added column in the migration is deleted.
2. What happens to the data? The stored data in that column is deleted.

--exercise 5 — Concept Check
1. Why use ORM instead of raw SQL?
It makes the database interaction easier since we do not have to write multiple SQL queries manually.

2. Why use migrations? For version control and to manage the database changes in a safe way.

3. When would you rollback? When a migration introduces an error, bug or any unwanted change.

4. Difference between `add()` and `commit()`?
add stages the changes in the session.
commit permanently saves the changes to the database.

5. Why are relationships useful?
To facilitate the navigation between objects without having to write difficult SQL joins.