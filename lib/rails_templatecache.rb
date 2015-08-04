require "rails_templatecache/engine"

module RailsTemplateCache
  mattr_accessor :templates
  autoload :Template, 'rails_templatecache/template'

  def self.setup(&block)
    set_config
    yield @@config.rails_templatecache if block
    @@config.rails_templatecache
  end

  def self.config
    Rails.application.config
  end

  private

  def self.set_config
    unless @config
      @@config = RailsTemplateCache::Engine::Configuration.new
      @@config.rails_templatecache = ActiveSupport::OrderedOptions.new
    end
  end
end
