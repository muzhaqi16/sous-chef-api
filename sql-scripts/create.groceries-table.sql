DROP TYPE IF EXISTS product_category;
CREATE TYPE product_category AS ENUM (
    'Dry Goods',
    'Fruits',
    'Vegetables',
    'Herbs and Spices',
    'Oils and Spices',
    'Frozen',
    'Canned Foods',
    'Jars',
    'Bottles'
);

DROP TYPE IF EXISTS storage_location;
CREATE TYPE storage_location AS ENUM(
    'Freezer',
    'Fridge',
    'Pantry'
);
DROP TYPE IF EXISTS product_unit;
CREATE TYPE product_unit AS ENUM(
    'Jar',
    'Bag',
    'lbs',
    'kg',
    'gallon',
    'pieces',
    'container'
);

CREATE TABLE IF NOT EXISTS groceries (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    name TEXT NOT NULL,
    category product_category NOT NULL,
    location storage_location NOT NULL,
    expiry_reminder BOOLEAN DEFAULT false,
    expiry_date TIMESTAMP DEFAULT now(),
    quantity INTEGER DEFAULT 1 NOT NULL,
    unit product_unit NOT NULL,
    notes text,
    price decimal(12,2) NOT NULL,
    image TEXT,
    user text
);