package www.dream.com.selectKey.persistence;

import java.util.Calendar;
import java.util.Date;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import www.dream.com.selectKey.model.DetailVO;
import www.dream.com.selectKey.model.MasterVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml")
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class MasterDetailTest {
	@Autowired
	private MasterDetail masterDetailMapper;
	
	@Test
	public void testInsertMaster() {
		try {
			MasterVO newbie = new MasterVO();
			newbie.setName("newbie");
			Date now = Calendar.getInstance().getTime();
			newbie.setReg_dt(now);
			masterDetailMapper.insertMaster(newbie);
			
			int idOfNew = masterDetailMapper.findByName("newbie", now);
			
			DetailVO addr = new DetailVO();
			addr.setInfo("address");
			masterDetailMapper.insertDetail(idOfNew, addr);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testInsertMasterBySelectKey() {
		try {
			MasterVO newbie = new MasterVO();
			newbie.setName("newbie");
			masterDetailMapper.insertMasterBySelectKey(newbie);
			
			DetailVO addr = new DetailVO();
			addr.setInfo("address");
			masterDetailMapper.insertDetail(newbie.getId(), addr);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
