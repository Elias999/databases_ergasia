CREATE TABLE IF NOT EXISTS companies
(
  afm INT UNIQUE NOT NULL,
  name VARCHAR (150) NOT NULL,
  joined_date DATE,
  PRIMARY KEY (afm)
);



CREATE TABLE IF NOT EXISTS tickets
(
  id SERIAL NOT NULL,
  procurer INTEGER REFERENCES companies(afm) ,
  type VARCHAR (15) NOT NULL,
  location VARCHAR (150) NOT NULL,
  price MONEY NOT NULL,
  genre VARCHAR (15) NOT NULL,
  start_date DATE,
  end_date DATE,
  opening TIME,
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS customers
(
    afm INT UNIQUE NOT NULL,
    name VARCHAR (30) NOT NULL,
    phone BIGINT,
    email VARCHAR(320) UNIQUE NOT NULL,
    cc_number BIGINT NOT NULL,
    age SMALLINT,
    PRIMARY KEY (afm)
);


CREATE TABLE IF NOT EXISTS transactions
(
  id SERIAL NOT NULL,
  tickets_id INTEGER REFERENCES tickets(id) ,
  customer_id INTEGER REFERENCES customers(afm) ,
  conf_date DATE,
  state smallint not null,
  PRIMARY KEY (id)
);
