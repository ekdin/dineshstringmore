class Admin::RatingCategoriesController<AdminController

def index
	@ratingcategories=RatingCategory.all

end

def new

	rating_category=RatingCategory.new
	
end

def create
	@rating_category=RatingCategory.new(rating_category_params)
	@rating_category.save
	redirect_to admin_rating_categories_url
end

def update

	@rating_category=RatingCategory.find(params[:id])
	@rating_category.update(rating_category_params)
	redirect_to admin_rating_categories_url
	
end

def edit
	@rating_category=RatingCategory.find(params[:id])
	
end

def destroy
	@rating_category=RatingCategory.find(params[:id])
	@rating_category.destroy
	redirect_to admin_rating_categories_url
	
end

private
def rating_category_params
     params.require(:rating_category).permit(:name)
 	
end 


end	