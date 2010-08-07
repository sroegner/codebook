module CodeDocumentsHelper

  require 'coderay'
  require 'coderay/helpers/file_type'
  
  def code_highlight(lang, code)
    l = lang.downcase
    all_languages = supported_languages
    if all_languages.include?(l)
      return (CodeRay.scan code, l).div
    else
      return h(code)
    end
  end

  def supported_languages
    languages = CodeRay::FileType::TypeFromExt.values.collect{|s| s.to_s}
    languages.uniq!.sort!
  end

end

