<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../includes/header.jsp"%>

<div class="container-fluid">
	<div class="card shadow mb-4">
		<div class="card-body">
			<form id="frmPost" action="/post/modifyPost" method="post">
			
				<%@include file="./includes/postCommon.jsp"%>
				
				<button type="submit" data-oper='modify' class="btn btn-primary">수정</button>
				<button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
				<button type="submit" data-oper='list' class="btn btn-secondary">목록</button>
				
				<input type="hidden" id="boardId" name="boardId" value="${boardId}">
				<input type="hidden" name="postId" value="${post.id}">
			</form>
		</div>
	</div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<%@include file="../includes/footer.jsp"%>

<script type="text/javascript">
	$(document).ready(function() {
				
		controlInput('수정');
		
		var frmPost = $("#frmPost");
		
		$('button').on("click", function(eventInfo) {
			//이벤트 처리의 전파를 막아서 어떤 미리 개발되어있는 이벤트 처리를 막는 함수
			eventInfo.preventDefault();
			
			var oper = $(this).data('oper');
			
			if(oper === 'remove') {
				frmPost.attr("action", "/post/removePost");	
			} else if(oper === 'list') {
				var boardIdInput = frmPost.find("#boardId");
				frmPost.attr("method", "get");
				frmPost.attr("action", "/post/list");
				frmPost.empty(); // form에 담겨있는 모든 하위 요소를 없앤다
				frmPost.append(boardIdInput);
			}
			frmPost.submit();
		});
	});
</script>
