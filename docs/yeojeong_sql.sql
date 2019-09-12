create database yeojeong;
use yeojeong;


-- TABLE

-- 멤버 테이블
create table member(
   member_id varchar(20) primary key,
    password varchar(20),
    name varchar(30) not null,
    gender int not null,
    birth date not null,
    tel varchar(20) not null,
    email varchar(50),
    regist_date timestamp not null,
    level int not null
);

-- 여행 등록 테이블
create table travel_regist(
   travel_id int auto_increment primary key,
    member_id varchar(20),
    help_tel varchar(20),
    start_date timestamp not null,
    end_date timestamp not null,
    country varchar(20) not null,
    city varchar(20) not null,
    
    foreign key (member_id) references member (member_id)
);

-- 같이갈래 게시판 테이블
create table withme_article(
   article_id int auto_increment primary key,
    member_id varchar(20),
   country varchar(20) not null,
    city varchar(20) not null,
    start_date timestamp not null,
    end_date timestamp not null,
    category_gender int not null,
    category_age int not null,
    category_style int not null,
    write_time timestamp not null,
    travel_id int,
    
    foreign key (member_id) references member (member_id),
   foreign key (travel_id) references travel_regist (travel_id)
);

-- 같이갈래 게시판 요청 테이블
create table withme_request(
   request_id int auto_increment primary key,
    sender_id varchar(20),
    receiver_id varchar(20),
    statue varchar(20),
    country varchar(20) not null,
    city varchar(20) not null,
    start_date timestamp not null,
    end_date timestamp not null,
    write_time timestamp not null,
    
    foreign key (sender_id) references member (member_id),
    foreign key (receiver_id) references member (member_id)
);

-- 후기 게시판 테이블
create table review_article(
   article_id int auto_increment primary key,
    member_id varchar(20),
   country varchar(20) not null,
    city varchar(20) not null,
    content varchar(1000) not null,
    image_src varchar(1000),
    review_star int,
    write_time timestamp not null,
    read_count int not null,
    like_count int not null,
    foreign key (member_id) references member (member_id)
);

-- 후기 게시판 댓글 테이블
create table review_comment(
   comment_id int auto_increment primary key,
    member_id varchar(20),
    article_id int,
    content varchar(1000) not null,
    write_time timestamp not null,
    
   foreign key (member_id) references member (member_id),
    foreign key (article_id) references review_article (article_id) on delete cascade
);


-- 좋아요 테이블
create table like_thumb(
   article_id int,
    member_id varchar(20),
    
    primary key (article_id, member_id),
    foreign key (article_id) references review_article (article_id),
    foreign key (member_id) references member (member_id)
);

-- 쪽지 테이블
create table message(
   message_id int auto_increment primary key,
    sender_id varchar(20),
    receiver_id varchar(20),
    content varchar(1000) not null,
    send_time timestamp not null,
    receive_time timestamp,
    
    foreign key (sender_id) references member (member_id),
    foreign key (receiver_id) references member (member_id)
);

-- 여행지 데이터 테이블
create table city_data(
   city_code int auto_increment primary key,
   country varchar(20) not null,
    city varchar(20) not null,
    local_time varchar(20) not null,
    flight_time varchar(20) not null,
    local_voltage varchar(20) not null,
    visa varchar(20) not null,
    latitude varchar(20) not null,
    longitude varchar(20) not null,
    danger_level int not null,
    image_src varchar(1000) not null,
    image_src2 varchar(1000) not null,
    image_src3 varchar(1000) not null
    );





-- 여행 종료 테이블
create table travel_end(
   travel_id int primary key,
    member_id varchar(20),
    help_tel varchar(20),
    start_date timestamp not null,
    end_date timestamp not null,
    country varchar(20) not null,
    city varchar(20) not null
);

-- 같이갈래 요청 중복확인 테이블
create table withme_requestduple(
   member_id varchar(20),
   article_id int,
    request_id int,
    primary key(member_id, article_id)
);



-- VIEW

-- 같이갈래 게시판 뷰
create view withme_view
as
select a.article_id, a.member_id, a.country, a.city, a.start_date, a.end_date, a.category_gender,a.category_age,a.category_style, a.write_time, a.travel_id, m.name
from
withme_article a inner join member m
on a.member_id = m.member_id;


-- 후기 게시판 뷰
create view review_view
as
select a.article_id, a.member_id, a.country, a.city, a.content, a.image_src, a.review_star, a.write_time, a.read_count, m.name, count(c.comment_id) as "comment_count", a.like_count
from
review_article a inner join member m
on a.member_id = m.member_id
left outer join review_comment c
on a.article_id = c.article_id
group by a.article_id;


-- —————————————————————————————————
