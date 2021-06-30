class Api::V1::CharactersController < ApplicationController
  before_action :set_character, only: [:show, :update, :destroy]

  def index
    characters = Character.all 
    render json: CharacterSerializer.new(characters)
  end

  def show
    character = Character.find(params[:id])
    render json: @character
  end

  def create 
    character = Character.new(character_params)
    if character.save
      render json:  CharacterSerializer.new(@character), status: :created
    else
      render json: {status: 'ERROR',
                    message: 'Character Did NOT Save',
                    data:character.errors},
                    status: :unprocessable_entity
    end
  end

  def update
    character = Character.find(params[:id])
    if @character.update(character_params)
      render json:  CharacterSerializer.new(@character), status: :ok
    else
      render json: {status: 'ERROR',
                    message: 'Character Did NOT Save',
                    data:character.errors},
                    status: :unprocessable_entity
    end
  end

  def destroy
    character = Character.find(params[:id])
    character.destroy 
    render json: {status: 'SUCCESS', 
                  message:'Deleted Character', 
                  data:character},
                  status: :ok
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