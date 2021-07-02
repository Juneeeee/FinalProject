<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../includes/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
<!-- 
	<h1 class="h3 mb-2 text-gray-800">Tables</h1>
	<p class="mb-4">
		DataTables is a third party plugin that is used to generate the demo
		table below. For more information about DataTables, please visit the <a
			target="_blank" href="https://datatables.net">official DataTables
			documentation</a>.
	</p>
-->
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<!-- 
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
		</div>
-->
		<div class="card-body">
			<form action="/post/registerPost" method="post">
			
				<%@include file="./includes/postCommon.jsp"%>
				
				<button type="submit" class="btn btn-primary">등록</button>
				<button type="reset" class="btn btn-secondary">초기화</button>
				<input type="hidden" name="boardId" value="${boardId}">
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
		controlInput('신규');		
	});
</script>
