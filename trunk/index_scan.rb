#!/usr/bin/env ruby

FILE_ENCODING = (RUBY_VERSION.include? '1.8') ? "\n" : {:encoding => 'iso-8859-1'}

File.open '.packages_path.mk', 'w' do |fout|
  fout.puts "# Automatically generated file. Yours sincerely, script #{__FILE__}. #{Time.now}.\n\n"

  Dir['../openwrt_trunk/feeds/*.index'].each do |fn|
    puts 'Processing: ' + fn

    fpath = File.expand_path(fn[0..fn.rindex('/feeds/')]) + '/'
    package_path = package = ""

    File.readlines(fn, FILE_ENCODING).each do |line|
      param, val = line.chomp.split ': '

      case param
      when 'Source-Makefile'
        package_path = fpath + val[0..val.rindex('/Makefile')]
      when 'Package'
        package = val.downcase
        fout.puts %Q(PK_NAME_#{package}="#{package_path}")
      end

    end
  end
end
