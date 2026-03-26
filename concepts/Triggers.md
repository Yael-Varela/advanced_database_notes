# Concept name
Triggers

## My understanding
It's a process that activates in response to a certain event.

## Why it matters
Because it can automatize responses.


## Example
CREATE OR REPLACE TRIGGER trg_pet_care_log 
BEFORE INSERT ON PET_CARE_LOG
FOR EACH ROW
BEGIN
    :NEW.UPDATE_DATE := SYSDATE;
    :NEW.UPDATED_BY_USER := USER;

 EXCEPTION
    WHEN OTHERS THEN 
    RAISE_APPLICATION_ERROR(
        -20002,  //Just a code id for the error, we will use the same for all errors since its not needed to be specific.
        "General error"
    );
END;