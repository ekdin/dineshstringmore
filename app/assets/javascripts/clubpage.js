$(document).ready(function(){
  var viewMore = $('.view-more'); // tag containing the "View More" link

  var isLoadingNextPage = false;  // keep from loading two pages at once
  var lastLoadAt = null;          // when you loaded the last page
  var minTimeBetweenPages = 1000;     // milliseconds to wait between loading pages
  var loadNextPageAt = 600;          // pixels above the bottom

  var waitedLongEnoughBetweenPages = function(){
    return lastLoadAt == null || new Date() - lastLoadAt > minTimeBetweenPages;
  }

  var approachingBottomOfPage = function(){
    return $('.infinite-club-story').height() - $(document).scrollTop() < document.documentElement.clientHeight + loadNextPageAt;
  }

  var nextPage = function(){
    url = viewMore.find('a').attr('href');
    if(isLoadingNextPage || !url){
      return;
    }
    viewMore.addClass('loading');
    isLoadingNextPage = true;
    lastLoadAt = new Date();
    $('.view-more').show()

    $.ajax({
      url: url,
      method: 'GET',
      dataType: 'script',
      success: function(){
        viewMore.removeClass('loading');
        isLoadingNextPage = false;
        lastLoadAt = new Date();
        $('.view-more').hide();
        
      }
    });
  }

  // watch the scrollbar
  $(window).scroll(function(){
    if(approachingBottomOfPage() && waitedLongEnoughBetweenPages()){
      nextPage();
    }
  });

  // failsafe in case the user gets to the bottom
  // without infinite scrolling taking affect.
  viewMore.find('a').click(function(e){
    nextPage();
    e.preventDefaults();
  });
});
