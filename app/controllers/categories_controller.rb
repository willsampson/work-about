class CategoriesController < ApplicationController
  def index
    matching_categories = Category.all

    @list_of_categories = matching_categories.order({ :created_at => :desc })

    render({ :template => "categories/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_categories = Category.where({ :id => the_id })

    @the_category = matching_categories.at(0)

    render({ :template => "categories/show.html.erb" })
  end

  def create
    the_category = Category.new
    the_category.cafe = params.fetch("query_cafe", false)
    the_category.library = params.fetch("query_library", false)
    the_category.hotel = params.fetch("query_hotel", false)
    the_category.public_space = params.fetch("query_public_space", false)
    the_category.mixed_use = params.fetch("query_mixed_use", false)
    the_category.coworking = params.fetch("query_coworking", false)
    the_category.outdoor_option = params.fetch("query_outdoor_option", false)

    if the_category.valid?
      the_category.save
      redirect_to("/categories", { :notice => "Category created successfully." })
    else
      redirect_to("/categories", { :alert => the_category.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_category = Category.where({ :id => the_id }).at(0)

    the_category.cafe = params.fetch("query_cafe", false)
    the_category.library = params.fetch("query_library", false)
    the_category.hotel = params.fetch("query_hotel", false)
    the_category.public_space = params.fetch("query_public_space", false)
    the_category.mixed_use = params.fetch("query_mixed_use", false)
    the_category.coworking = params.fetch("query_coworking", false)
    the_category.outdoor_option = params.fetch("query_outdoor_option", false)

    if the_category.valid?
      the_category.save
      redirect_to("/categories/#{the_category.id}", { :notice => "Category updated successfully."} )
    else
      redirect_to("/categories/#{the_category.id}", { :alert => the_category.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_category = Category.where({ :id => the_id }).at(0)

    the_category.destroy

    redirect_to("/categories", { :notice => "Category deleted successfully."} )
  end
end
