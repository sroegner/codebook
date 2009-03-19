module CodebookHelper

  require 'coderay'

  def supported_languages
    languages = CodeRay::FileType::TypeFromExt.values.collect{|s| s.to_s}
    languages.uniq!.sort!
  end

end
