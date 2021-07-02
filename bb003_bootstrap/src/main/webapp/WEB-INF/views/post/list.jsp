<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="www.dream.com.bulletinBoard.model.PostVO"%>

<%@ include file="../includes/header.jsp"%>


<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">자유게시판</h6>
		</div>
		<div class="card-body">
			<button id="btnRegisterPost">글쓰기</button>
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"	cellspacing="0">
					<thead>
						<tr>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>수정일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listPost}" var="post">
							</a>
							<tr>
								<td><a
									href="/post/readPost?boardId=${boardId}&postId=${post.id}">
										<c:out value="${post.title}"></c:out>
								</a></td>
								<td><c:out value="${post.writer.name}"></c:out></td>
								<td><c:out value="${post.readCnt}"></c:out></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${post.updateDate}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">Modal title</h4>
							</div>
							<div class="modal-body">처리가 완료 되었습니다.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save
									changes</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->

			</div>
		</div>
	</div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<%@ include file="../includes/footer.jsp"%>

<script type="text/javascript">
	$(document).ready(function() {
		$("#btnRegisterPost").on("click", function() {
			self.location = "/post/registerPost?boardId=${boardId}";
		});

		var result = '<c:out value="${result}" />';

		checkModal(result); // 함수 불러오기

		history.replaceState({}, null, null);

		function checkModal(result) {
			if (result === '' || history.state) {
				return;
			}
			if (result.length == ${PostVO.ID_LENGHT}) {
				$(".modal-body").html("게시글 " + result + "번이 등록되었습니다.");
			} else {
				$(".modal-body").html("게시글에 대한 " + result + "하였습니다.");
			}
			$("#myModal").modal("show");
		}

	});
</script>


