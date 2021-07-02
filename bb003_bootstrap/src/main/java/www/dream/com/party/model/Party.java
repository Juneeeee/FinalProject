package www.dream.com.party.model;

import java.util.Date;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;
import www.dream.com.common.model.CommonMngVO;

/**
 * 모든 행위자 정보의 공통적인 상위 정보를 담고 있는 추상적인 클래스
 * 
 * @author Myungsoo Kang
 */
@Data
@NoArgsConstructor
public abstract class Party extends CommonMngVO {
	private String userId; // 로그인 ID
	private String userPassword; // 암호, 암호화는 나중에
	private String name; // 이름
	private Date birthDate; // 생년월일 @DateTimeFormat(pattern="yyyy-MM-dd")
	private boolean male; // 남자인가
	private boolean enabled; // 로그인 가능한가

	// 1:N 관계에 대한 속성
	private List<ContactPoint> listContactPoint;

	public Party(String userId) {
		this.userId = userId;
	}
	
	@Override
	public String toString() {
		return "Party [userId=" + userId + ", userPassword=" + userPassword + ", name=" + name + ", birthDate="
				+ birthDate + ", male=" + male + ", enabled=" + enabled + ", listContactPoint=" + listContactPoint
				+ ", " + super.toString() + "]";
	}

}
