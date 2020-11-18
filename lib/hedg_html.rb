class HedgehogHtml
  def initialize(hedg)
    @hedg = hedg
  end
  
  def transf_html
    content = File.read("#{self.class.root}/hedg_html.html")
    @html_new = "#{self.class.root}/hedg_html_new.html"
    File.open(@html_new, 'w') {|f|
      content.gsub!('{{hedg}}', @hedg.class.to_s)
      content.gsub!('{{name}}', @hedg.name) 
      content.gsub!('{{response}}', @hedg.response.join('<br>')) 
      f.puts content    
    }
  end

  def open_html
    transf_html    
    system("xdg-open #{@html_new}")
  end

  def self.root
    File.expand_path '..', __FILE__
  end
end
