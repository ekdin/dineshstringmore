$(function(){
	$('.image-block').click(function(){
		$(this).find('.fa-check').toggleClass('active');
		if ($('.image-block').find('.fa-check.active').length>=3)
		 {

				$('.btn-follow-interest').removeClass('inactive');

		}
		else
		{
				$('.btn-follow-interest').addClass('inactive');				
		}

	});


	$('.btn-follow-interest').click(function(){
		var interests_id = [];
		$('.image-block').find('.fa-check.active').each(function(){

				var id=$(this).closest('.image-block').find('.interest_class').val();
				interests_id.push(id);

		})
		
		if (interests_id.length>=3)
		{
			 var url='/user_interest/apply'	
			 $.ajax({
			      url: url,
			      method: 'post',
			      dataType: 'script',
			      data: 'interests_id='+interests_id,
			      success: function(){
			    
			        
			      },
			      error: function(){

			      }
   			 });			
		}
	});

});