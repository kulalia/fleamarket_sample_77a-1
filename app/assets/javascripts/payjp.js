$(function() {

  // Pay.jpのテスト用公開鍵
  Payjp.setPublicKey('pk_test_6cb120ab7206d36ff1052253');

  var form = $("#card-form");

  $("#card-submit-btn").on('click', (function() {

    // formの送信を止める(サーバーと通信しない)
    form.find("input[type=submit]").prop("disabled", true);

    // formのカード情報を取得
    var card = {
      number: $("#card_number").val(),
      exp_month: $("#exp_month").val(),
      exp_year: $("#exp_year").val(),
      cvc: $("#security_code").val()
    };

    // Pay.jpに送るトークン作成
    Payjp.createToken(card, function(status, response) { 
      console.log(response)
      if (status === 200) {

        // formのデータ削除
        $("#card_number").removeAttr("name");
        $("#exp_month").removeAttr("name");
        $("#exp_year").removeAttr("name");
        $("#security_code").removeAttr("name");

        // トークン作成・送信
        form.append($(`<input type="hidden" name="payjp-token"/>`).val(response.id));
        form.get(0).submit();
      }

      else {
        alert("カード情報が正しくありません。");
        form.find("input[type=submit]").prop("disabled", false);
      }
    });
  }));
});
