# This "hook" is executed right before the site's pages are rendered
Jekyll::Hooks.register :site, :pre_render do |site|
  puts "Registering ALG lexer..."
  require "rouge"

  # This class defines the ALG lexer which is used to highlight "alg" code snippets during render-time
  class ALGLexer < Rouge::RegexLexer
    title 'ALG'
    desc 'mmCEsim ALG Language'
    tag 'alg'
    filenames '*.alg', '*.mmcesim-alg'

    state :root do
      rule %r/#.*$/, Comment::Single
      rule %r/(COMMENT)(\s)(.*)$/ do
        groups Keyword::Reserved, Text::Whitespace, Literal::String
      end
      rule %r/(BRANCH|BREAK|CALC|CALL|CPP|ESTIMATE|FUNC|INIT|MATLAB|MERGE|NEW|OCTAVE|PRINT|PYTHON|RECOVER|ELSE|ELIF|FOR|FOREVER|FUNCTION|IF|LOOP|WHILE|END|ELSE|ELIF|LOG)\b/, Keyword::Reserved
      rule %r/(true|false)/, Name::Constant
      
      rule %r/".*?"/m, Literal::String
      rule %r/'.*?'/m, Literal::String
      
      # for C++ with ::
      rule %r/std::\w+/, Name
      
      rule %r/::[0-9A-Za-z]*/, Keyword::Type
      rule %r/::/, Punctuation # not used
      
      rule %r/\\[0-9A-Za-z_]+/, Name::Function::Magic
      rule %r/\`([\w.\]*\[]+)\`/, Str::Backtick

      rule %r/(begin|cond|end|from|init|to|step|scale|fill|dtype|key1|key2|num)=/, Name::Label

      rule %r/\^[TtHIi]/, Operator
      rule %r/(\^(\*|\\star|\\ast))|\^\{([TtHIi\*]|\\star|\\ast|-1)\}/, Operator

      rule %r/[+-]?[0-9]+\.[0-9]*E[+-]?[0-9]+/, Literal::Number::Float
      rule %r/[+-]?\.[0-9]+E[+-]?[0-9]+/, Literal::Number::Float
      rule %r/[+-]?[0-9]+E[+-]?[0-9]+/, Literal::Number::Float
      rule %r/[+-]?[0-9]*\.[0-9]+?/, Literal::Number::Float
      rule %r/[+-]?[0-9]+/, Literal::Number::Integer

      rule %r/&&/, Operator
      rule %r/\|\|/, Operator
      rule %r/!=/, Operator
      rule %r/==/, Operator
      rule %r/(\.|)\*/, Operator
      rule %r/@/, Operator
      rule %r/\+/, Operator
      rule %r/-/, Operator
      rule %r/\=/, Operator
      rule %r/(\.|)\//, Operator
      rule %r/:/, Operator
      rule %r/(\.|)%/, Operator
      rule %r/\./, Punctuation
      rule %r/,/, Punctuation
      rule %r/;/, Punctuation
      rule %r/!/, Punctuation
      rule %r/>/, Punctuation
      rule %r/</, Punctuation
      rule %r/\(/, Punctuation
      rule %r/\)/, Punctuation
      rule %r/\{/, Punctuation
      rule %r/\}/, Punctuation
      rule %r/\[/, Punctuation
      rule %r/\]/, Punctuation
      rule %r/\^\^/, Punctuation

      rule %r/\s+/, Text::Whitespace

      rule %r/[\w\$]+/, Name
    end
  end
end
