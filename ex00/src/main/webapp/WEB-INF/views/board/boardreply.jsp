<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row" style="margin: 40px -10px 0 -10px;">
	<div class="col-lg-12">
		<div class="card">
		  <div class="card-header" style="background: #e0e0e0">
			<i class="fa fa-comments fa-fw"></i> reply
			<!-- Button to Open the Modal -->
				<button type="button" class="btn btn-primary btn-sm pull-right" data-toggle="modal" data-target="#replyModal">
				  New Reply
				</button>
		  </div>
		  <div class="card-body"  >
			<ul class="chat">
			<!-- 데이터 한개 당 li 태그가 생긴다. foreach -->
				<li class="left clearfix"  data-rno="12">
				 <div>
					<div class="header">
						<strong class="primary-font">user00</strong>
						<small class="pull-right text-muted">2024-12-12 13:13</small>
					</div>				 
				 	<p><pre>Good Job!</pre></p>
				 </div>
				</li>
			</ul>
		  </div>
		</div>
	</div>
</div>

<!-- The Modal -->
<div class="modal" id="replyModal">
  <div class="modal-dialog  modal-dialog-centered">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">댓글 등록</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
		<textarea rows="3" class="form-control" id="replyContent" name="replyContent" ></textarea>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
      <button class="btn btn-dark" id="replyWriteBtn">등록</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
      </div>

    </div>
  </div>
</div>