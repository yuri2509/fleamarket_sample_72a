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
      childSelectHtml = `<div class='listing-select-wrapper__added' id= 'children_wrapper'>
                          <div class='listing-select-wrapper__box'>
                            <select class="listing-select-wrapper__box--select", id="child_category" name="category_id">
                              <option value="---" data-category="---">選択してください</option>
                              ${insertHTML}
                            <select>
                          </div>
                        </div>`;
      $('.furima-item__input-form__detail__category').append(childSelectHtml);
    }

    // 孫カテゴリーの表示作成
    function appendGrandchidrenBox(insertHTML){
      var childSelectHtml = '';
      childSelectHtml = `<div class='listing-select-wrapper__added' id= 'grandchildren_wrapper'>
                          <div class='listing-select-wrapper__box'>
                            <select class="listing-select-wrapper__box--select", id="grandchild_category" name="category_id">
                              <option value="---" data-category="---">選択してください</option>
                              ${insertHTML}
                            <select>
                          </div>
                        </div>`;
      $('.furima-item__input-form__detail__category').append(childSelectHtml);
    }
    // 親カテゴリー選択後のイベント
    $('#parent_category').on('change', function(){
      var parentCategory = document.getElementById('parent_category').value; //選択された親カテゴリーの名前を取得
      if (parentCategory != "選択してください"){ //親カテゴリーが初期値でないことを確認
        $.ajax({
          url: '/items/get_category_children',
          type: 'GET',
          data: { parent_name: parentCategory },
          dataType: 'json'
        })
        .done(function(children){
        console.log(children)
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
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#children_wrapper').remove(); //親カテゴリーが初期値になった時、子以下を削除するする
        $('#grandchildren_wrapper').remove();
      }
    });



// 子カテゴリー選択後のイベント
    $(document).on('change', '#child_category', function(){
      var childId = $('#child_category option:selected').data('category'); //選択された子カテゴリーのidを取得
      if (childId != "選択してください"){ //子カテゴリーが初期値でないことを確認
        $.ajax({
          url: '/items/get_category_grandchildren',
          type: 'GET',
          data: { child_id: childId },
          dataType: 'json'
        })
        .done(function(grandchildren){
          console.log(grandchildren)
          if (grandchildren.length != 0) {
            $('#grandchildren_wrapper').remove(); //子が変更された時、孫以下を削除するする
            $('#size_wrapper').remove();
            $('#brand_wrapper').remove();
            var insertHTML = '';
            grandchildren.forEach(function(grandchild){
              insertHTML += appendOption(grandchild);
            });
            console.log(insertHTML)
            appendGrandchidrenBox(insertHTML);
          }
        })
        .fail(function(){
          $('#grandchildren_wrapper').remove();
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#grandchildren_wrapper').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
      }
    });
});
});