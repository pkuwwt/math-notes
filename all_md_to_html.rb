#!/usr/bin/env ruby

load('kramdown_to_html.rb');
require 'fileutils'

def md_file_to_html(mdfilename)
	return render_markdown_file_with_katex(mdfilename)
end

def find_all_files(path=".", extension=".md")
	return Dir.glob("#{path}/**/*#{extension}")
end

def dirname(path)
	return File.dirname(path)
end

def basename(path, ext="")
	if ext==""
		return File.basename(path)
	else
		return File.basename(path, ext)
	end
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

def save_text(text, filename)
	File.open(filename, 'w') do |f|
		f.write(text)
	end
end

def md_to_html(mdfile, htmlfile)
	html = md_file_to_html(mdfile)
	save_text(html, htmlfile)
end

def copyfile(src, dest)
	FileUtils.cp(src,dest)
end

def dir_operation(path, postfix, newpath,postfix_replace, func)
	files = find_all_files(path, postfix)
	#p files
	files.each do |f|
		new_path = newpath + "/" + dirname(f)
		mkdir(new_path)
		newf = new_path + "/" + basename(f, postfix) + postfix_replace
		func.call(f, newf)
	end
end

def main()
	base = "html"
	rmdir(base)
	dir_operation(".", ".md", base, ".html", method(:md_to_html))
	dir_operation(".", ".png", base, ".png", method(:copyfile))
end

if __FILE__ == $0
	main
end
