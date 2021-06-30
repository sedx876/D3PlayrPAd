class Api::V1::CharactersController < ApplicationController
  before_action :set_character, only: [:show, :update, :destroy]

  #Presents all our chracters
  def index
    if logged_in?
      @characters = current_user.characters
      render json: CharacterSerializer.new(@characters)
    else
      render json: {error: "You must be logged in to see Characters"}
    end
  end

  #Shows a particular instance of chracters
  def show
    render json: @character
  end

  #Allows us to make a new character instance
  def create
    @character = current_user.characters.build(character_params)
    if @character.save
      render json:  CharacterSerializer.new(@character), status: :created
    else
      error_resp = {error: @character.errors.full_messages.to_sentence}
      render json: error_resp, status: :unprocessable_entity
    end
  end

  #allows us to edit an instance of character
  def update
    if @character.update(character_params)
      render json:  CharacterSerializer.new(@character), status: :ok
    else
      error_resp = {error: @character.errors.full_messages.to_sentence}
      render json: error_resp, status: :unprocessable_entity
    end
  end

  def destroy
    if @character.destroy
      render json:  { data: "Character successfully destroyed" }, status: :ok
    else
      error_resp = {error: "Character not found and not destroyed"}
      render json: error_resp, status: :unprocessable_entity
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
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