#!/usr/bin/env ruby

require 'fastimage'
require 'mime/types'

def resolution_finder(image_link)
  FastImage.size(image_link)
end

def unique_rename(file_name)
  
end

def is_image_file(file_name)
  file_type = "#{MIME::Types.type_for(file_name)}"
  if file_type.include? 'image'
    return true # is an image
  else
    return false # not an image
  end
end

file_name = Pathname.new("D:/win7Part/Downloads/Wallpaper/2 be sorted/1399441664160.jpg").basename

#while true
  if Dir["D:/win7part/Downloads/Wallpaper/2 be sorted/*"].empty?
    puts "Directory is empty"
  else
    puts "Directory is stuffy"
    Dir.foreach("D:/win7Part/Downloads/Wallpaper/2 be sorted") do |item_to_sort|
      # next if item_to_sort == '.' or item_to_sort == '..'
      next if is_image_file(item_to_sort) == false
      puts item_to_sort
      size = resolution_finder("D:/win7Part/Downloads/Wallpaper/2 be sorted/#{item_to_sort}")
      width = size[0]
      height = size[1]
      
      if File.directory?("D:/win7Part/Downloads/Wallpaper/#{width}x#{height}")
        puts "Files will be put into folder"
        ## File.rename("D:/win7part/Downloads/Wallpaper/2 be sorted/#{file_name}", "D:/win7Part/Downloads/Wallpaper/#{width}x#{height}/#{file_name}")
        # Dir.foreach("D:/win7Part/Downloads/Wallpaper/#{width}x#{height}") do |item_existing|
          # puts item_existing
        # end
      else
        puts "Folder will be made and files put in"
        Dir.mkdir "D:/win7Part/Downloads/Wallpaper/#{width}x#{height}/"
        ## File.rename("D:/win7part/Downloads/Wallpaper/2 be sorted/#{file_name}", "D:/win7Part/Downloads/Wallpaper/#{width}x#{height}/#{file_name}")
      end
    end
  end
  #sleep 300
#end