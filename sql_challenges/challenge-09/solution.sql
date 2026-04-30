--Exercise 1
--Initial balance. 
SELECT * FROM accounts ORDER BY account_id;

BEGIN
    UPDATE accounts
    SET balance = balance - 50
    WHERE account_id = 3;

    UPDATE accounts
    SET balance = balance + 50
    WHERE account_id = 1;

    COMMIT;
END;
/
--Final verify
SELECT * FROM accounts ORDER BY account_id;


--Exercise 2
-- Initial verify
SELECT * FROM accounts ORDER BY account_id;

BEGIN
    UPDATE accounts
    SET balance = balance - 10000
    WHERE account_id = 2;

    UPDATE accounts
    SET balance = balance + 10000
    WHERE account_id = 3;

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
END;

--Final verify
SELECT * FROM accounts ORDER BY account_id;

--Exercise 3
UPDATE accounts
SET balance = balance + 25
WHERE account_id = 1;

SAVEPOINT sp_A;

UPDATE accounts
SET balance = balance - 25
WHERE account_id = 3;

ROLLBACK TO sp_A;

UPDATE accounts
SET balance = balance - 25
WHERE account_id = 2;

COMMIT;

--Final verify
SELECT * FROM accounts ORDER BY account_id;

--Exercise 4

CREATE OR REPLACE PROCEDURE deposit_funds (
    p_account_id NUMBER,
    p_amount NUMBER
)
IS
BEGIN
    IF p_amount <= 0 THEN
        RAISE_APPLICATION_ERROR(-1, 'Amount must be greater than 0');
    END IF;

    UPDATE accounts
    SET balance = balance + p_amount
    WHERE account_id = p_account_id;

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
/

-- Exercise 5
-- Q1: You're building a patient appointment booking system.
-- A booking requires:
--   a) Reserve the time slot
--   b) Create the appointment record
--   c) Send a confirmation notification
-- Which of these should be inside the transaction? Which should be outside? Why?

Within the transaction, the time slot reservation and appointment record creation must be completed.
Outside the transaction, the confirmation notification must be sent.

This is because the time slot reservation and appointment creation must be completed simultaneously or the transaction will fail (either completely success or a failure).
Sending the notification is not critical for database consistency.

-- Q2: Your stored procedure calls COMMIT at the end.
-- A developer calls your procedure from inside their own larger transaction.
-- What problem does this create?

The commit created inside the procedure breaks the larger transaction. 
The commit  will permanently save changes early so the outer transaction can not longer rollback in a correct way.

-- Q3: You have a function called calculate_copay() and a procedure called post_payment().
-- A colleague wants to use calculate_copay() inside a SELECT statement.
-- Can they? Can they do the same with post_payment()? Why or why not?
Yes, the calculate_copay can be used inside the select, because this is a function that doesn't perform a transaction.
However, the post_payment can't be used inside the select, because it is a procedure which performs actions or updates/
