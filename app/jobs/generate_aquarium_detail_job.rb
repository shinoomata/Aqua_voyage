class GenerateAquariumDetailJob < ApplicationJob
  queue_as :default

  def perform(aquarium_id)
    Aquarium.find(aquarium_id)
    # Do something later
  end
end
