$(function(){

	$('.div-tab-question').click(function(){

		$('.div-question-block').addClass('active');
		$('.div-post-story').removeClass('active');

	});
	$('.div-tab-post').click(function(){

		
		$('.div-question-block').removeClass('active');
		$('.div-post-story').addClass('active');

	});
	$('.qusion-pic-click').click(function(){
		$('.input-file-question-pic').click();

	});
	$('body').on('change', '.input-file-question-pic', function(){

     var reader = new FileReader();
      reader.onload = function (e) {
      $("<img />", {
                    "src": e.target.result,
                    "class": "thumb-image",
                    "height": "30px"
                }).appendTo('.div-question-image');
 
       }
      reader.readAsDataURL($(this)[0].files[0]);
      });


});

function fngetpage(url)
{
	window.location.replace(url);


}

function fnanswerclick(id)
{
	$(id).closest('.div-answer-image').find('.file-answer-image').click();

}
function fnanswerclick(id)
{
	$(id).closest('.div-one-commnet-section-main').find('.file-comment-field').click();

}

$(function(){
$('.story-star').hover(
    // Handles the mouseover
    function() {
        $(this).prevAll().andSelf().addClass('glyphicon-star');
        $(this).prevAll().andSelf().removeClass('glyphicon-star-empty'); 
    },
    // Handles the mouseout
    function() {
        $(this).prevAll().andSelf().addClass('glyphicon-star-empty');

        $(this).prevAll().andSelf().removeClass('glyphicon-star');
        $(this).closest('.div-rate-main').find('.rate-active').addClass('glyphicon-star').removeClass('glyphicon-star-empty');
        
    }
);
$('.story-star').click(function(){
	var sid=$(this).closest('.div-rate-main').find('#sid').val();
	var scid=$(this).closest('.div-rate-main').find('#rcid').val();
	var rate=$(this).attr('value');

	var story_rating={story_id:sid,rate_category_id: scid,rate: rate}
	var json = JSON.stringify(story_rating ); 
	console.log(story_rating);
			$.ajax({
			 type: "patch",
			 url: "/story_ratings/rate",
			 data: story_rating,
			 dataType: 'script',
			 success: function(msg) {
				 
			 },
			 error: function(msg)
			 {
			 	console.log("error comes")
			 	console.log(msg);

			 }
		});


});


});