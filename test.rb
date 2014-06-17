require 'digest/md5'

puts Digest::MD5.digest(File.read("D:/win7Part/Downloads/Wallpaper/2 be sorted/1.jpg")).class
puts Digest::MD5.hexdigest(File.read("D:/win7Part/Downloads/Wallpaper/2 be sorted/1.jpg")).class