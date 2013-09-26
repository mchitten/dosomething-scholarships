module DsAuth::Hook
  def gated_pages(*opts)
    include DsAuth::InstanceMethods

    before_filter only: opts[0] do |c|
      c.send(:gate_page, opts.extract_options!)
    end
  end
end
