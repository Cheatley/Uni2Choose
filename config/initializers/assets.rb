# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( recq/designvssci.js )
Rails.application.config.assets.precompile += %w( recq/designvslaw.js )
Rails.application.config.assets.precompile += %w( recq/scivslaw.js )
Rails.application.config.assets.precompile += %w( recq/designvshuman.js )
Rails.application.config.assets.precompile += %w( recq/designvscomputer.js )
Rails.application.config.assets.precompile += %w( recq/designvsmedicine.js )
Rails.application.config.assets.precompile += %w( recq/designvslang.js )
Rails.application.config.assets.precompile += %w( recq/scivshuman.js )
Rails.application.config.assets.precompile += %w( recq/scivscomputer.js )
Rails.application.config.assets.precompile += %w( recq/scivsmedicine.js )
Rails.application.config.assets.precompile += %w( recq/scivslang.js )
Rails.application.config.assets.precompile += %w( recq/lawvshuman.js )
Rails.application.config.assets.precompile += %w( recq/lawvscomputer.js )
Rails.application.config.assets.precompile += %w( recq/lawvsmedicine.js )
Rails.application.config.assets.precompile += %w( recq/lawvslang.js )
Rails.application.config.assets.precompile += %w( recq/humanvscomputer.js )
Rails.application.config.assets.precompile += %w( recq/humanvsmedicine.js )
Rails.application.config.assets.precompile += %w( recq/humanvslang.js )
Rails.application.config.assets.precompile += %w( recq/computervsmedicine.js )
Rails.application.config.assets.precompile += %w( recq/computervslang.js )
Rails.application.config.assets.precompile += %w( recq/medicinevslang.js )
Rails.application.config.assets.precompile += %w( pquiz.js )
Rails.application.config.assets.precompile += %w( mainquiz.js )
Rails.application.config.assets.precompile += %w( draw.js )