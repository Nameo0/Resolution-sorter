#!/usr/bin/env ruby

require 'fastimage'

def resolution_finder(image_link)
  FastImage.size(image_link)
end

size = resolution_finder("D:/win7Part/Downloads/Wallpaper/2 be sorted/1399441664160.jpg")
width = size[0]
height = size[1]

file_name = Pathname.new("D:/win7Part/Downloads/Wallpaper/2 be sorted/1399441664160.jpg").basename

puts "height = #{height}"
puts "width = #{width}"
# puts Dir["D:/win7part/Downloads/Wallpaper/2 be sorted/*"].empty?

#while true
  if Dir["D:/win7part/Downloads/Wallpaper/2 be sorted/*"].empty?
    puts "Directory is empty"
  else
    puts "Directory is stuffy"
    if File.directory?("D:/win7Part/Downloads/Wallpaper/#{width}x#{height}")
      puts "Files will be put into folder"
      File.rename("D:/win7part/Downloads/Wallpaper/2 be sorted/#{file_name}", "D:/win7Part/Downloads/Wallpaper/#{width}x#{height}/#{file_name}")
    else
      puts "Folder will be made and files put in"
    end    
  end
  #sleep 300
#end