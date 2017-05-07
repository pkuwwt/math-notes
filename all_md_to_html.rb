#!/usr/bin/env ruby

load('kramdown_to_html.rb');
require 'fileutils'

def md_file_to_html(mdfilename)
	return render_markdown_file_with_katex(mdfilename)
end

def find_all_files(path=".", extension="md")
	return Dir.glob("#{path}/**/*.#{extension}")
end

def dirname(path)
	return File.dirname(path)
end

def basename(path)
	return File.basename(path)
end

def mkdir(dirname)
	if not File::exists?(dirname)
		FileUtils.mkdir_p dirname
	end
end

def rmdir(dirname)
	if File::exists?(dirname)
		FileUtils.rm_rf(dirname)
	end
end

def get_html_filename(md_file)
	return File.basename(md_file, ".md") + ".html"
end

def save_text(text, filename)
	File.open(filename, 'w') do |f|
		f.write(text)
	end
end

def main()
	base = "html"
	rmdir(base)
	md_files = find_all_files(".", "md")
	md_files.each do |f|
		md_base_file = basename(f)
		html_file = get_html_filename(f)
		html_path = base + "/" + dirname(f)
		mkdir(html_path)
		html = md_file_to_html(f)
		save_text(html, html_path + "/" + get_html_filename(md_base_file))
	end
end

if __FILE__ == $0
	main
end
