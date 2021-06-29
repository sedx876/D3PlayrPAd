class Api::V1::CharactersController < ApplicationController
  before_action :set_character, only: [:show, :update, :destroy]

  def index
    characters = Character.order('created_at DESC')
    render json: CharacterSerializer.new(characters)
  end

  def show
  end

  def create 
  end

  def update
  end

  def destroy
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:title, :character_klass, 
      :helm, :shoulders, :gloves, :chest_armor, :belt, :pants, 
      :boots, :bracers, :amulet, :ring_1, :ring_2, :weapon, 
      :offhand, :gem_notes, :kanais_cube, :active_skills, 
      :passive_skills, :general_build_notes)
  end

end