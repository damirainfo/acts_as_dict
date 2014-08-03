module ActsAsDict
  class Engine < ::Rails::Engine
    initializer "acts as dict load_app_instance_data" do |app|
      app.class.configure do
        #Pull in all the migrations from Dict to the application
        config.paths['db/migrate'].concat ActsAsDict::Engine.paths['db/migrate'].existent
      end
    end
  end
end
