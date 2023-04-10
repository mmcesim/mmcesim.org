# This "hook" is executed right before the site's pages are rendered
Jekyll::Hooks.register :site, :pre_render do |site|
  puts "Registering LOG lexer..."
  require "rouge"

  # This class defines the ALG lexer which is used to highlight "alg" code snippets during render-time
  class LOGLexer < Rouge::RegexLexer
    title 'LOG'
    desc 'Log'
    tag 'log'
    filenames '*.log'

    state :root do
      rule %r/^\[INFO\]/, Name::Label
      rule %r/^\[WARNING\]/, Keyword::Reserved
      rule %r/^\[ERROR\]/, Name::Exception

      rule %r/./, Name
    end
  end
end
