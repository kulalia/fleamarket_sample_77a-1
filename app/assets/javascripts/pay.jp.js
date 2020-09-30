$(document).on('turbolinks:load',function(){

  // Pay.jpのテスト用公開鍵
  Payjp.setPublicKey('pk_test_6cb120ab7206d36ff1052253');

  
  var form = $(".form");

  $(".submit-btn").click(function() {

    // formの送信を止める(サーバーと通信しない)
    form.find("input[type=submit]").prop("disabled", true);

    // formのカード情報を取得
    var card = {
      card_number: $("#card_number").val(),
      exp_month: $("#exp_month").val(),
      exp_year: $("#exp_year").val(),
      security_code: $("#security_code").val(),
    };

    // Pay.jpに送るトークン作成
    Payjp.createToken(card, function(status, response) {
      if (status === 200) {

        // formのデータ削除
        $("#card_number").removeAttr("name");
        $("#exp_month").removeAttr("name");
        $("#exp_year").removeAttr("name");
        $("#security_code").removeAttr("name");

        // トークン作成
        var token = response.id;
        form.append($(`<input type="hidden" name="payjp_token" />`).val(taken));
        form.get(0).submit();
      }

      else {
        alert("カード情報が正しくありません。");
        form.find("input[type=submit]").prop("disabled", false);
      }
    });
  });
});
