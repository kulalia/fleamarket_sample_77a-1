$(function(){

  const buildFileField = (index)=> {
    const html = `<div class="js-file_group" data-index="${index}">
                    <input class="js-file none" type="file"
                    name="item[item_images_attributes][${index}][url]"
                    id="item_item_images_attributes_${index}_url"><br>
                  </div>`;
    return html;
  }

  const buildImg = (index, url)=> {
    const html = `<div class="preview-box">
                    <img data-index="${index}" width="100" height="100" class="preview__image" src="${url}">
                      <div class="preview-text">
                        <div class="preview__edit" data-index="${index}">
                          変更
                        </div>
                        <div class="preview__delete js-remove" data-index="${index}">
                          削除
                      </div>
                    </div>
                  </div>`;
    return html;
  }
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);
  $('.hidden-destroy').hide();
  $('.js-file').hide();

  $('#image-box').on('click', '.preview__edit', function() {
    const targetIndex = $(this).data('index');
    $(`input[data-index="${targetIndex}"].js-file`).on('click', function(e){
      e.stopPropagation();
    });

    $(`input[data-index="${targetIndex}"].js-file`).click();
    $('#image-box').on('change', '.js-file', function(e) {
      const targetIndex = $(this).parent().data('index');
      const file = e.target.files[0];
      const blobUrl = window.URL.createObjectURL(file);
      if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
        img.setAttribute('src', blobUrl);
      } else {
        $('#previews').append(buildImg(targetIndex, blobUrl));
        $('#image-field').append(buildFileField(fileIndex[0]));
        fileIndex.shift();
        fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
      }
    });
  });

  $('#image-field').on('click', function(){
    $(".js-file_group:last").on('click', function(e){
      e.stopPropagation();
    });

    $(`input[type=file]:last`).click();

    $('#image-box').on('change', '.js-file', function(e) {
      const targetIndex = $(this).parent().data('index');
      const file = e.target.files[0];
      const blobUrl = window.URL.createObjectURL(file);
      if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
        img.setAttribute('src', blobUrl);
      } else {
        $('#previews').append(buildImg(targetIndex, blobUrl));
        $('#image-field').append(buildFileField(fileIndex[0]));
        fileIndex.shift();
        fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
      }
    });

  });

  $('#image-box').on('click', '.js-remove', function() {

    const targetIndex = $(this).data('index');
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().parent().remove();
    $(`.js-file_group[data-index="${targetIndex}"]`).remove();

    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });


});