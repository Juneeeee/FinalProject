package www.dream.com.party.model;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 사장. 운영자 등록, 삭제 권환
 * 
 * @author Myungsoo Kang
 *
 */
@Data
@NoArgsConstructor
public class Admin extends Party {
	@Override
	public String toString() {
		return "Admin [" + super.toString() + "]";
	}

	public Admin(String userId) {
		super(userId);
	}

}
