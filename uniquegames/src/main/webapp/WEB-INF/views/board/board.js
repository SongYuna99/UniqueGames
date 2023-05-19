$(document).ready(function() {

	/**
	 * list 버튼 이벤트
	 */
	// 전체 삭제 버튼 이벤트
	$('button[name="listDeleteAll"]').on("click", function() {
		if (confirm("모든 게시글을 삭제하시겠습니까?")) {
			alert("펑");
		};
	});

	// 삭제 버튼 이벤트
	$('button[name="listDelete"]').on("click", function() {
		let checked = $("input[name='list[]']:checked").get();

		if (checked.length == 0) {
			alert("선택된 게시글이 없습니다.");
			return false;
		} else {
			if (confirm("정말로 삭제하시겠습니까?")) {
				boardManage.submit();
			} else {
				$("input[name='list[]']").prop("checked", false);
				return false;
			}
		}
	});

	// 수정 버튼 이벤트
	$('button[name="listUpdate"]').on("click", function() {
		let checked = $("input[name='list[]']:checked").get();

		if (checked.length == 0) {
			alert("선택된 게시글이 없습니다.");
			return false;
		} else {
			if (checked.length > 1) {
				alert("하나만 선택하세요");
				$("input[name='list[]']").prop("checked", false);
				return false;
			} else {
				location.href = "board-write.do?f=up&id=" + $(checked).val();
			}
		}
	});

	// 작성 버튼 이벤트
	$('button[name="listWrite"]').on("click", function() {
		location.href = "board-write.do";
	});

	/**
	 * write 버튼 이벤트
	 */
	// 작성 버튼 이벤트
	$('button[name="write"]').on("click", function() {
		if ($("input[name='btitle']").val() != "" && $("textarea[name='bcontent']").val() != "") {
			writeForm.submit();
		} else if ($("input[name='btitle']").val() == "") {
			alert("제목을 입력해주세요.")
			$("input[name='btitle']").focus();
			return false;
		} else if ($("textarea[name='bcontent']").val() == ""){
			alert("내용을 입력해주세요.")
			$("textarea[name='bcontent']").focus();
			return false;
		}
	});

	// 취소 버튼 이벤트
	$('button[name="cancel"]').on("click", function() {
		const URLSearch = new URLSearchParams(location.search);
		console.log(URLSearch.get('f'));
		if (URLSearch.get('f') == "up") {
			location.href = "board-content.do";
		} else {
			location.href = "board-list.do";
		}
	});

	/**
	 * content 버튼 이벤트
	 */
	// 수정 버튼 이벤트
//	$('button[name="update"]').on("click", function() {
//		location.href = "board_write.jsp?f=up&id=";
//		
//	})
	// 삭제 버튼 이벤트
	$('button[name="delete"]').on("click", function() {
		if (confirm("정말로 삭제하시겠습니까?")) {
			alert("삭제됨");
			location.href = "board-list.do";
		}
	})
	// 목록 버튼 이벤트
	$('button[name="list"]').on("click", function() {
		location.href = "board-list.do";
	})
	
	$('button[name="cmtWrite"]').on("click", function() {
		if ($("#form-control").val() != "")
			location.href = "board-content.do";
		else
			alert("댓글 내용을 입력하세요.");
	})
});