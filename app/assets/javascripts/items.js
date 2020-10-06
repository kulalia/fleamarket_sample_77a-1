console.log('ok');
$(function() {
  console.log('ok1');
  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    console.log('ok1.5');
    const html = `<div data-index="${index}" id="image-box">
                    <input type="file"
                    name="item[images_attributes][${index}][image_url]"
                    value id="image_file"
                    required="required">
                    <label for="img-file">
                      <i class="fas fa-camera">
                        ::before
                      </i>
                    </label>
                  </div>`;
    return html;
    console.log('ok2');
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('#image-box').on('change', '.js-file', function(e) {
    console.log('ok3');
    // fileIndexの先頭の数字を使ってinputを作る
    $('#image-box').append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    console.log('ok4');
    // 末尾の数に1足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    console.log('ok5');
  });

  $('#image-box').on('click', '.js-remove', function() {
    console.log('ok6');
    $(this).parent().remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
    console.log('ok7');
  });
});