module MkdPhilippines
  class Engine < ::Rails::Engine
    isolate_namespace MkdPhilippines
    initializer :append_migrations do |app|
      unless app.root.to_s.match?(root.to_s)
        config.paths['db/migrate'].expanded.each do |p|
          app.config.paths['db/migrate'] << p
        end
      end
    end
    paths["app"]
  end
  def self.setup(&block)
    @config ||= MkdPhilippines::Engine::Configuration.new
    yield @config if block
    @config
  end

  def self.config
    Rails.application.config
  end
end
