select * from s_party;

-- 카테션 프로덕트 : 쓰레기도 포함한 집합, 정보 건수의 곱하기로 건수가 만들어져서 가치 없음
select *
	from s_party p, s_contact_point cp;
	
--join
select *
	from s_party p, s_contact_point cp
	where p.user_id = cp.user_id;
	
--Outer join
select *
	from s_party p, s_contact_point cp
	where p.user_id = cp.user_id(+);
	
select *
	from s_party p left outer join s_contact_point cp on p.user_id = cp.user_id;

--Admin 정보조회
select p.name, p.birth_dt, p.user_id, p.sex, cp.contact_point_type, cp.info
	from s_party p, s_contact_point cp
	where p.user_id = cp.user_id(+)
	and p.user_id='Admin';
	