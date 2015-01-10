describe 'Sourcepawn grammar', ->
	grammar=null

	beforeEach ->
		waitsForPromise ->
			atom.packages.activatePackage('language-sourcepawn')

		runs ->
			grammar=atom.grammars.grammarForScopeName('source.sourcepawn')

	it 'parses the grammar', ->
		expect(grammar).toBeTruthy()
		expect(grammar.scopeName).toBe 'source.sourcepawn'

	#TODO