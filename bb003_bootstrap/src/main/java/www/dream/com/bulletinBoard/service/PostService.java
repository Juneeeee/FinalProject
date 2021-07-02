package www.dream.com.bulletinBoard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.dream.com.bulletinBoard.model.BoardVO;
import www.dream.com.bulletinBoard.model.PostVO;
import www.dream.com.bulletinBoard.persistence.PostMapper;

@Service
public class PostService {
	@Autowired
	private PostMapper postMapper;
	
	public List<PostVO> getList(int boardId){
		return postMapper.getList(boardId);
	}
	
	public PostVO findPostById(String id) {
		return postMapper.findPostById(id);
	}
	
	public int insert(BoardVO board, PostVO post) {
		return postMapper.insert(board, post);
	}
	
	public boolean updatePost(PostVO post) {
		return postMapper.updatePost(post) == 1;
	}

	public boolean deletePostById(String id) {
		return postMapper.deletePostById(id) == 1;
	}
}
