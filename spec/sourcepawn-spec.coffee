describe 'Sourcepawn grammar', ->
  grammar=null

  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage 'language-sourcepawn'

    runs ->
      grammar = atom.grammars.grammarForScopeName 'source.sp'

  it 'parses the grammar', ->
    expect(grammar).toBeDefined()
    expect(grammar.scopeName).toBe 'source.sp'

  describe 'constants', ->
    it 'tokenizes constant variables', ->
      {tokens} = grammar.tokenizeLine 'SOMETHING'
      expect(tokens[0]).toEqual value: 'SOMETHING', scopes: ['source.sp', 'constant.other.sp']

      {tokens} = grammar.tokenizeLine 'something'
      expect(tokens[0]).toEqual value: 'something', scopes: ['source.sp']

    it 'tokenizes numbers', ->
      {tokens} = grammar.tokenizeLine '0'
      expect(tokens[0]).toEqual value: '0', scopes: ['source.sp', 'constant.numeric.sp']

    it 'tokenizes language constants', ->
      {tokens} = grammar.tokenizeLine 'null'
      expect(tokens[0]).toEqual value: 'null', scopes: ['source.sp', 'constant.language.sp']

      {tokens} = grammar.tokenizeLine 'true'
      expect(tokens[0]).toEqual value: 'true', scopes: ['source.sp', 'constant.language.sp']

      {tokens} = grammar.tokenizeLine 'INVALID_HANDLE'
      expect(tokens[0]).toEqual value: 'INVALID_HANDLE', scopes: ['source.sp', 'constant.language.sp']

      {tokens} = grammar.tokenizeLine 'APLRes_Success'
      expect(tokens[0]).toEqual value: 'APLRes_Success', scopes: ['source.sp', 'constant.language.sp']

      {tokens} = grammar.tokenizeLine 'Plugin_Continue'
      expect(tokens[0]).toEqual value: 'Plugin_Continue', scopes: ['source.sp', 'constant.language.sp']

  describe 'the return keyword', ->
    it 'tokenizes return statements', ->
      {tokens} = grammar.tokenizeLine 'return'
      expect(tokens[0]).toEqual value: 'return', scopes: ['source.sp', 'keyword.control.sp']

      {tokens}  = grammar.tokenizeLine 'return false'
      expect(tokens[0]).toEqual value: 'return', scopes: ['source.sp', 'keyword.control.sp']
      expect(tokens[2]).toEqual value: 'false', scopes: ['source.sp', 'constant.language.sp']

    it 'tokenizes complex return statements', ->
      {tokens} = grammar.tokenizeLine '{ return StringToInt(something) == 1 }'
      expect(tokens[2]).toEqual value: 'return', scopes: ['source.sp', 'meta.block.sp', 'keyword.control.sp']
      expect(tokens[4]).toEqual value: 'StringToInt', scopes: ['source.sp', 'meta.block.sp', 'meta.function-call.sp', 'support.function.any-method.sp']
      expect(tokens[7]).toEqual value: '==', scopes: ['source.sp', 'meta.block.sp', 'keyword.operator.comparison.sp']
      # ^ this token should be 9, but language-c has a bug where function calls aren't tokenized past the opening parentheses: https://github.com/atom/language-c/issues/124

  describe 'preprocessors', ->
    it 'tokenizes them', ->
      {tokens} = grammar.tokenizeLine '#define HI 64'
      expect(tokens[0]).toEqual value: '#', scopes: ['source.sp', 'meta.preprocessor.macro.sp', 'keyword.control.directive.define.sp', 'punctuation.definition.directive.sp']
      expect(tokens[1]).toEqual value: 'define', scopes: ['source.sp', 'meta.preprocessor.macro.sp', 'keyword.control.directive.define.sp']
      expect(tokens[2]).toEqual value: ' ', scopes: ['source.sp', 'meta.preprocessor.macro.sp']
      expect(tokens[3]).toEqual value: 'HI', scopes: ['source.sp', 'meta.preprocessor.macro.sp', 'entity.name.function.preprocessor.sp']
      expect(tokens[4]).toEqual value: ' ', scopes: ['source.sp', 'meta.preprocessor.macro.sp']
      expect(tokens[5]).toEqual value: '64', scopes: ['source.sp', 'meta.preprocessor.macro.sp', 'constant.numeric.sp']
