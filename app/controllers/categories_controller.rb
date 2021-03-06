class CategoriesController < ApplicationController

  before_filter :only => [:create, :update] do
    @forum = Forum.find_or_create_by(:id => category_params[:forum_id])
  end

  load_and_authorize_resource
  load_and_authorize_resource :forum, :only => [:create, :update]

  rescue_from CanCan::AccessDenied do |exception|
    if exception.action == :create
      redirect_to categories_path
    else # update/destroy
      redirect_to category_path(exception.subject)
    end
  end

  after_filter :create_activities, :only => [:create, :update, :destroy]

  def create_activities
    @category.forum.create_activity key: "forum.category_#{action_name}",
      owner: current_user, params: {category_id: @category.id } unless @category.errors.any?
  end

  def index
  end

  def create
    @category = @forum.categories.build(category_params)
    if @category.save!
      redirect_to idea_path(@category.forum.idea), notice: t('category.created')
    else
      render :new, notice: t('category.created')
    end
  end

  def show
  end

  def new
  end

  def edit
  end

  def update
    if  @category.update_attributes(category_params)
      redirect_to @category, notice: t('category.updated')
    else
      render :edit
    end
  end

  def destroy
    authorize! :destroy, @category
    @category.destroy
    redirect_to :back
  end

  def category_params
    params.require(:category).permit(:title, :forum_id, :description)
  end
end

