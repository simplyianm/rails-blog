$(document).on('page:change', function() {
  var page = 2;
  var end = false;
  $(window).off('scroll').scroll(function() {
    if ($('#infiniteScroll').length === 0 || end) return;
    if($(window).scrollTop() + $(window).height() == $(document).height()) {
      $.get('/partial_page?page=' + page, function(data) {
        if (data.length !== 1) {
          $('#articlesExtra').append(data);
          page++;
        } else {
          $('#infiniteScroll').removeClass('hidden');
          end = true;
        }
      });
    }
  });
});
