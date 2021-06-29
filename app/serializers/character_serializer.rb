class CharacterSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :character_klass, :helm, :shoulders, :gloves,
  :chest_armor, :belt, :pants, :boots, :bracers, :amulet, :ring_1,
  :ring_2, :weapon, :offhand, :gem_notes, :kanais_cube, 
  :active_skills, :passive_skills, :general_build_notes
end
