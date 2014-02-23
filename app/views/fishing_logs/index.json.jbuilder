json.array!(@fishing_logs) do |fishing_log|
  json.extract! fishing_log, :id, :fish_name, :fish_length, :fish_weight, :fishing_point_name, :fishing_method, :fishing_date, :fishing_time, :bait, :comment
  json.url fishing_log_url(fishing_log, format: :json)
end
