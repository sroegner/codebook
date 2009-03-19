module CodeDocumentsHelper

  require 'coderay'

  def code_highlight(lang, code)
    l = lang.downcase
    all_languages = supported_languages
    if all_languages.include?(l)
      return (CodeRay.scan code, l).html(:line_numbers => :inline)
    else
      return h(code)
    end
  end

  def supported_languages
    languages = CodeRay::FileType::TypeFromExt.values.collect{|s| s.to_s}
    languages.uniq!.sort!
  end

end
