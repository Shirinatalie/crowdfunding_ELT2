-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/pMD31y
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Category" (
    "category_id" varchar   NOT NULL,
    "category" varchar   NOT NULL,
    CONSTRAINT "pk_Category" PRIMARY KEY (
        "category_id"
     )
);
Select *
From "Category"
CREATE TABLE "Subcategory" (
    "subcategory_id" varchar   NOT NULL,
    "subcategory" varchar   NOT NULL,
    CONSTRAINT "pk_Subcategory" PRIMARY KEY (
        "subcategory_id"
     )
);
Select *
From "Subcategory"

CREATE TABLE "Campaign" (
    "cf_id" int   NOT NULL,
    "contact_id" int   NOT NULL,
    "company_name" varchar   NOT NULL,
    "description" varchar   NOT NULL,
    "goal" float   NOT NULL,
    "pledged" float   NOT NULL,
    "outcome" varchar   NOT NULL,
    "backers_count" int   NOT NULL,
    "country" varchar   NOT NULL,
    "currency" varchar   NOT NULL,
    "launched_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    "category_id" varchar   NOT NULL,
    "subcategory-id" varchar   NOT NULL,
    CONSTRAINT "pk_Campaign" PRIMARY KEY (
        "cf_id"
     )
);
Select *
From "Campaign"
CREATE TABLE "Contact" (
    "contact_id" int   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "email" varchar   NOT NULL,
    CONSTRAINT "pk_Contact" PRIMARY KEY (
        "contact_id"
     )
);
Select *
From "Contact";
ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign__contact_id" FOREIGN KEY("contact_id")
REFERENCES "Contact" ("contact_id");

ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign__category_id" FOREIGN KEY("category_id")
REFERENCES "Category" ("category_id");

ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign__subcategory-id" FOREIGN KEY("subcategory-id")
REFERENCES "Subcategory" ("subcategory_id");
COPY "Category"
FROM 'C:/Users/tutuw/Desktop/Boot_camp/ETL_Final/crowdfunding_ELT2/Resources/Category.csv'
DELIMITER '|'
CSV HEADER;
FROM 'C:/Users/tutuw/Desktop/Boot_camp/ETL_Final/crowdfunding_ELT2/Resources/Subcategory.csv'
DELIMITER '|'
CSV HEADER;
FROM 'C:/Users/tutuw/Desktop/Boot_camp/ETL_Final/crowdfunding_ELT2/Resources/Campaign.csv'
DELIMITER '|'
CSV HEADER;
FROM 'C:/Users/tutuw/Desktop/Boot_camp/ETL_Final/crowdfunding_ELT2/Resources/Contact.csv'
DELIMITER '|'
CSV HEADER;
