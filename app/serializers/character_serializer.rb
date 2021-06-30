class CharacterSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :character_klass, :helm, :shoulders, :gloves,
  :chest_armor, :belt, :pants, :boots, :bracers, :amulet, :ring_1,
  :ring_2, :weapon, :offhand, :gem_notes, :kanais_cube, 
  :active_skills, :passive_skills, :general_build_notes
end


#Makes passing different data types(JSON or strings) easier 

#Serialization is the process of turning data structures 
#into another format that can be stored or transmitted over 
#the network.
