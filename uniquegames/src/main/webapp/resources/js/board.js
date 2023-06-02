$(document).ready(function() {

	/**
	 * list 버튼 이벤트
	 */
	// 전체 삭제 버튼 이벤트
	$('button[name="listDeleteAll"]').on("click", function() {

		let list = $("input[name='list'");

		if (confirm("모든 게시글을 삭제하시겠습니까?")) {

			list.prop("checked", true);
			boardManage.submit();

		};
	});

	// 삭제 버튼 이벤트
	$('button[name="listDelete"]').on("click", function() {
		let checked = $("input[name='list']:checked").get();

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
				location.href = "notice_update.do?no=" + $(checked).val();
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
		if ($("input[name='title']").val() != "" && $("textarea[name='content']").val() != "") {
			writeForm.submit();

		} else if ($("input[name='title']").val() == "") {
			alert("제목을 입력해주세요.");
			$("input[name='title']").focus();

			return false;
		}
		/*
		} else if ($("textarea[name='content']").val() == ""){
			alert("내용을 입력해주세요.");
			$("textarea[name='content']").focus();
			
			return false;
		}
		*/
	});

	// 취소 버튼 이벤트
	$('button[name="cancel"]').on("click", function() {
		const URLSearch = new URLSearchParams(location.search);
		if (window.location.href.indexOf("update") > -1) {
			location.replace("notice_content.do?no=" + URLSearch.get('no'));
		} else {
			location.href = "notice_list.do";
		}
	});
	
	// 파일 버튼 이벤트
	$('button[name="file"]').on("click", function() {
		$('#upload-hidden').click();
	});
	
	// file
	$('#upload-hidden').on('change', function() {
		let file = 	$("#upload-hidden")[0].files[0];
		let fileName = file.name;
		let fileType = file.type;

		if (fileType.startsWith("image/")) { 
			$('#upload-name').val(file.name);

			let output = "<button type='button' id='btn-style' name='filedel'>취소</button>";
			$('span').before(output);
			$("#filebox").css("margin-right", "78px");
				// 파일 취소 버튼 이벤트
			$('#filebox button[name="filedel"]').on("click", function() {
				$('#upload-hidden').val(null);
				$('#upload-name').val("");
				$('button[name="filedel"]').remove();
				$("#filebox").css("margin-right", "164px");
			});
			
		} else {
			alert("이미지만 선택 가능합니다.");
			$('#upload-hidden').val(null);
			$('#upload-name').val("");
		}
	});

	/**
	 * content 버튼 이벤트
	 */
	// 수정 버튼 이벤트
	$('button[name="update"]').on("click", function() {
		let no = $("input[name='post_id']").val();
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
			},
			dataType : "text",
			type : "POST",
			success : function(result) {
				if (result == "SUCCESS") {
					alert("댓글이 삭제되었습니다.");
				} else {
					alert("댓글 삭제가 실패하였습니다.");
				}
				window.location.replace(url);
			},
			error : function(error) {
				alert("지금은 시도할 수 없습니다.\n상태가 지속될 경우 관리자에게 문의하세요.");
			}
			
		});
	} else {
		return false;
	}
}