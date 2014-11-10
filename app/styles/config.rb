# Require any additional compass plugins here.

require 'fileutils'

require 'bundler/setup'
require 'bootstrap-sass'

# Set this to the root of your project when deployed:
http_path = "/"
css_dir = "css"
sass_dir = "sass"
images_dir = "../assets/images"
javascripts_dir = "../scripts"
fonts_dir = "fonts"
generated_images_dir = "compiled_images"
sprite_load_path = "sprites"

# You can select your preferred output style here (can be overridden via the command line):
# :expanded or :nested or :compact or :compressed
output_style = :expanded 

# To enable relative paths to assets via compass helper functions. Uncomment:
relative_assets = true

# To disable debugging comments that display the original location of your selectors. Uncomment:
line_comments = false


# If you prefer the indented syntax, you might want to regenerate this
# project again passing --syntax sass, or you can uncomment this:
# preferred_syntax = :sass
# and then run:
# sass-convert -R --from scss --to sass sass scss && rm -rf sass && mv scss sass
#

sass_options = {:unix_newlines=>true}
line_comments = false
preferred_syntax = :scss

# Rename sprites to remove the Compass-generated hash
on_sprite_saved do |filename|
	newname = filename.gsub(%r{-s[a-z0-9]{10}\.png$}, '.png')
	if File.exists?(filename)
		FileUtils.mv filename, newname
	end
	puts "\t  => Renamed to #{File.basename newname}"
	newname
end

REGEXP_REMS=/(:.*?)([0-9.]+)rem(\s*)/ ;
REGEXP_PNG=/-s[a-z0-9]{10}\.png/ ;

# Replace in stylesheets generated references to sprites
# by their counterparts without the hash uniqueness.
on_stylesheet_saved do |filename|
	filename_new = "%s.new" % filename

	if File.exists?(filename)
		fnew = File.open(filename_new, 'w')
		fold = File.open(filename, 'r')
		while (li = fold.gets) do
			case li
			when REGEXP_REMS then
				prefix = $1
				rem_val = $2
				suffix = $3
				# compute and rewrite for IE8
				val_px = (rem_val.to_f * 10).to_i
				rw_li = li.gsub(REGEXP_REMS, '%s%spx%s' % [prefix, val_px, suffix])
				# debug :
				# puts "REM match   : %s" % li
			   	# puts "	  rewrite : %s" % rw_li
				fnew << rw_li
				# real rule
				fnew << li
			when REGEXP_PNG then
				fnew << li.gsub(REGEXP_PNG, '.png')
			else
				# simple copy
				fnew << li
			end
		end
		fnew.close
		fold.close
		FileUtils.mv filename_new, filename
	end
	filename
end

=begin
	css = File.read filename

	File.open(filename, 'w+') do |f|
	  f << css.gsub(%r{-s[a-z0-9]{10}\.png}, '.png')
	end
=end


