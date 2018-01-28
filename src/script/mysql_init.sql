create table BASE_BUILDING
(
	building_id int auto_increment
		primary key,
	building_no varchar(10) not null,
	unit varchar(10) null,
	door_no varchar(10) not null,
	has_lift int default '0' null,
	constraint BASE_BUILDING_building_no_door_no_uindex
		unique (building_no, door_no)
)
comment 'Basic data for building info' engine=InnoDB
;

create table BASE_CAR
(
	plate_no varchar(30) not null
		primary key,
	manufacturer varchar(50) null,
	color varchar(15) null,
	seat int null,
	car_image blob null
)
comment 'Basic data for car info' engine=InnoDB
;

create table BASE_RESIDENT
(
	resident_id int auto_increment
		primary key,
	first_name varchar(50) null,
	last_name varchar(50) null,
	gender varchar(1) null,
	birthday date null,
	email varchar(50) null,
	phone varchar(30) null,
	id_no varchar(20) null,
	resident_type_id int null
)
engine=InnoDB
;

create index BASE_RESIDENT_RESIDENT_TYPE_resident_type_id_fk
	on BASE_RESIDENT (resident_type_id)
;

create table BIZ_BUILDING_ACCOMMODATION
(
	accommdation_id int auto_increment
		primary key,
	is_valid int default '1' null,
	resident_id int null,
	building_id int null,
	create_date date null,
	create_user varchar(50) null,
	modify_date date null,
	modify_user varchar(50) null,
	constraint BIZ_BUILDING_ACCOMMODATION_BASE_BUILDING_building_id_fk
		foreign key (building_id) references BASE_BUILDING (building_id)
)
engine=InnoDB
;

create index BIZ_BUILDING_ACCOMMODATION_RESIDENT_TYPE_resident_type_id_fk
	on BIZ_BUILDING_ACCOMMODATION (resident_id)
;

create index BIZ_BUILDING_ACCOMMODATION_BASE_BUILDING_building_id_fk
	on BIZ_BUILDING_ACCOMMODATION (building_id)
;

create table BIZ_CAR_OWNERSHIP
(
	car_ownership_id int auto_increment
		primary key,
	is_valid int default '1' null,
	resident_id int null,
	plate_no varchar(30) null,
	constraint BIZ_CAR_OWNERSHIP_BASE_RESIDENT_resident_id_fk
		foreign key (resident_id) references BASE_RESIDENT (resident_id),
	constraint BIZ_CAR_OWNERSHIP_BASE_CAR_plate_no_fk
		foreign key (plate_no) references BASE_CAR (plate_no)
)
engine=InnoDB
;

create index BIZ_CAR_OWNERSHIP_BASE_RESIDENT_resident_id_fk
	on BIZ_CAR_OWNERSHIP (resident_id)
;

create index BIZ_CAR_OWNERSHIP_BASE_CAR_plate_no_fk
	on BIZ_CAR_OWNERSHIP (plate_no)
;

create table BIZ_PARKING_REGISTRATION
(
	parking_registration_id int auto_increment
		primary key,
	expired_date date null,
	car_ownership_id int null,
	parking_type_id int null,
	create_date date null,
	create_user varchar(50) null,
	modify_date date null,
	modify_user varchar(50) null,
	constraint BIZ_PARKING_REGISTRATION_BIZ_CAR_OWNERSHIP_car_ownership_id_fk
		foreign key (car_ownership_id) references BIZ_CAR_OWNERSHIP (car_ownership_id)
)
engine=InnoDB
;

create index BIZ_PARKING_REGISTRATION_BIZ_CAR_OWNERSHIP_car_ownership_id_fk
	on BIZ_PARKING_REGISTRATION (car_ownership_id)
;

create index BIZ_PARKING_REGISTRATION_PARKING_TYPE_parking_type_id_fk
	on BIZ_PARKING_REGISTRATION (parking_type_id)
;

create table BIZ_USER
(
	user_code varchar(50) not null
		primary key,
	user_name varchar(100) null,
	password varchar(50) not null,
	is_valid int default '1' null,
	user_type_id int null,
	resident_id int null,
	create_date date null,
	create_user varchar(50) null,
	modify_date date null,
	modify_user varchar(50) null,
	constraint BIZ_USER_BASE_RESIDENT_resident_id_fk
		foreign key (resident_id) references BASE_RESIDENT (resident_id)
)
engine=InnoDB
;

create index BIZ_USER_USER_TYPE_user_type_id_fk
	on BIZ_USER (user_type_id)
;

create index BIZ_USER_BASE_RESIDENT_resident_id_fk
	on BIZ_USER (resident_id)
;

create table PARKING_TYPE
(
	parking_type_id int not null
		primary key,
	parking_type_desc varchar(100) null
)
comment '1-Monthly parking, 2-Permanent parking, 3-Temporary parking' engine=InnoDB
;

alter table BIZ_PARKING_REGISTRATION
	add constraint BIZ_PARKING_REGISTRATION_PARKING_TYPE_parking_type_id_fk
		foreign key (parking_type_id) references PARKING_TYPE (parking_type_id)
;

create table RESIDENT_TYPE
(
	resident_type_id int not null
		primary key,
	resident_type_desc varchar(100) null
)
comment 'The type of a resident. 1-long live 2-short live 3-for rent' engine=InnoDB
;

alter table BASE_RESIDENT
	add constraint BASE_RESIDENT_RESIDENT_TYPE_resident_type_id_fk
		foreign key (resident_type_id) references RESIDENT_TYPE (resident_type_id)
;

alter table BIZ_BUILDING_ACCOMMODATION
	add constraint BIZ_BUILDING_ACCOMMODATION_RESIDENT_TYPE_resident_type_id_fk
		foreign key (resident_id) references RESIDENT_TYPE (resident_type_id)
;

create table USER_TYPE
(
	user_type_id int not null
		primary key,
	user_type_desc varchar(100) null
)
comment '1-Admin, 2-Normal User' engine=InnoDB
;

alter table BIZ_USER
	add constraint BIZ_USER_USER_TYPE_user_type_id_fk
		foreign key (user_type_id) references USER_TYPE (user_type_id)
;