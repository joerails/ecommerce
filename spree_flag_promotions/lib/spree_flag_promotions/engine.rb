module SpreeFlagPromotions
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_flag_promotions'
    config.autoload_paths += %W(#{config.root}/lib)
    #require "#{RAILS_ROOT}/lib/spree/flag_promotion_configuration"

    initializer "spree.flag_promotions.preferences", :after => "spree.environment" do |app|
      Spree::FlagPromotions::Config = Spree::FlagPromotionConfiguration.new
    end

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
