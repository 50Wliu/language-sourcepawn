{extname} = require 'path'

module.exports =
	config:
		useSourcepawnForIncFiles:
			type: 'boolean'
			default: true
			title: 'Use Sourcepawn grammar for .inc files'
			description: 'Overrides PHP behavior in .inc files due to an Atom limitation'

	activate: (state) ->
		atom.workspace.observeTextEditors (editor) ->
			if atom.config.get 'language-sourcepawn.useSourcepawnForIncFiles'
				extension = extname editor.getTitle()
				if extension is '.inc'
					scopeName = 'source.sp'
					grammar = atom.grammars.grammarForScopeName scopeName
					editor.setGrammar grammar unless grammar?