CREATE TABLE "public.customers" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	CONSTRAINT "customers_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.orders" (
	"id" serial NOT NULL,
	"customerId" TEXT NOT NULL,
	"addressId" integer NOT NULL,
	"status" TEXT NOT NULL,
	"date" TIMESTAMP NOT NULL,
	CONSTRAINT "orders_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.orderProducts" (
	"id" serial NOT NULL,
	"productId" integer NOT NULL,
	"orderId" integer NOT NULL,
	"quantity" integer NOT NULL,
	CONSTRAINT "orderProducts_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"mainImage" TEXT NOT NULL,
	"price" numeric NOT NULL,
	"size" TEXT NOT NULL,
	"categoryId" integer NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.addresses" (
	"id" serial NOT NULL,
	"customerId" integer NOT NULL,
	"street" TEXT NOT NULL,
	"number" integer NOT NULL,
	"complement" TEXT NOT NULL,
	CONSTRAINT "addresses_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.othersImages" (
	"id" serial NOT NULL,
	"productId" integer NOT NULL,
	"urlImage" TEXT,
	CONSTRAINT "othersImages_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.category" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "category_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "orders" ADD CONSTRAINT "orders_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");
ALTER TABLE "orders" ADD CONSTRAINT "orders_fk1" FOREIGN KEY ("addressId") REFERENCES "addresses"("id");

ALTER TABLE "orderProducts" ADD CONSTRAINT "orderProducts_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");
ALTER TABLE "orderProducts" ADD CONSTRAINT "orderProducts_fk1" FOREIGN KEY ("orderId") REFERENCES "orders"("id");

ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("categoryId") REFERENCES "category"("id");

ALTER TABLE "addresses" ADD CONSTRAINT "addresses_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");

ALTER TABLE "othersImages" ADD CONSTRAINT "othersImages_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");









