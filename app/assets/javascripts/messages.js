$(document).on('turbolinks:load', function() {

  $(function() {
    function buildHTML(message) {
      var html = `<div class="chat clearfix" data-message-id="${message.id}">
                    <span>
                    ${message.name}
                    </span>
                    <p>${message.date}
                    </p>
                    <i class="fa fa-times"></i>
                    <i class="fa fa-pencil-square-o"></i>
                    <i class="fa fa-reply"></i>
                    <h5>
                    ${message.text}
                    </h5>
                    `;
      return html;
    };

    var interval = setInterval(function() {
      if (window.location.href.match(/\/groups\/\d+\/messages/)) {
      $.ajax({
        type: "GET",
        url: location.href.json,
        dataType: 'json',
        processData: false,
        contentType: false
      }).done(function(json) {
        var id = $('.chat.clearfix').data('messageId');
        var insertHTML = '';
        json.messages.forEach(function(message) {
          if(message.id > id) {
            insertHTML += buildHTML(message);
          }
        });
        $('#message-field').prepend(insertHTML);
        $('#message-field').animate({scrollTop: $('#message-field').height()}, 1500);
        return false;
      });
      } else {
        clearInterval(interval);
    }}, 5000);

    $('#message-submit-btn').on('submit', function(e) {
      e.preventDefault();
      var formData = new FormData(this);
      var url = $(this).attr('action');

      $.ajax({
        type: "POST",
        url: url,
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false
      }).done(function(data) {
        var html = buildHTML(data);
        $('#message-field').append(html);

        notice("メッセージを保存しました");
      }).fail(function() {
        alert("JSONの取得に失敗しました")
      })
    })


  });

});
