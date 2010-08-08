module CodeDocumentsHelper

  require 'coderay'
  require 'coderay/helpers/file_type'
  
  def code_highlight(lang, code)
    l = lang.to_s.downcase
    all_languages = supported_languages
    if all_languages.include?(l)
      return (CodeRay.scan code, l).div
    elsif language_substitute(l)
      return (CodeRay.scan code, language_substitute(l)).div
    else
      return h(code)
    end
  end

  # add reasonable substitutions for some "languages" that have their own id
  def language_substitute(lang_name)
    subs = {"ant" => "xml", "pl/sql" => "sql"}
    subs[lang_name.to_s.downcase]
  end

  def supported_languages
    languages = CodeRay::FileType::TypeFromExt.values.collect{|s| s.to_s}
    languages.uniq!.sort!
  end

end

