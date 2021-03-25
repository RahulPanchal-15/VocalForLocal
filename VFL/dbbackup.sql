BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "main_customer" (
	"id"	integer NOT NULL,
	"name"	varchar(100),
	"phone"	varchar(10),
	"email"	varchar(50),
	"state"	varchar(20),
	"postal_code"	integer,
	"city"	varchar(20),
	"address"	varchar(100),
	"business_name"	varchar(50),
	"date_created"	datetime,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "main_post" (
	"p_id"	integer NOT NULL,
	"name"	varchar(50),
	"description"	varchar(1000),
	"photo"	varchar(100),
	"date_created"	datetime,
	"category"	varchar(100),
	"availability"	varchar(20),
	"location"	varchar(50),
	"owner_id"	integer,
	FOREIGN KEY("owner_id") REFERENCES "main_customer"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("p_id")
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "django_migrations" VALUES (1,'contenttypes','0001_initial','2021-03-15 17:34:45.112153');
INSERT INTO "django_migrations" VALUES (2,'auth','0001_initial','2021-03-15 17:34:45.257899');
INSERT INTO "django_migrations" VALUES (3,'admin','0001_initial','2021-03-15 17:34:45.465284');
INSERT INTO "django_migrations" VALUES (4,'admin','0002_logentry_remove_auto_add','2021-03-15 17:34:45.667383');
INSERT INTO "django_migrations" VALUES (5,'admin','0003_logentry_add_action_flag_choices','2021-03-15 17:34:46.152314');
INSERT INTO "django_migrations" VALUES (6,'contenttypes','0002_remove_content_type_name','2021-03-15 17:34:46.467791');
INSERT INTO "django_migrations" VALUES (7,'auth','0002_alter_permission_name_max_length','2021-03-15 17:34:47.036463');
INSERT INTO "django_migrations" VALUES (8,'auth','0003_alter_user_email_max_length','2021-03-15 17:34:47.424063');
INSERT INTO "django_migrations" VALUES (9,'auth','0004_alter_user_username_opts','2021-03-15 17:34:47.665897');
INSERT INTO "django_migrations" VALUES (10,'auth','0005_alter_user_last_login_null','2021-03-15 17:34:47.942642');
INSERT INTO "django_migrations" VALUES (11,'auth','0006_require_contenttypes_0002','2021-03-15 17:34:48.089038');
INSERT INTO "django_migrations" VALUES (12,'auth','0007_alter_validators_add_error_messages','2021-03-15 17:34:48.222356');
INSERT INTO "django_migrations" VALUES (13,'auth','0008_alter_user_username_max_length','2021-03-15 17:34:48.394023');
INSERT INTO "django_migrations" VALUES (14,'auth','0009_alter_user_last_name_max_length','2021-03-15 17:34:48.581690');
INSERT INTO "django_migrations" VALUES (15,'auth','0010_alter_group_name_max_length','2021-03-15 17:34:48.759839');
INSERT INTO "django_migrations" VALUES (16,'auth','0011_update_proxy_permissions','2021-03-15 17:34:49.040516');
INSERT INTO "django_migrations" VALUES (17,'main','0001_initial','2021-03-15 17:34:49.168066');
INSERT INTO "django_migrations" VALUES (18,'sessions','0001_initial','2021-03-15 17:34:49.466142');
INSERT INTO "django_migrations" VALUES (19,'auth','0012_alter_user_first_name_max_length','2021-03-17 17:18:39.770149');
INSERT INTO "django_admin_log" VALUES (1,'2021-03-20 11:22:37.265904','2','xyz','',7,4,3);
INSERT INTO "django_admin_log" VALUES (2,'2021-03-25 04:08:15.525462','3','012','',4,4,3);
INSERT INTO "django_admin_log" VALUES (3,'2021-03-25 04:08:15.776229','2','1911097','',4,4,3);
INSERT INTO "django_content_type" VALUES (1,'admin','logentry');
INSERT INTO "django_content_type" VALUES (2,'auth','permission');
INSERT INTO "django_content_type" VALUES (3,'auth','group');
INSERT INTO "django_content_type" VALUES (4,'auth','user');
INSERT INTO "django_content_type" VALUES (5,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES (6,'sessions','session');
INSERT INTO "django_content_type" VALUES (7,'main','customer');
INSERT INTO "django_content_type" VALUES (8,'main','post');
INSERT INTO "auth_permission" VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES (4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES (5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES (6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES (7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES (8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES (9,3,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES (10,3,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES (11,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES (12,3,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES (13,4,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES (14,4,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES (15,4,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES (16,4,'view_user','Can view user');
INSERT INTO "auth_permission" VALUES (17,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES (18,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES (19,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES (20,5,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES (21,6,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES (22,6,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES (23,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES (24,6,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES (25,7,'add_customer','Can add customer');
INSERT INTO "auth_permission" VALUES (26,7,'change_customer','Can change customer');
INSERT INTO "auth_permission" VALUES (27,7,'delete_customer','Can delete customer');
INSERT INTO "auth_permission" VALUES (28,7,'view_customer','Can view customer');
INSERT INTO "auth_permission" VALUES (29,8,'add_post','Can add post');
INSERT INTO "auth_permission" VALUES (30,8,'change_post','Can change post');
INSERT INTO "auth_permission" VALUES (31,8,'delete_post','Can delete post');
INSERT INTO "auth_permission" VALUES (32,8,'view_post','Can view post');
INSERT INTO "main_customer" VALUES (1,'Rahul Panchal','4668542152','rp@gmail.com','Gujarat',765213,'Ahmedabad','Titanium square, MG road','@home designs','2021-03-25 04:44:02.769379');
INSERT INTO "main_customer" VALUES (4,'Aditya m','3947203425','adityamalwade491@gmail.com','Goa',341431,'Panjim','North Goa','The Food store','2021-03-25 04:58:04.358168');
INSERT INTO "main_customer" VALUES (5,'Aditya Malwade','3947203425','adityamalwade491@gmail.com','Maharashtra',400081,'Mumbai','Mulund east','baggit','2021-03-25 04:13:34.214466');
INSERT INTO "main_customer" VALUES (6,'Aayush Malde','3298468751','aayushm@gmail.com','Karnataka',653331,'Bangalore','Electronic city, ring road','Shirts.co','2021-03-25 04:33:08.289490');
INSERT INTO "main_customer" VALUES (7,'abc','3255231324','abc@gmail.com','Rajasthan',325212,'Jaipur','Achrol, gopinath marg','abc solutions','2021-03-25 04:51:32.816868');
INSERT INTO "main_customer" VALUES (8,'pqr','3255251253','pqr@gmail.com','Madhya Pradesh',765123,'Bhopal','Jinsi square, bhopal','Donut-land','2021-03-25 05:09:38.145693');
INSERT INTO "main_customer" VALUES (9,'xyz','7832313453','xyz@gmail.com','Kerala',764512,'Munnar','Idukki, kerala','The Coffee yard','2021-03-25 05:14:09.768894');
INSERT INTO "main_post" VALUES (1,'Laptop bag','Laptop bag with 30L carrying capacity, comes in multiple colors with 1yr warranty','images/product7.PNG','2021-03-25 04:16:25.558837','Accessories','Span-India','Maharashtra',5);
INSERT INTO "main_post" VALUES (2,'Stainless steel bottle','Sturdy minimalistic bottle with 1L capacity, comes in off white and charcoal black color.','images/product13_CJ8Dozi.PNG','2021-03-25 04:24:58.708462','Accessories','Global','Maharashtra',5);
INSERT INTO "main_post" VALUES (3,'Baseball Jersey','Baltimore baseball team jersey','images/prouct10.PNG','2021-03-25 04:34:38.585919','Clothing','Span-India','Karnataka',6);
INSERT INTO "main_post" VALUES (4,'Sports Shoes','Low weight sports shoes with comfortable sole and long lasting material','images/product14.PNG','2021-03-25 04:40:22.226670','Clothing','Span-India','Karnataka',6);
INSERT INTO "main_post" VALUES (5,'Couch','A comfy chair for 1 with pillow.
Color: teal','images/product4.PNG','2021-03-25 04:46:22.375836','Home Decor','Local','Gujarat',1);
INSERT INTO "main_post" VALUES (6,'Curtains','Window curtains that give airy feel to the room (145*300 cm)','images/product12.jpeg','2021-03-25 04:48:36.118314','Home Decor','Global','Gujarat',1);
INSERT INTO "main_post" VALUES (7,'Woven vase','Weaved Vase, a perfect handicraft item for your counter top','images/product8.PNG','2021-03-25 04:52:53.559827','Handicraft','Global','Rajasthan',7);
INSERT INTO "main_post" VALUES (8,'Toy plane','Wooden toy plane made out of 100% teak wood','images/product3.PNG','2021-03-25 04:54:41.998308','Handicraft','Local','Rajasthan',7);
INSERT INTO "main_post" VALUES (9,'Homemade Cookies','Low calorie cookies with 4 flavours','images/product11.PNG','2021-03-25 05:02:07.935831','Food Items','Span-India','Goa',4);
INSERT INTO "main_post" VALUES (10,'Protein bar','fssai certified protein bar with 7.3g protein content (coconut flavour)','images/product9.png','2021-03-25 05:05:04.522948','Food Items','Global','Goa',4);
INSERT INTO "main_post" VALUES (11,'Donuts','Tasty donut with cream and sprinkles','images/product10.PNG','2021-03-25 05:11:11.872283','Food Items','Local','Madhya Pradesh',8);
INSERT INTO "main_post" VALUES (12,'Coffee beans','Flavour rich coffee beans straight from coffee plantations','images/product5.PNG','2021-03-25 05:15:27.471226','Others','Global','Kerala',9);
INSERT INTO "django_session" VALUES ('j3ilq9adqqq0ypx5p4cim1u6345x129b','ZWE4NmMxOGQwNDliY2MwMmM2ZjZjZjE3MWVmNGY4ZDI1NGM1NDQxODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MGU1ZTZjMGE4NmVhZDZhMTI4Mjg2NDgxNWM5YTAyYzM2ZGEyYzM5In0=','2021-03-29 18:51:45.991375');
INSERT INTO "django_session" VALUES ('pnl4t5hvv0rdbg7h30a72rcv3z5s1xf8','YzE5YTFhOWY4ZWQwZTM2NDA5YTJmZjBjNjdhNWFiZjQ3OTAzMWUyMjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkMjBmMzhlNzEyM2YyNDRlYTUyNGNlNjRiMjUzOGExMGVjNDcxZDExIn0=','2021-03-29 19:02:47.799110');
INSERT INTO "django_session" VALUES ('aw44nqugqi5itcxa76mxone6algy05zj','.eJxVjDsOwjAQBe_iGlnr-JdQ0nMGy7v24gCypTipEHeHSCmgfTPzXiLEbS1h63kJcxJnYcTpd8NIj1x3kO6x3pqkVtdlRrkr8qBdXlvKz8vh_h2U2Mu3phF4jGpwljhpxQiokR2byVr2bL1ijy6ngQBgIiKnlVbegIeIibJ4fwD21ThV:1lNuY5:AhWLn5WQbpTZ_DKap7NsxahGhhnCgcEFsMHmsPckMO8','2021-04-04 09:39:05.709753');
INSERT INTO "auth_user" VALUES (1,'pbkdf2_sha256$216000$jnVpynD82ghB$TUCHF0CAtMQtixMDmh7RyhaBzjOEwmp1DLHBj7nAZ4Q=','2021-03-25 04:55:16.693453',1,'panchal','','r@gmail.com',1,1,'2021-03-15 17:36:04.128560','');
INSERT INTO "auth_user" VALUES (4,'pbkdf2_sha256$216000$hrVFhZqrPOPp$86dO+SvZBbQm0+g38h8nB7YlTufBN1LkLNKCzlOz0xc=','2021-03-25 04:55:33.672701',1,'adityam','','aditya@gmail.com',1,1,'2021-03-16 16:57:17.099394','');
INSERT INTO "auth_user" VALUES (5,'pbkdf2_sha256$216000$yT9F2B6lRwt9$KNydtUYOYDWrYVH6DI1/edRm7cvnZSwH0hJYDUFwqXI=','2021-03-25 04:22:41.016257',0,'AdityaM','','adityamalwade491@gmail.com',0,1,'2021-03-25 04:10:58.165159','');
INSERT INTO "auth_user" VALUES (6,'pbkdf2_sha256$216000$Pj0XWdcv8JZN$wHbFCf5MzkXuuU4fJMamarp4ZuDglPx0e4GRM5jTv7o=','2021-03-25 04:29:25.800190',0,'aayushM','','aayushm@gmail.com',0,1,'2021-03-25 04:28:56.618474','');
INSERT INTO "auth_user" VALUES (7,'pbkdf2_sha256$216000$ADYiWs8MmJ5w$WUT9capW33s8x37RbcjYI00YSw2sGPOpkEqi8S+4auc=','2021-03-25 04:50:15.080864',0,'abc','','abc@gmail.com',0,1,'2021-03-25 04:49:54.067696','');
INSERT INTO "auth_user" VALUES (8,'pbkdf2_sha256$216000$Km2bnBEANe4N$9B4+O8jOHGlHftgS1pPfDm0e1nrX14+LbyZ2qjswPY8=','2021-03-25 05:07:20.837399',0,'pqr','','pqr@gmail.com',0,1,'2021-03-25 05:06:12.197140','');
INSERT INTO "auth_user" VALUES (9,'pbkdf2_sha256$216000$iDIAtcHFKAwY$TACMfhJA/9JI4X9y/lbYgQX8bonO2OIxHIzQoHgP68E=','2021-03-25 05:12:54.231576',0,'xyz','','xyz@gmail.com',0,1,'2021-03-25 05:12:34.948559','');
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "main_post_owner_id_882a5722" ON "main_post" (
	"owner_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
COMMIT;
