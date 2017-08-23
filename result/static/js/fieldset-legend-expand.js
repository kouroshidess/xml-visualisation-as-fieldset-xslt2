/* TODO/BUG revisit previously collapsed nested fieldset and it doesn't work anymore */
$(document).ready(function () {
  $('legend').click(function () {
    var $this = $(this);
    var parent = $this.parent();
    var contents = parent.contents().not(this);
    if (contents.length > 0) {
      $this.data("contents", contents.remove());
    } else {
      $this.data("contents").appendTo(parent);
    }
    return false;
  });
});
