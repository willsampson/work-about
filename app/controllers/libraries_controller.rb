class LibrariesController < ApplicationController
  def index
    matching_libraries = Library.all

    @list_of_libraries = matching_libraries.order({ :created_at => :desc })

    render({ :template => "libraries/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_libraries = Library.where({ :id => the_id })

    @the_library = matching_libraries.at(0)

    render({ :template => "libraries/show.html.erb" })
  end

  def create
    the_library = Library.new
    the_library.user_id = params.fetch("query_user_id")
    the_library.spot_id = params.fetch("query_spot_id")

    if the_library.valid?
      the_library.save
      redirect_to("/libraries", { :notice => "Library created successfully." })
    else
      redirect_to("/libraries", { :alert => the_library.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_library = Library.where({ :id => the_id }).at(0)

    the_library.user_id = params.fetch("query_user_id")
    the_library.spot_id = params.fetch("query_spot_id")

    if the_library.valid?
      the_library.save
      redirect_to("/libraries/#{the_library.id}", { :notice => "Library updated successfully."} )
    else
      redirect_to("/libraries/#{the_library.id}", { :alert => the_library.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_library = Library.where({ :id => the_id }).at(0)

    the_library.destroy

    redirect_to("/libraries", { :notice => "Library deleted successfully."} )
  end
end
