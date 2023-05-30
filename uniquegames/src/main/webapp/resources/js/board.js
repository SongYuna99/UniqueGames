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
				location.href = "notice_write.do?f=up&id=" + $(checked).val();
			}
		}
	});

	// 작성 버튼 이벤트
	$('button[name="listWrite"]').on("click", function() {
		location.href = "notice_write.do";
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
			location.href = "notice_content.do";
		} else {
			location.href = "notice_list.do";
		}
	});
	
	// file
	$('#upload-hidden').on('change', function() {
		let fileName = $('#upload-hidden').val();
		$('#upload-name').val(fileName);
	});

	/**
	 * content 버튼 이벤트
	 */
	// 수정 버튼 이벤트
	$('button[name="update"]').on("click", function() {
		let no = $("input[name='no']").val();
		location.href = "notice_update.do?no=" + no;
	})

	// 삭제 버튼 이벤트
	$('button[name="delete"]').on("click", function() {

		if (confirm("정말로 삭제하시겠습니까?")) {
			noticeDelete.submit();
		}
	})

	// 목록 버튼 이벤트
	$('button[name="list"]').on("click", function() {
		location.href = "notice_list.do";
	})

	// 댓글 작성 이벤트
	$('button[name="cmtWrite"]').on("click", function() {
		if ($("#form-control").val() != "")
			commentWriteForm.submit();
		else
			alert("댓글 내용을 입력하세요.");
	})
	
	// 댓글 삭제 이벤트
/*	$('.cmtDelete').on("click", function() {
		if (confirm('댓글을 삭제하시겠습니까?')) {
			commentDelete.submit();
		} else {
			return false;
		}
	})
*/
	
	// 신고버튼
/*
		const reportBtn = document.querySelectorAll(".report");
		const modal = document.getElementById("modal-background");
		const modalCloseBtn = document.getElementById("modal-close");
		const modalReportBtn = document.getElementById("modal-report");
	
		function modalOff() {
			modal.style.display = "none";
		}
		reportBtn.forEach(e => {
			e.addEventListener("click", e => {
				modal.style.display = "flex";
			});
		});

		modalCloseBtn.addEventListener("click", e => {
			modalOff();
		});
		modalReportBtn.addEventListener("click", e => {
			modalOff();
		});
	
		modal.addEventListener("click", e => {
			const eventTarget = e.target;
			if (eventTarget.classList.contains("test")) {
				modalOff()
			};
		});
	
		window.addEventListener("keyup", e => {
			if (modal.style.display === "flex" && e.key === "Escape") {
				modalOff()
			};
		});
*/

});

function commentDelete(commentId) {
	if (confirm('댓글을 삭제하시겠습니까?')) {
		let url = window.location.href;
	
		$.ajax({
			url : "comment_delete.do",
			data : {
					no : commentId,
					url : url
			},
			type : "POST",
			success : function(url) {
				alert("댓글이 삭제되었습니다.");
				window.location.replace(url);
			},
			error : function(error) {
				alert("실패");
			}
			
		});
	} else {
		return false;
	}
}