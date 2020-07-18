$(function(){
  // 画像用のinputを生成する関数
  const buildFileField = (num)=> {
    const html = `<i class="fas fa-camera camera-icon fa-2x"></i>
                  <div data-index="${num}" class="js-file_group">
                  <input class="js-file" type="file" name="product[images_attributes][${num}][src]" id="product_images_attributes_${num}_src"><br>
                  `;
    return html;
  }
  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<div class="img-preview"><img data-index="${index}" src="${url}" width="120px" height="150px"><div class="js-remove">削除</div></div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();


  // 余裕があればアイコンクリックで画像投稿できるようにすること
  // コメントアウトしているdisplay:none;でファイルを選択を消す
  // 削除ボタンで一旦登録された投稿画像の保存も消せるようにする
  $('.furima-item__input-form__image-fhoto__box').on('click', function() {
    $('item_images_attributes_0_src').trigger('click');
  });

  $('#image-box').on('change', '.js-file', function(e) {
    console.log(e)
    const targetIndex = $(this).parent().data('index');
    console.log(targetIndex)
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      $('#image-box').before(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      a = $('.fa-camera').hide()
      $('#image-box').prepend(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  $('.img-box-form').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index');
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();

    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
})