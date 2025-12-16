-- source based on: https://chatgpt.com/share/67f1905a-73b0-8012-ae39-f105fcf0efc4
-- create database from command line:
-- bash start.sh

--
-- create tables
--

-- Create brands table
DROP TABLE IF EXISTS brands;
CREATE TABLE brands (
    id INTEGER PRIMARY KEY,
    name TEXT
);

DROP TABLE IF EXISTS colors;
CREATE TABLE colors (
    id INTEGER PRIMARY KEY,
    name TEXT
);

-- Create products table
DROP TABLE IF EXISTS products;
CREATE TABLE products (
    id INTEGER PRIMARY KEY,
    name TEXT,
    image_link TEXT,
    beschrijving TEXT,
    brand_id INTEGER,
    price REAL,
    FOREIGN KEY (brand_id) REFERENCES brands(id)
);

DROP TABLE IF EXISTS product_color;
CREATE TABLE product_color(
    product_id INTEGER,
    color_id INTEGER,
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (color_id) REFERENCES color(id)
);

--
-- populate tables with data
--

-- Add products
INSERT INTO products (id, name, image_link, beschrijving, brand_id, price) VALUES
    (1, 'Smurfin', 'smurfin.png', 'Dit is de populairste smurf in het dorp.', 1, 9.50),
    (2, 'Muzieksmurf', 'muzieksmurf.png', 'Deze smurf speelt de hele dag smurfenliedjes.', 1, 29.99),
    (3, 'Grote smurf', 'grotesmurf.png', 'Als de smurfen niet weten wat ze moeten doen, dan vragen ze het aan deze smurf.', 2, 10.50),
    (4, 'Knutselsmurf', 'knutselsmurf.png', 'Deze smurf fixt alles wat stuk is.', 2, 14.95),
    (5, 'Klein huis', 'huis.png', 'En standaard smurfenhuis.', 1, 15.50),
    (6, 'Paars huis', 'paarshuis.png', 'Een smurfenhuis met een paars dak.', 1, 15.50),
    (7, 'Groot huis', 'hooghuis.png', 'Een smurfenhuis met twee etages.', 2, 31.00);

-- Add brands
INSERT INTO brands (id, name) VALUES
    (1, 'Smurf Mania'),
    (2, 'Totally Smurf');

-- Add colors
INSERT INTO colors (id, name) VALUES
    (1, 'rood'),
    (2, 'geel'),
    (3, 'blauw'),
    (4, 'paars');

-- Add product_color
INSERT INTO product_color (product_id, color_id) VALUES
    (1,1),
    (1,2),
    (2,1),
    (3,1),
    (4,1),
    (5,1),
    (6,4),
    (7,1);