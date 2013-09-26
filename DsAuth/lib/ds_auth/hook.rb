module DsAuth::Hook
  def gated_pages(*opts)
    include DsAuth::InstanceMethods

    config = (opts.last.is_a?(::Hash) ? opts.last : {})

    before_filter only: opts[0] do |c|
      c.send(:gate_page, config)
    end
  end
end
