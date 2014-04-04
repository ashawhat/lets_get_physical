class ExercisesController < ApplicationController

  def index
    @exercises = Exercise.all
    render('index.html.erb')
  end

  def show
    @exercise = Exercise.find_by(slug: params[:slug])
    render('show.html.erb')
  end

  def new
    @exercise = Exercise.new
    render('new.html.erb')
  end

  def create
    @exercise = Exercise.new(params[:exercise])
    if @exercise.save
      redirect_to('/exercises')
    else
      render('edit.html.erb')
    end
  end

  def edit
    @exercise = Exercise.find_by(slug: params[:slug])
    render('exercises/edit.html.erb')
  end

  def update
    @exercise = Exercise.find_by(slug: params[:slug])
    if @exercise.update(params[:exercise])
      flash[:notice] = "This has been updated"
      redirect_to "/exercises/#{@exercise.slug}"
    else
      render "exercises/edit.html.erb"
    end
  end

  def destroy
    @exercise = Exercise.find_by(slug: params[:slug])
    @exercise.destroy
    redirect_to('/exercises')
  end

end