// The following JavaScript snippet was authored by Jonathan la Cour, https://github.com/lacour
// and released to the public domain under CC0 (https://directory.fsf.org/wiki/License:CC0)
document.addEventListener('DOMContentLoaded', function() {
 $.ajax({
   url: 'https://raw.githubusercontent.com/openark/custom-slack-css/master/custom-3.0.css',
   success: function(css) {
     $("<style></style>").appendTo('head').html(css);
   }
 });
});
