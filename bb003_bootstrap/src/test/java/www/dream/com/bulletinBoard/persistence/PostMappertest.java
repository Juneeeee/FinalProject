package www.dream.com.bulletinBoard.persistence;

import static org.junit.Assert.assertNotNull;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import www.dream.com.bulletinBoard.model.BoardVO;
import www.dream.com.bulletinBoard.model.PostVO;
import www.dream.com.party.model.Admin;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml")
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class PostMappertest {
	@Autowired
	private PostMapper postMapper;

	//public int insert(@Param("board") BoardVO board, @Param("post") PostVO post); 입력문
	@Test
	public void test000InsertPost() {
		try {
			BoardVO commNotice = new BoardVO(1);
			PostVO post = new PostVO("이제는 우리가", "헤어져야 할 시간", new Admin("Admin"));
			postMapper.insert(commNotice, post);
			System.out.println("지금 만든 객체의 아이디는 " + post.getId() + " 책 기준 191쪽 참조");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/*
	@Test
	public void test010DeleteById() {
		try {
			System.out.println(postMapper.deletePostById("00003"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void test020UpdateById() {
		try {
			PostVO post = postMapper.findPostById("00005");
			post.setTitle(post.getTitle() + "1");
			postMapper.updatePost(post);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void test030FindById() {
		try {
			System.out.println(postMapper.findPostById("00003"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	*/
	// 출력문
	@Test
	public void test040GetList() {
		assertNotNull(postMapper);
		try {
			postMapper.getList(1).forEach(post -> {
				System.out.println(post);
			});
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
