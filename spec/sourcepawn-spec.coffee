describe 'Sourcepawn grammar', ->
	grammar=null

	beforeEach ->
		waitsForPromise ->
			atom.packages.activatePackage('language-sourcepawn')

		runs ->
			grammar=atom.grammars.grammarForScopeName('source.sourcepawn')

	it 'parses the grammar', ->
		expect(grammar).toBeDefined()
		expect(grammar.scopeName).toBe 'source.sourcepawn'

	describe 'constants', ->
		it 'tokenizes constant variables', ->
			{tokens} = grammar.tokenizeLine('SOMETHING')
			expect(tokens[0]).toEqual value: 'SOMETHING', scopes: ['source.sourcepawn', 'constant.other.sourcepawn']
			{tokens} = grammar.tokenizeLine('something')
			expect(tokens[0]).toEqual value: 'something', scopes: ['source.sourcepawn']
		it 'tokenizes numbers', ->
			{tokens} = grammar.tokenizeLine('0')
			expect(tokens[0]).toEqual value: '0', scopes: ['source.sourcepawn', 'constant.numeric.sourcepawn']
		it 'tokenizes language constants', ->
			{tokens} = grammar.tokenizeLine('null')
			expect(tokens[0]).toEqual value: 'null', scopes: ['source.sourcepawn', 'constant.language.sourcepawn']
			{tokens} = grammar.tokenizeLine('true')
			expect(tokens[0]).toEqual value: 'true', scopes: ['source.sourcepawn', 'constant.language.sourcepawn']
			{tokens} = grammar.tokenizeLine('INVALID_HANDLE')
			expect(tokens[0]).toEqual value: 'INVALID_HANDLE', scopes: ['source.sourcepawn', 'constant.language.sourcepawn']
			{tokens} = grammar.tokenizeLine('APLRes_Success')
			expect(tokens[0]).toEqual value: 'APLRes_Success', scopes: ['source.sourcepawn', 'constant.language.sourcepawn']
			{tokens} = grammar.tokenizeLine('Plugin_Continue')
			expect(tokens[0]).toEqual value: 'Plugin_Continue', scopes: ['source.sourcepawn', 'constant.language.sourcepawn']