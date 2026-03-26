//Part 1:

//There is no need for OLD since this is a trigger that fires before inserting each row in the PET_CARE_LOG table.
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



//Part 2

CREATE OR REPLACE TRIGGER trg_beforeUpdate
BEFORE INSERT ON PET_CARE_LOG
FOR EACH ROW
BEGIN
    IF USER != :OLD.UPDATED_BY_USER THEN //Check if it is not the same user, if it is not, it will be activated and display the error message.
        RAISE_APPLICATION_ERROR(
        -20002,
        "It's a different USER"
    );
    END IF;

EXCEPTION
    WHEN OTHERS THEN 
    RAISE_APPLICATION_ERROR(
        -20002,
        "General error in the second trigger (Before Update Trigger)"
    );
END;



//Part 3

//It's the same process as the previous exercise. However, the conditional statement is where we check if the user is not the correct one (JOEMANAGER). If it is not, the trigger is fired, showing an error, indicating that it's not the appropriate user, and therefore the deletion cannot continue.
CREATE OR REPLACE TRIGGER trg_beforeDelete
BEFORE INSERT ON PET_CARE_LOG
FOR EACH ROW
BEGIN
    IF USER != "JOEMANAGER" THEN
        RAISE_APPLICATION_ERROR(
            -20002,
            "It's a different USER"
    );
    END IF;
    
EXCEPTION
    WHEN OTHERS THEN 
    RAISE_APPLICATION_ERROR(
        -20002,
        "General error in the third trigger (Before Delete Trigger)"
    );

END;