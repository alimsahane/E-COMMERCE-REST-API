alter table if exists order_item drop constraint if exists FKc5uhmwioq5kscilyuchp4w49o;
alter table if exists orders drop constraint if exists FK32ql8ubntj5uh44ph9659tiih;
alter table if exists orders_items drop constraint if exists FKl3w3fx5rbjq0tbb2i0xidwabh;
alter table if exists orders_items drop constraint if exists FKij1wwgx6o198ubsx1oulpopem;
alter table if exists shopping_cart_items drop constraint if exists FKgbo9dbc0drcea1m4u8112oxip;
alter table if exists shopping_carts drop constraint if exists FK3iw2988ea60alsp0gnvvyt744;
alter table if exists shopping_carts_items drop constraint if exists FKd3l0v2cftcgeseaclfbxjinqp;
alter table if exists shopping_carts_items drop constraint if exists FKoxb1bj32wo57vtj7deplemuk6;
drop table if exists event_publication cascade;
drop table if exists order_item cascade;
drop table if exists orders cascade;
drop table if exists orders_items cascade;
drop table if exists products cascade;
drop table if exists shopping_cart_items cascade;
drop table if exists shopping_carts cascade;
drop table if exists shopping_carts_items cascade;
drop table if exists users cascade;
create table event_publication (completion_date timestamp(6) with time zone, publication_date timestamp(6) with time zone, id uuid not null, event_type varchar(255), listener_id varchar(255), serialized_event varchar(255), primary key (id));
create table order_item (price float(53), quantity integer not null, id bigserial not null, product_id bigint, primary key (id));
create table orders (total_price float(53), id bigserial not null, order_date timestamp(6), user_id bigint, status varchar(255), primary key (id));
create table orders_items (items_id bigint not null unique, order_id bigint not null);
create table products (price float(53), quantity integer, id bigserial not null, description varchar(255), name varchar(255), primary key (id));
create table shopping_cart_items (quantity integer not null, id bigserial not null, product_id bigint, primary key (id));
create table shopping_carts (id bigserial not null, user_id bigint unique, primary key (id));
create table shopping_carts_items (items_id bigint not null unique, shopping_cart_id bigint not null);
create table users (id bigserial not null, email varchar(255), name varchar(255), password varchar(255), salt varchar(255), primary key (id));
alter table if exists order_item add constraint FKc5uhmwioq5kscilyuchp4w49o foreign key (product_id) references products;
alter table if exists orders add constraint FK32ql8ubntj5uh44ph9659tiih foreign key (user_id) references users;
alter table if exists orders_items add constraint FKl3w3fx5rbjq0tbb2i0xidwabh foreign key (items_id) references order_item;
alter table if exists orders_items add constraint FKij1wwgx6o198ubsx1oulpopem foreign key (order_id) references orders;
alter table if exists shopping_cart_items add constraint FKgbo9dbc0drcea1m4u8112oxip foreign key (product_id) references products;
alter table if exists shopping_carts add constraint FK3iw2988ea60alsp0gnvvyt744 foreign key (user_id) references users;
alter table if exists shopping_carts_items add constraint FKd3l0v2cftcgeseaclfbxjinqp foreign key (items_id) references shopping_cart_items;
alter table if exists shopping_carts_items add constraint FKoxb1bj32wo57vtj7deplemuk6 foreign key (shopping_cart_id) references shopping_carts;