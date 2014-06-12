class Pref < StaticModel::Base
  set_data_file "#{Rails.root}/data/pref.yml"

  has_many :ports
  belongs_to :region, foreign_key: 'region_id'
end
