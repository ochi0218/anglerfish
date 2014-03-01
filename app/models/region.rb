class Region < StaticModel::Base
  set_data_file "#{Rails.root}/data/region.yml"

  has_many :prefs
end
