#!/usr/bin/env ruby

require 'fastimage'





def resolution_finder
  FastImage.size("D:/win7Part/Downloads/Wallpaper/1920x1080/1399441664160.jpg")
end

puts resolution_finder