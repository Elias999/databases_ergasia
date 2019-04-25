ΔΕΙΧΝΕΙ
CREATE OR REPLACE FUNCTION show_ticket_price2(
  a int
)
  RETURNS money AS $result$
  declare
    result money;
  BEGIN
  SELECT price into result
  FROM tickets
  WHERE id = a;
  RETURN result;
  END;
  $result$ LANGUAGE plpgsql;

ΑΛΛΑΖΕΙ ΤΗΝ ΤΙΜΗ ΚΑΙ ΤΟ ΤΥΠΩΝΕΙ
  CREATE OR REPLACE FUNCTION replace_value1(
    a int
  )
  RETURNS money AS $result$
  declare
    result money;
    BEGIN
    update tickets
      set price = 2000
      where id = a;

    SELECT price into result
    FROM tickets
    WHERE id = a;
    RETURN result;
    END;
    $result$ LANGUAGE plpgsql;



  CREATE OR REPLACE FUNCTION replace_value1(
    a int
  )
  RETURNS money AS $result$
  declare
    result money;
    BEGIN
    update tickets
      set price = 2000
      where id = a;

    SELECT price into result
    FROM tickets
    WHERE id = a;
    RETURN result;
    END;
    $result$ LANGUAGE plpgsql;


    CREATE OR REPLACE FUNCTION replace_value_test()
      RETURNS trigger AS
      $$
      BEGIN
      UPDATE tickets
        set price = 2000;
      WHERE OLD.end_date != NEW.end_date;

      RETURN NEW;
      END;
      $$ LANGUAGE plpgsql;
