require 'simplecov'

SimpleCov.start do
  minimum_coverage 90

	add_group "Models", "app/models"
	add_group "Controllers", "app/controllers"
	add_group "Helpers", "app/helpers"
	add_group "Config Files", "config"
  add_group "Tests", "features"
	
end