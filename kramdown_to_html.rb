
require "kramdown";

$mathjax_script = " \
<script type=\"text/javascript\" async \n\
  src=\"https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-MML-AM_CHTML\"> \n\
  </script> \n\
"
$katex_script=" \
<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.7.1/katex.min.css\" integrity=\"sha384-wITovz90syo1dJWVh32uuETPVEtGigN07tkttEqPv+uR2SE/mbQcG7ATL28aI9H0\" crossorigin=\"anonymous\"> \n\
<script src=\"https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.7.1/katex.min.js\" integrity=\"sha384-/y1Nn9+QQAipbNQWU65krzJralCnuOasHncUFXGkdwntGeSvQicrYkiUBwsgUqc1\" crossorigin=\"anonymous\"></script> \n\
"

# there is a bug for kramdown
# the inline math is not recognized in <li></li>
$katex_config_script=" \
<script src=\"https://code.jquery.com/jquery-1.12.4.js\"></script> \n\
<script> \n\
var tex_alias = {Ba:'mathbf{a}', Bb:'mathbf{b}', Bc:'mathbf{c}', Be: 'mathbf{e}', Bf:'mathbf{f}', Bh:'mathbf{h}', Bw:'mathbf{w}', Bx:'mathbf{x}', By:'mathbf{y}', Bz:'mathbf{z}', BX:'mathbf{X}',BY:'mathbf{Y}', BZ:'mathbf{Z}', bE:'mathbb{E}', bG:'mathbb{G}', bR:'mathbb{R}', bZ:'mathbb{Z}', cN: 'mathcal{N}'}; \n\
var replace_tex_alias = function(text) {
	for(var key in tex_alias) {
		text = text.replace(new RegExp('\\\\\\\\'+key, 'g'), '\\\\'+tex_alias[key]);
	}
	return text;
};
window.onload = function() { \n\
$(\"script[type='math/tex']\").replaceWith(function() { \n\
	var tex = $(this).text(); \n\
	tex = replace_tex_alias(tex); \n\
	return katex.renderToString(tex, {displayMode: false}); \n\
}); \n\
$(\"script[type='math/tex; mode=display']\").replaceWith(function() { \n\
	var mode = $(this).parent()[0].nodeName.toLowerCase()!=\"li\"; \n\
	var html = $(this).html(); \n\
	html = replace_tex_alias(html); \n\
	return katex.renderToString(html.replace(/%.*/g, ''), {displayMode: mode}); \n\
}); \n\
}; \n\
</script> \n\
"
def get_html(head="", body="")
	return "<!DOCTYPE html>\n<html>\n<head>\n" + head + "</head>\n<body>\n" + body + "</body>\n</html>\n" 
end

def render_with_mathjax(text)
	md = Kramdown::Document.new(text).to_html
	return get_html($mathjax_script, md)
end

def render_with_katex(text)
	md = Kramdown::Document.new(text).to_html
	return get_html($katex_script + $katex_config_script, md)
end

def render_markdown_file_with_katex(filename)
	text = File.read(filename)
	return render_with_katex(text)
end

def render_markdown_file_with_mathjax(filename)
	text = File.read(filename)
	return render_with_katex(text)
end

def get_sample_markdown
	return "# Test\n$$\na^2+b^2=c^2\n$$"
end

def main()
	if ARGV.length==0
		puts "USAGE: #{__FILE__} input.md"
		puts "Sample markdown file: \n" + get_sample_markdown
	elsif ARGV.length==1 and File::exists?(ARGV[0])
		puts render_markdown_file_with_katex(ARGV[0])
	else
		puts "USAGE: #{__FILE__} input.md"
		puts "Sample markdown file: \n" + get_sample_markdown
		puts "ERROR: File #{ARGV[0]} not exist"
	end
end

if __FILE__ == $0 
	main
end

