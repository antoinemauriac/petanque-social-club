class FieldsController < ApplicationController
  def index
    @fields = Field.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @fields.geocoded.map do |field|
      {
        lat: field.latitude,
        lng: field.longitude,
        info_window: render_to_string(partial: "info_window", locals: {field: field})
      }
    end
  end
end

# 1/ commencer par afficher des terrains qui existe deja (vrai address)
# 2/ photo attached (cloudinary)
# 3/
