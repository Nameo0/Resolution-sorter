#!/usr/bin/env ruby

require 'fastimage'     # used to get image resolution
require 'mime/types'  # used to check file type

def resolution_finder(image_link)
  FastImage.size(image_link)
end

def unique_name(compared_item, item_to_sort)
  if compared_item == item_to_sort
    puts "!(unique)"
    return false  # The file names are not unique
  else
    puts "unique"
    return true   # The file names are unique
  end
end

def is_image_file(file_name)
  file_type = "#{MIME::Types.type_for(file_name)}"
  if file_type.include? 'image'
    return true   # The file is an image
  else
    return false  # The file is not an image
  end
end

# file_name = Pathname.new("D:/win7Part/Downloads/Wallpaper/2 be sorted/1399441664160.jpg").basename

#while true
  if Dir["D:/win7part/Downloads/Wallpaper/2 be sorted/*"].empty?
    puts "Directory is empty"
  else
    puts "Directory is stuffy"
    files_moved_counter = 0
    Dir.foreach("D:/win7Part/Downloads/Wallpaper/2 be sorted") do |item_to_sort|
      next if is_image_file(item_to_sort) == false
      puts item_to_sort
      size = resolution_finder("D:/win7Part/Downloads/Wallpaper/2 be sorted/#{item_to_sort}")
      width = size[0]
      height = size[1]

      item_to_sort_new = item_to_sort
      item_to_sort_test = item_to_sort
      i = false # Just initializing to make into a global variable (Just in case)
      all_clear = false

      if File.directory?("D:/win7Part/Downloads/Wallpaper/#{width}x#{height}")
        puts "File #{item_to_sort} will be put into folder #{width}x#{height}"
        name_conflict_counter = 0
        name_conflict_counter_test = name_conflict_counter
        while all_clear == false
          Dir.foreach("D:/win7Part/Downloads/Wallpaper/#{width}x#{height}") do |item_existing|
            #test_counter = 0
            name_conflict = true
            while name_conflict == true
              puts item_existing
              if name_conflict_counter == 0
                i = unique_name(item_existing, item_to_sort)
              else
                i = unique_name(item_existing, item_to_sort_new)
              end
              puts i
              if i == false  # If the file name is not unique
                if name_conflict_counter == 0
                  item_to_sort_new = item_to_sort_new.sub("#{File.extname(item_to_sort)}", " - copy(#{name_conflict_counter})#{File.extname(item_to_sort)}")
                  name_conflict_counter += 1
                else
                  item_to_sort_new = item_to_sort_new.sub("copy(#{name_conflict_counter-1})", "copy(#{name_conflict_counter})")
                  name_conflict_counter += 1
                end
              else            # If the file name is unique
                name_conflict = false
              end
              #puts item_to_sort_new
            end
            #puts name_conflict_counter
          end
          if name_conflict_counter_test == name_conflict_counter
            all_clear = true
          else
            name_conflict_counter_test = name_conflict_counter
          end
        end
        File.rename("D:/win7part/Downloads/Wallpaper/2 be sorted/#{item_to_sort}", "D:/win7Part/Downloads/Wallpaper/#{width}x#{height}/#{item_to_sort_new}")
      else
        puts "Folder #{width}x#{height} will be made and file #{item_to_sort} put in"
        Dir.mkdir "D:/win7Part/Downloads/Wallpaper/#{width}x#{height}/"
        File.rename("D:/win7part/Downloads/Wallpaper/2 be sorted/#{item_to_sort}", "D:/win7Part/Downloads/Wallpaper/#{width}x#{height}/#{item_to_sort}")
      end
      files_moved_counter += 1
    end
    puts "There were #{files_moved_counter} files moved"
  end
  #sleep 300
#end