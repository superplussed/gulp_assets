class GulpAssetsGenerator < Rails::Generators::Base
  desc "Setup up the folder structure for Gulp Assets"
  source_root File.expand_path('../../../template', __FILE__)

  def create_frontend_folder
    directory 'frontend'
    copy_file ".eslintrc"
    copy_file ".babelrc"
  end

  def create_webpack_config
    copy_file 'webpack.common.config.js'
    copy_file 'webpack.config.js'
    copy_file 'webpack.hot.config.js' # TODO replace host dynamically
  end

  def create_gulpfile
    copy_file 'gulpfile.js'
  end

  def create_module
    copy_file "package.json"
    gsub_file 'package.json', "gulp-assets", Rails.application.class.parent_name
  end

  def install_dependencies
    run "npm install"
  end

end
