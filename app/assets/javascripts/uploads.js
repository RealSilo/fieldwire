$(document).on("turbolinks:load", function() {
  console.log("hi");
  $("[type=file]").fileupload({
    add: function(e, data) {
      console.log("add", data);
      data.progressBar = $('<div class="progress" style="width: 200px"><div class="progress-bar"></div></div>').insertAfter("#progressbar");
      var options      = {
        extension: data.files[0].name.match(/(\.\w+)?$/)[0], // file extension
        _: Date.now() // prevent cache
      };

      $.getJSON("/images/upload/cache/presign", options, function(result) {
        console.log(result.fields);
        data.formData  = result.fields;
        data.url       = result.url;
        data.paramName = "file";
        data.submit();
      });

    },

    progress: function(e, data) {
      console.log("prog", data);
      var progress   = parseInt(data.loaded / data.total * 100, 10);
      var percentage = progress.toString() + '%';
      data.progressBar.find(".progress-bar").css("width", percentage).html(percentage);
    },

    done: function(e, data) {
      console.log("done", data);
      data.progressBar.remove();

      var image = {
        id:       data.formData.key.match(/cache\/(.+)/)[1], // we have to remove the prefix part
        storage:  'cache',
        metadata: {
          size:      data.files[0].size,
          filename:  data.files[0].name.match(/[^\/\\]+$/)[0], // IE return full path
          mime_type: data.files[0].type
        }
      };

      var form      = $(this).closest("form"); //js form
      var form_data = new FormData(form[0]);
      console.log(form_data);
      form_data.append($(this).attr("name"), JSON.stringify(image));
      console.log(form_data);

      $.ajax(form.attr("action"), {
        contentType: false,
        processData: false,
        data:        form_data,
        method:      form.attr("method"),
        dataType:    "script"
        // success: function(response) {
        //   var $img = $("<img/>", {src: response.image_url, width: 200});
        //   var $div = $("<div/>").append($img);
        //   $("#photos").append($div);
        // }
      });
    }
  });

});