CREATE TABLE "categories" (
  "category_id" serial PRIMARY KEY,
  "category_name" varchar(255) NOT NULL,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL
);

CREATE TABLE "customers" (
  "customer_id" serial PRIMARY KEY,
  "full_name" varchar(255) NOT NULL,
  "email" varchar(255) UNIQUE NOT NULL,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL
);

CREATE TABLE "products" (
  "product_id" serial PRIMARY KEY,
  "category_id" int NOT NULL,
  "product_name" varchar(255) NOT NULL,
  "unit_price" numeric(12,2) NOT NULL,
  "cost_price" numeric(12,2) NOT NULL,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL
);

CREATE TABLE "order_status" (
  "status_id" serial PRIMARY KEY,
  "status_code" varchar(50) UNIQUE NOT NULL,
  "description" text,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL
);

CREATE TABLE "orders" (
  "order_id" serial PRIMARY KEY,
  "customer_id" int NOT NULL,
  "status_id" int NOT NULL,
  "order_date" timestamp NOT NULL,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL
);

CREATE TABLE "order_items" (
  "order_item_id" serial PRIMARY KEY,
  "order_id" int NOT NULL,
  "product_id" int NOT NULL,
  "quantity" int NOT NULL,
  "unit_price" numeric(12,2) NOT NULL,
  "discount" numeric(12,2) NOT NULL,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL
);

CREATE TABLE "payments" (
  "payment_id" serial PRIMARY KEY,
  "order_id" int NOT NULL,
  "payment_date" timestamp NOT NULL,
  "amount" numeric(12,2) NOT NULL,
  "payment_status" varchar(50) NOT NULL,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL
);

ALTER TABLE "products" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("category_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "orders" ADD FOREIGN KEY ("customer_id") REFERENCES "customers" ("customer_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "orders" ADD FOREIGN KEY ("status_id") REFERENCES "order_status" ("status_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "order_items" ADD FOREIGN KEY ("order_id") REFERENCES "orders" ("order_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "order_items" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("product_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "payments" ADD FOREIGN KEY ("order_id") REFERENCES "orders" ("order_id") DEFERRABLE INITIALLY IMMEDIATE;
