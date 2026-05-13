--Jose Yael Varela Garcia A01645324

--exercise 1
--List all the objects in your schema using user_objects
-- Group by object_type and count them
-- Which object types do you have?

The schema contains several object types including TABLE, INDEX, etc.
I have:
- 6 Index
- 1 Lob
- 1 Procedure
- 2 Sequence
- 8 Tables
- 1 Trigger

--exercise 2
I chose my SQL table "Bricks"
The generated DDL recreated the BRICKS table definition.

The output includes column definitions such as BRICK_ID(NUMBER), COLOUR(VARCHAR2), SHAPE(VARCHAR2), and WEIGHT(NUMBER) with their corresponding data types.
It also includes Oracle storage parameters and tablespace configuration information.


--exercise 3
I attempted to use the EMIT_SCHEMA transform parameter (DBMS_METADATA.SET_TRANSFORM_PARAM) in order to remove schema names from the generated DDL.
However, the FreeSQL environment restricts some DBMS_METADATA transformation commands, so the parameter could not be applied.

Note : Removing schema qualifiers allows the script to be executed in any Oracle schema without modification.

--exercise 4
If i migrate my schema from my old schema to a new one, i would need to apply changes to my exported DDL.
-- My current table is BRICKS, and when exported with schema qualifications it may appear as USER_SCHEMA.BRICKS, so it needs to be removed so the DDL becomes portable.
If BRICKS had foreign keys referencing other tables, I would need to:
--Ensure those referenced tables exist in SCHEMA_NEW
--Or update the REFERENCES clause to match the new schema structure
In my case BRICKS does not have foreign keys so no changes are required.

To recreate the schema i would follow the order:
1. Tables (BRICKS)
2. Primary keys / constraints (in my case dont have any constraints)
3. Foreign keys (not applicable for my table)
4. Indexes 
5. Other objects

Checklist!
-Export BRICKS DDL without schema name
-Verify columns (BRICK_ID, COLOUR, SHAPE, WEIGHT)
-Check constraints (none or include PK which is the BRICK_ID)
-Recreate table in the new schema 
-Validate data after migration

--exercise 5
I queried the USER_DEPENDENCIES view to analyze object relationships within my schema.
The results show that there are dependencies associated with objects such as procedures and triggers created in the schema. 
Some of these objects reference the schema owner explicitly, indicating schema-level dependencies.

- I have 1 procedure that depends on schema objects
- I have 1 trigger that also contains dependencies linked to the schema owner.
But these dependencies are related to previously created objects, not the BRICKS table.
So even though the BRICKS table itself does not participate in any dependency relationships, other database objects in the schema do have dependencies.

--exercise 6
Given that i do not have access to expdp or directory privileges, I would design a backup strategy using only SQL and DBMS_METADATA.
I would identify all objects in the schema. Then i would extract the schema using DBMS_METADATA.GET_DDL so that it could produce a full DDL script.

Then i would remove schema names (if it exist), and storage and tablespace details so that the scripts are portable.

Lastly, on the target database I would execute the scripts in order (tables, sequences, indexes, constraints or keys, triggers and procedures or functions). After that it is only needed to check and validate that all objects were migrated.