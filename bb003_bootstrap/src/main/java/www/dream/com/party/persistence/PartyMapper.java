package www.dream.com.party.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import www.dream.com.party.model.ContactPoint;
import www.dream.com.party.model.Party;
import www.dream.com.party.model.User;

/**
 * MyBatis를 활용하여 Party 종류의 객체를 만들어 관리하는 인터페이스
 * 함수 정의 순서 : 목록 조회(L) -> 개별 객체 조회(R) -> Insert(C) -> Update(U) -> Delete(D)
 * @author Myungsoo Kang
 */
public interface PartyMapper {
	// 목록조회(L) - 모든 유저 정보를 읽는다
	public List<Party> getList();
	
	public void insert(@Param("user") User user);

	public String findByName(@Param("name") User user);

	public void insertContactPoint(@Param("partyId") String idOfNewb, @Param("cp") ContactPoint addr);
}
