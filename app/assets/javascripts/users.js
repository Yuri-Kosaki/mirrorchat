$(document).on('turbolinks:load',function() {

  function appendUser(user) {
    var html = `<div class="chat-group-user clearfix" id="chat-group">
                <p class="chat-group-user__name">${user.name}</p>
                <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}">追加</a>
              </div>`;
    $("#user-search-result").append(html);
  }

  function appendNoUser(user) {
    var html = `<div class='chat-group-user clearfix'>${ user }</div>`
    $("#user-search-result").append(html);
  }

  function addMemberList(user) {
    var userId = $(this).data("user-id");
    var userName = $(this).data("user-name");
    var html = `<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-8'>
                <input name='group[user_ids][]' type='hidden' value="${userId}">
                <p class='chat-group-user__name'>${userName}</p>
                <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn'>削除</a>
                </div>`;
    return html;
  }


  $('#user-search-field').on('keyup', function() {
    var input = $.trim($(this).val());
    console.log(input);
    $.ajax({
      url: '/users/chat',
      type:'GET',
      data: {name: input},
      processData: false,
      contentType: false,
      dataType:'json'
    })

    .done(function(users) {
      $('#user-search-result').empty();
      if (users.length !== 0) {
        users.forEach(function(user){
          appendUser(user);
        });
      } else {
        appendNoUser("一致するユーザーがいません")
      }
    })

    $('#user-search-result').on('click', '.chat-group-user__btn--add', function(){
      $(this).parent().remove();
      addMemberList($(this));
    });

    $('#chat-group-users').on('click', '.chat-group-user__btn--remove', function() {
      e.preventDefault();
      $(this).parent().remove();
    });
  });
});

