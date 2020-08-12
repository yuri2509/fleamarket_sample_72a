$(function(){
  $(document).on('turbolinks:load', ()=> {
    // カテゴリーセレクトボックスのオプションを作成
    function appendOption(category){
      var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
      return html;
    }
    // 子カテゴリーの表示作成
    function appendChidrenBox(insertHTML){
      var childSelectHtml = '';
      childSelectHtml = `<select class="item_input__body__category__children--select", id="children_wrapper" name="item[category_id]">
                              <option value>選択してください</option>
                              ${insertHTML}
                            <select>`;
      $('#children_box').append(childSelectHtml);
    }

    // 孫カテゴリーの表示作成
    function appendGrandchidrenBox(insertHTML){
      var childSelectHtml = '';
      childSelectHtml = `<select class="item_input__body__category__grandchildren--select", id="grandchildren_wrapper" name="item[category_id]">
                              <option value>選択してください</option>
                              ${insertHTML}
                            <select>`;
      $('#grandchildren_box').append(childSelectHtml);
    }
    // 親カテゴリー選択後のイベント
    $('#parent_category').on('change', function(){
      var parentCategory = document.getElementById('parent_category').value; //選択された親カテゴリーの名前を取得
      if (parentCategory){ //親カテゴリーが初期値でないことを確認
        $.ajax({
          url: '/items/get_category_children',
          type: 'GET',
          data: { parent_name: parentCategory },
          dataType: 'json'
        })
        .done(function(children){
          $('#children_wrapper').remove(); //親が変更された時、子以下を削除するする
          $('#grandchildren_wrapper').remove();
          var insertHTML = '';
          children.forEach(function(child){
            insertHTML += appendOption(child);
          });
          appendChidrenBox(insertHTML);
        })
        .fail(function(){
          $('#children_wrapper').remove(); 
          $('#grandchildren_wrapper').remove();
        })
      }else{
        $('#children_wrapper').remove(); //親カテゴリーが初期値になった時、子以下を削除するする
        $('#grandchildren_wrapper').remove();
      }
    });

    // 子カテゴリー選択後のイベント
    $(document).on('change','#children_wrapper', function(){
      var childId = document.getElementById('children_wrapper').value;//選択された親カテゴリーの名前を取得
      if (childId){ //子カテゴリーが初期値でないことを確認
        $.ajax({
          url: '/items/get_category_grandchildren',
          type: 'GET',
          data: { child_id: childId },
          dataType: 'json'
        })
        .done(function(grandchildren){
          $('#grandchildren_wrapper').remove(); //子が変更された時、孫以下を削除するする
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#grandchildren_wrapper').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
      }
    });
  });
});
