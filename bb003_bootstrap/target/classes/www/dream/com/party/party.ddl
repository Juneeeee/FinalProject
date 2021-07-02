drop table s_contact_point;
drop table s_contact_point_type;
drop table s_party;
drop table s_party_type;

select * from table;

--Sequence
drop SEQUENCE seq_party_id;
CREATE SEQUENCE seq_party_id START WITH -990000000 MINVALUE -990000000;

create table s_party_type(
    party_type      char(10),
    description     varchar2(100)
);

insert into s_party_type(party_type, description)
    values('Admin', '관리자');
insert into s_party_type(party_type, description)
    values('Manager', '운영자');
insert into s_party_type(party_type, description)
    values('User', '사용자');


-- user_id, user_password, name, birth_dt, sex, enabled, reg_dt, upt_dt, descrim
create table s_party(
    user_id         varchar2(10)    primary key,
    user_password   varchar2(100)   not null,   --100 : 암호화된 결과물까지 고려함
    name            varchar2(100)   not null,   --100 : 전지구적인 사람의 이름 길이까지 고려함
    birth_dt        Date,                       --생년월일
    sex             char(1)         default 1 not null, --true male, false female
    enabled         char(1)         default 1,
    reg_dt          timestamp       default sysdate not null, --등록시점
    upt_dt          timestamp       default sysdate not null, --수정
    descrim         varchar2(10)    not null
    --Admin 용 속성
    --Manager용 속성
    --User 용 속성
);

--Admin
insert into s_party(user_id, user_password, name, birth_dt, sex, enabled, descrim)
	values('Admin', '1234', '김회장', '1999-01-30', '1', '1', 'Admin');

--Manager
insert into s_party(user_id, user_password, name, birth_dt, sex, enabled, descrim)
	values('Manager1', '1234', '이회장', '2010-01-30', '0', '1', 'Manager');
insert into s_party(user_id, user_password, name, birth_dt, sex, enabled, descrim)
	values('Manager2', '1234', '방회장', '2005-01-30', '1', '1', 'Manager');

--User
insert into s_party(user_id, user_password, name, birth_dt, sex, enabled, descrim)
	values('hong', '1234', '홍길동', '2005-01-30', '1', '1', 'User');
insert into s_party(user_id, user_password, name, birth_dt, sex, enabled, descrim)
	values('lee', '1234', '이순신', '2005-01-30', '0', '1', 'User');
insert into s_party(user_id, user_password, name, birth_dt, sex, enabled, descrim)
	values('ghost', '1234', '고스트', '2005-01-30', '0', '0', 'User');

--연락처(주소지) 식별 : 각 행위자별 여러 연락처 정보 관리 / contact_point_type, description
create table s_contact_point_type(
    contact_point_type      char(10),
    description     		varchar2(100)
);

insert into s_contact_point_type(contact_point_type, description)
	values('address', '주소지');
insert into s_contact_point_type(contact_point_type, description)
	values('phoneNum', '주소지 전화 번호');
insert into s_contact_point_type(contact_point_type, description)
	values('mobileNum', '핸드폰 번호');

--연락처(주소지) : user_id, contact_point_type, info
--회원 탈퇴 시 연락처 정보는 실제 삭제 처리.
create table s_contact_point(
	user_id					varchar2(10),
	contact_point_type		char(10),
	info					varchar2(50),
	reg_dt          timestamp       default sysdate not null, --등록시점
    upt_dt          timestamp       default sysdate not null, --수정
	primary key (user_id, contact_point_type),
	CONSTRAINT fk_cp_party	foreign key(user_id) references s_party(user_id)
);

insert into s_contact_point(user_id, contact_point_type, info)
	values('Admin', 'address', '금천구 가산동');
insert into s_contact_point(user_id, contact_point_type, info)
	values('Admin', 'phoneNum', '02-123-4567');
insert into s_contact_point(user_id, contact_point_type, info)
	values('Admin', 'mobileNum', '010-1234-5678');

insert into s_contact_point(user_id, contact_point_type, info)
	values('Manager1', 'address', '금천구 가산동');
insert into s_contact_point(user_id, contact_point_type, info)
	values('Manager1', 'phoneNum', '02-234-5678');
insert into s_contact_point(user_id, contact_point_type, info)
	values('Manager1', 'mobileNum', '010-2345-6789');

insert into s_contact_point(user_id, contact_point_type, info)
	values('Manager2', 'address', '금천구 가산동');
insert into s_contact_point(user_id, contact_point_type, info)
	values('Manager2', 'phoneNum', '031-123-4567');
insert into s_contact_point(user_id, contact_point_type, info)
	values('Manager2', 'mobileNum', '010-3456-7890');

insert into s_contact_point(user_id, contact_point_type, info)
	values('hong', 'address', '한양');

insert into s_contact_point(user_id, contact_point_type, info)
	values('lee', 'address', '충청남도 아산');
