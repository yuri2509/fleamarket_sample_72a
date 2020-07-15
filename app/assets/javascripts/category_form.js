// $("#parent-form").on("change",function(){
//   // 親ボックスのidを取得してそのidをAjax通信でコントローラーへ送る
//   var parentValue = document.getElementById("parent-form").value;
//   // ("parent-form")は親ボックスのid属性
//   $.ajax({
//     url: '/items/search',
//     type: "GET",
//     data: {
//     parent_id: parentValue // 親ボックスの値をparent_idという変数にする。
//   },
//     dataType: 'json'
//     //json形式を指定
//   });
// });