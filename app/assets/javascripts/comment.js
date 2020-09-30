$(function(){
  // 改行した分だけ高さを追加
  var $textarea = $('#comment-textarea');
  var lineHeight = parseInt($textarea.css('lineHeight'));
  $textarea.on('input', function(evt) {
    var lines = ($(this).val() + '\n').match(/\n/g).length;
    $(this).height(lineHeight * lines);
  });


  // コメントのHTMLを返す
  function buildHTML(comment){
    var html =  `
                <li class='comment'>
                  <div class='comment__head'>
                    <div class='comment__head--nickname'>
                      ${comment.user_name}
                    </div>
                    <div class='comment__head--time'>
                      ${comment.created_at_hour}
                      ：
                      ${comment.created_at_min}
                    </div>
                    <div class='comment__head--learning-time'>
                      <h1>学習時間</h1>
                      <h2>
                        ${comment.learning_time}
                        分
                      </h2>
                    </div>
                  </div>
                  <div class='comment__text'>
                    ${comment.text}
                  </div>
                </li>
                `
    return html
  }
  // コメント投稿の非同期通信
  $('#new-comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('#comments-list').append(html);
      $('form')[0].reset();
      $('.comments-main').animate({ scrollTop: $('.comments-main')[0].scrollHeight});
      $('#check1').prop('checked',false);
      $('.submit-btn').prop('disabled', false);
    })
     .fail(function(){
      alert("メッセージ送信に失敗しました");
      $('.submit-btn').prop('disabled', false);
    });
  });
});