
module FastExt
  class InstallGenerator < ::Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    desc "Fast_ext installation generator"

    def copy_config_file
      template "fast_ext_config.erb", "config/initializers/fast_ext_config.rb"
    end

    def copy_migrations
      rake("fast_ext:install:migrations")
    end

    def insert_engine_routes
      route %(
        mount FastExt::Engine => '/fast_ext'
      )
    end

    def remove_index_html
      remove_file 'public/index.html'
    end

    def show_readme
      readme '../USAGE'
    end

  end
end