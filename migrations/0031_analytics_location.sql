CREATE TABLE IF NOT EXISTS analytics_location (day TEXT NOT NULL, country TEXT NOT NULL, city TEXT NOT NULL, visits INTEGER NOT NULL DEFAULT 0, PRIMARY KEY(day, country, city));
