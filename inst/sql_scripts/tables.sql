
CREATE TABLE guests (
  id integer,
  first_name varchar(20),
  last_name varchar(20),
  dietary_requirements varchar(100),
  billing_group integer NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (billing_group) REFERENCES billing_groups(id)
);

CREATE TABLE billing_groups (
  id integer,
  name varchar(30),
  bill_contact_first varchar(20),
  bill_contact_last varchar(20),
  bill_address_1 varchar(20),
  bill_address_2 varchar(20),
  bill_address_3 varchar(20),
  bill_address_4 varchar(20),
  bill_address_5 varchar(20),
  PRIMARY KEY (id)
);

CREATE TABLE starters (
  id integer,
  name varchar(100),
  decription varchar(100),
  PRIMARY KEY (id)
);

CREATE TABLE mains (
  id integer,
  name varchar(100),
  decription varchar(100),
  PRIMARY KEY (id)
);

CREATE TABLE desserts (
  id integer,
  name varchar(100),
  decription varchar(100),
  PRIMARY KEY (id)
);

CREATE TABLE dinnertables (
  id integer,
  table_name varchar(40),
  PRIMARY KEY (id)
);

CREATE TABLE wines (
  id integer,
  name varchar (40),
  winetype integer,
  unitcost decimal(5, 2),
  PRIMARY KEY (id),
  FOREIGN KEY (winetype) REFERENCES wintypes(id)
);

CREATE TABLE wintypes (
  id integer,
  winetype varchar(5)
);

CREATE TABLE wine_orders (
  id integer,
  order_table integer,
  billed_to integer,
  wine integer,
  PRIMARY KEY (id),
  FOREIGN KEY (order_table) REFERENCES dinnertables(id),
  FOREIGN KEY (billed_to) REFERENCES billing_groups(id),
  FOREIGN KEY (wine) REFERENCES wines(id)
);


CREATE TABLE food_orders (
  id integer,
  guest integer,
  starter integer,
  main integer,
  dessert integer,
  sits_on integer,
  PRIMARY KEY (id)
  FOREIGN KEY (guest) REFERENCES guests(id),
  FOREIGN KEY (starter) REFERENCES starters(id),
  FOREIGN KEY (main) REFERENCES mains(id)
  FOREIGN KEY (dessert) REFERENCES desserts(id)
  FOREIGN KEY (sits_on) REFERENCES dinnertables(id)
);
