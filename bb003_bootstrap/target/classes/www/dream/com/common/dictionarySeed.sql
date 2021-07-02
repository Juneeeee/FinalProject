drop table s_id_seed;
truncate table s_id_seed;

select * from s_id_seed order by seed;

create table s_id_seed(
	seq_id		number(19)		primary key,
    seed 		char(5)
);

CREATE OR REPLACE FUNCTION get_id(intSeed number) RETURN char
IS
	ret char(5);
BEGIN
	select seed into ret from s_id_seed where seq_id = intSeed;
	RETURN ret;
END;