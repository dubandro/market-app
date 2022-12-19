create table categories
(
    id    bigserial primary key,
    title varchar(255)
);
insert into categories (title)
values
    ('Food-1')
    ('Food-2')
    ('Food-3');

create table products
(
    id          bigserial primary key,
    title       varchar(255),
    price       int,
    category_id bigint references categories (id)
);
insert into products (title, price, category_id)
values
    ('milk', 80, 1),
    ('bread', 50, 1),
    ('cheese', 190, 1),
    ('meat', 250, 2),
    ('eggs', 90, 1),
    ('oil', 150, 2);

create table users
(
    id         bigserial primary key,
    username   varchar(30) not null,
    password   varchar(80) not null,
    email      varchar(50) unique,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp
);
insert into users (username, password, email)
values
    ('user', '$2a$04$Fx/SX9.BAvtPlMyIIqqFx.hLY2Xp8nnhpzvEEVINvVpwIPbA3v/.i', 'bob_johnson@gmail.com'),
    ('admin', '$2a$04$Fx/SX9.BAvtPlMyIIqqFx.hLY2Xp8nnhpzvEEVINvVpwIPbA3v/.i', 'john_johnson@gmail.com');

create table roles
(
    id         bigserial primary key,
    name       varchar(50) not null,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp
);
insert into roles (name)
values
    ('ROLE_USER'),
    ('ROLE_ADMIN');

create table users_roles
(
    user_id bigint not null references users (id),
    role_id bigint not null references roles (id),
    primary key (user_id, role_id)
);
insert into users_roles (user_id, role_id)
values
    (1, 1),
    (2, 2);