module MarkdownHelper
  def markdown(content)
    options = {
      filter_html: true,
      hard_wrap: true,
      space_after_headers: true,
      with_toc_data: true
    }
    extensions = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      strikethrough: true,
      tables: true,
      superscript: true,
      highlight: true,
      quote: true,
      underline: true,
      footnotes: true
    }
    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    markdown.render(content).html_safe
  end

  def toc(content)
    toc_option = {
      nesting_level: 2
    }

    toc_renderer = Redcarpet::Render::HTML_TOC.new
    toc = Redcarpet::Markdown.new(toc_renderer, toc_option)
    toc.render(content).html_safe
  end
end
