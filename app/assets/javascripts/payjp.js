window.addEventListener('DOMContentLoaded', function(){
  Payjp.setPublicKey ('pk_test_8444f02a03411a8548760003')
  var submit = document.getElementById("token_submit");
  submit.addEventListener('click', function(e){
    e.preventDefault();
    var card = {
      number: document.getElementById("number").value,
      exp_year: document.getElementById("exp_year").value,
      exp_month: document.getElementById("exp_month").value,
      cvc: document.getElementById("cvc").value
    };

    Payjp.createToken(card, function(status, response) {
      if (status === 200) {
        $("#number").removeAttr("name");
        $("#cvc").removeAttr("name");
        $("#exp_month").removeAttr("name");
        $("#exp_year").removeAttr("name");
        $("#card_token").append(
          $('<input type="hidden" name="payjp_token">').val(response.id)
        );
        document.inputForm.submit();
      } else {
        alert("カード情報が正しくありません。");
      }
    });
  });
});