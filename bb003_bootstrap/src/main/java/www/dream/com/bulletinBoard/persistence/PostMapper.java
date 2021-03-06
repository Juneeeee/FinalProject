package www.dream.com.bulletinBoard.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import www.dream.com.bulletinBoard.model.BoardVO;
import www.dream.com.bulletinBoard.model.PostVO;

public interface PostMapper {
	// LRCUD
	/**
	 * Mapper 함수에 들어가는 인자의 개수가 여러개 일 때는 필수적으로 @Param을 넣어야 한다.
	 * 이를 실수하지 않기 위하여 한개여도 그냥 명시적으로 넣어 준다 
	 * @param boardId
	 * @return
	 */
	public List<PostVO> getList(@Param("boardId") int boardId);
	// public List<PostVO> getList(@Param("boardId") int boardId, @Param("xxx") int abc); -> ${boardId}, ${xxx}
	
	/**	id 값으로 Post 객체 조회 */
	public PostVO findPostById(String id);
	
	public int insert(@Param("board") BoardVO board, @Param("post") PostVO post);
	
	public int updatePost(PostVO post);

	/** id 값으로 Post 객체 삭제 */
	public int deletePostById(String id);
	
	
}
