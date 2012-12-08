(function ($, document, window) {

  "use strict";

  $(function () {

    $.fn.exists = function () {
      return $(this).length > 0;
    };

    $(document).ready(function () {

      $(".carousel").carousel({
        interval: 5000,
        pause: ""
      });



    });

  });
}(jQuery, document, window));