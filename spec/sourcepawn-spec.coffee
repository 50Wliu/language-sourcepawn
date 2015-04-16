describe 'Sourcepawn grammar', ->
	grammar=null

	beforeEach ->
		waitsForPromise ->
			atom.packages.activatePackage('language-sourcepawn')

		runs ->
			grammar = atom.grammars.grammarForScopeName('source.sp')

	it 'parses the grammar', ->
		expect(grammar).toBeDefined()
		expect(grammar.scopeName).toBe 'source.sp'

	describe 'constants', ->
		it 'tokenizes constant variables', ->
			{tokens} = grammar.tokenizeLine('SOMETHING')
			expect(tokens[0]).toEqual value: 'SOMETHING', scopes: ['source.sp', 'constant.other.sp']
			{tokens} = grammar.tokenizeLine('something')
			expect(tokens[0]).toEqual value: 'something', scopes: ['source.sp']
		it 'tokenizes numbers', ->
			{tokens} = grammar.tokenizeLine('0')
			expect(tokens[0]).toEqual value: '0', scopes: ['source.sp', 'constant.numeric.sp']
		it 'tokenizes language constants', ->
			{tokens} = grammar.tokenizeLine('null')
			expect(tokens[0]).toEqual value: 'null', scopes: ['source.sp', 'constant.language.sp']
			{tokens} = grammar.tokenizeLine('true')
			expect(tokens[0]).toEqual value: 'true', scopes: ['source.sp', 'constant.language.sp']
			{tokens} = grammar.tokenizeLine('INVALID_HANDLE')
			expect(tokens[0]).toEqual value: 'INVALID_HANDLE', scopes: ['source.sp', 'constant.language.sp']
			{tokens} = grammar.tokenizeLine('APLRes_Success')
			expect(tokens[0]).toEqual value: 'APLRes_Success', scopes: ['source.sp', 'constant.language.sp']
			{tokens} = grammar.tokenizeLine('Plugin_Continue')
			expect(tokens[0]).toEqual value: 'Plugin_Continue', scopes: ['source.sp', 'constant.language.sp']