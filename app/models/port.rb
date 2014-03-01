class Port < StaticModel::Base
  set_data_file "#{Rails.root}/data/port.yml"

  belongs_to :pref, foreign_key: 'pref_id'
end
