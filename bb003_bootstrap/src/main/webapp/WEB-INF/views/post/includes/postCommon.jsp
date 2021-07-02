<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 수정 처리(modifyPost)시 title, content에는 readonly는 없어야 함 -->
<!-- 신규 처리(registerPost)시 title, content에는 내용, readonly가 없어야 함 -->
<div class="form-group">
	<label>아이디</label> <input name="id" value="${post.id}"
		class="form-control" readonly>
</div>
<div class="form-group">
	<label>제목</label> <input id="title" name="title" value="${post.title}"
		class="form-control" readonly>
</div>
<div class="form-group">
	<label>내용</label>
	<textarea id="txaContent" name="content" class="form-control" rows="3"
		readonly="readonly">${post.content}</textarea>
</div>
<div class="form-group">
	<label>작성자</label> <input value="${post.writer.name}" class="form-control" readonly>
</div>
<div class="form-group">
	<p>
		조회 수 : <b>${post.readCnt}</b>, 좋아요 : <i>${post.likeCnt}</i>, 싫어요 : <strong>${post.dislikeCnt}</strong>
	</p>
</div>
<div class="form-group">
	<label>등록시점 : </label>
	<fmt:formatDate pattern="yyyy-MM-dd" value="${post.registrationDate}" />
	<label>, 수정시점 : </label>
	<fmt:formatDate pattern="yyyy-MM-dd" value="${post.updateDate}" />
</div>

<script type="text/javascript">
	//$(document).ready(function()는 해당 파일이 활동하는 경우에만 동작하므로 그 안의 function은 다른 파일에서 작동하지 않는다
	function controlInput(includer) {
		if (includer === '수정' || includer === '신규') {
			$("#title").attr("readonly", false);
			$("#txaContent").attr("readonly", false);
		}

	}
</script>