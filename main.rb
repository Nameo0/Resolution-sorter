#!/usr/bin/env ruby

require 'fastimage'

def resolution_finder(image_link)
  FastImage.size(image_link)
end

puts resolution_finder("D:/win7Part/Downloads/Wallpaper/1920x1080/1399441664160.jpg")