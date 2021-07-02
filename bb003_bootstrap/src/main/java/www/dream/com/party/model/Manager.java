package www.dream.com.party.model;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 시스템 운영자
 * 
 * @author Myungsoo Kang
 *
 */
@Data
@NoArgsConstructor
public class Manager extends Party {
	public Manager(String userId) {
		super(userId);
	}

	@Override
	public String toString() {
		return "Manager [" + super.toString() + "]";
	}

}
