{extname} = require 'path'

module.exports =
	config:
		useSourcepawnForIncFiles:
			type: 'boolean'
			default: true
			title: 'Use Sourcepawn grammar for .inc files'
			description: 'Overrides PHP behavior in .inc files due to an Atom limitation'

fileTypes =
	'.inc': 'source.sourcepawn'

	activate: ->
		atom.workspace.observeTextEditors (editor) ->
			scopeName = fileTypes[extname editor.getPaths()[0]]
			return unless scopeName?
			grammar = atom.grammars.grammarForScopeName scopeName
			return unless grammar?
			editor.setGrammar grammar