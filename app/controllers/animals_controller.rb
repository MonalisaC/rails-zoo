class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
  end

  def show
    @animal = Animal.find(params[:id])
  end

  def new
    @animal= Animal.new
  end

  def create
    @animal= Animal.new(animal_params)
    if @animal.save
      redirect_to animals_path
    else
      render :new
    end

  end

  def edit
    @animal = Animal.find_by(id: params[:id])
  end

  def update
    @animal = Animal.find_by(id: params[:id])
    if !@animal.nil?
      if @animal.update(animal_params)
        redirect_to animals_path(@animal.id)
      else
        render :edit
      end
    else
      redirect_to animals_path
    end
  end

  def destroy
    if @animal = Animal.find(params[:id])
      @animal.destroy
    end
    redirect_to animals_path
  end
end

private

def animal_params
  return params.require(:animal).permit(:name, :species, :age, :image)
end
