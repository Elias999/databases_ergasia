    CREATE OR REPLACE FUNCTION replace_value()
            RETURNS trigger AS
            $$
            BEGIN
              UPDATE tickets
                set price = CASE
                              WHEN OLD.end_date < NEW.end_date THEN  price + 30 * price / 100
                              ELSE  price - 30 * price / 100
                            END
                WHERE OLD.end_date != NEW.end_date;
              RETURN NEW;
            END;
            $$ LANGUAGE plpgsql;



        CREATE TRIGGER enimerwsi_timis
          AFTER UPDATE OF end_date on tickets
          FOR EACH ROW
          EXECUTE PROCEDURE replace_value();
