json.array!(@share_a_stats) do |share_a_stat|
  json.extract! share_a_stat, :title, :message, :image, :scholarship, :tip, :mc_alpha, :mc_beta, :redirect, :redirect_message, :campaign_id, :color_scheme, :logo, :logo_text, :shortform_image, :shortform_bucket, :sponsor_image, :published
  json.url share_a_stat_url(share_a_stat, format: :json)
end
