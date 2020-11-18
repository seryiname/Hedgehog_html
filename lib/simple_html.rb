require 'nokogiri'

class TransfHtml
  def initialize(file_path = template_index_path)
    @file_path = file_path 
  end

  def make_html(bypass_html: false)
    content = File.read(@file_path)
    template_content = File.read(template_index_path)
    doc = Nokogiri::HTML(content)
    doc.xpath("//script").remove unless bypass_html 
    trimmed_content = doc.css('body').to_xhtml
    @html_new = "#{self.class.root}/new_index.html"
    File.open(@html_new, 'w') {|f|
      template_content.gsub!('{{content}}', trimmed_content)
      f.puts template_content 
    }
  end

  def open_html(bypass_html: false)
    make_html(bypass_html: bypass_html)
    system("xdg-open #{@html_new}")
  end

  def template_index_path
    index_path = "#{self.class.root}/index.html"
  end

  def self.root
    File.expand_path '..', __FILE__
  end
end