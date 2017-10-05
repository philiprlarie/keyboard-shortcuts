# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"

atom.commands.add 'atom-text-editor', 'custom:line-down-multi', ->
  editor = atom.workspace.getActiveTextEditor()
  editor.moveDown(5)

atom.commands.add 'atom-text-editor', 'custom:line-up-multi', ->
  editor = atom.workspace.getActiveTextEditor()
  editor.moveUp(5)

atom.commands.add 'atom-text-editor', 'custom:uppercase-word', ->
  editor = atom.workspace.getActiveTextEditor()
  editor.upperCase()
  editor.moveRight()
  editor.moveRight()

atom.commands.add 'atom-text-editor', 'custom:lowercase-word', ->
  editor = atom.workspace.getActiveTextEditor()
  editor.lowerCase()
  editor.moveRight()
  editor.moveRight()

atom.commands.add 'atom-text-editor', 'custom:capitalize-word', ->
  editor = atom.workspace.getActiveTextEditor()
  editor.replaceSelectedText selectWordIfEmpty: true, (text) ->
    text.replace /\b\w+\b/g, (word) ->
      word.slice(0, 1).toUpperCase() + word.slice(1).toLowerCase()
  editor.moveRight()
  editor.moveRight()

atom.commands.add 'atom-text-editor', 'custom:just-one-space', ->
  editor = atom.workspace.getActiveTextEditor()
  editor.insertText ' ', undo: 'skip'
  editor.deleteToPreviousWordBoundary undo: 'skip' # TODO: how to skip this?


  curPoint = editor.getCursorBufferPosition()
  lineText = editor.lineTextForBufferRow(curPoint.row)
  lineLength = lineText.length
  if lineText.slice(curPoint.column).match(/^[ \t]*$/) # rest of line is spaces or tabs
    editor.setTextInBufferRange([curPoint, [curPoint.row, lineLength]], '', undo: 'skip')
  else
    editor.insertText ' ', undo: 'skip'
    editor.moveLeft()
    editor.deleteToNextWordBoundary undo: 'skip' # TODO: and this?
  editor.insertText ' '

atom.commands.add 'atom-text-editor', 'custom:kill-sexp', ->
    editor = atom.views.getView(atom.workspace.getActiveTextEditor())
    return unless editor
    atom.commands.dispatch(editor, 'atomic-emacs:mark-sexp')
    atom.commands.dispatch(editor, 'atomic-emacs:kill-region')


  # row = curPoint.row
  #
  # left = curPoint.column
  # right = curPoint.column
  # while (left - 1 >= 0) {
  #   char = editor.getTextInBufferRange([
  #     [row, left - 1],
  #     [row, left]
  #   ])
  #   if char.match(/[ \t]/) {
  #     left -= 1
  #   } else {
  #     break
  #   }
  # }
  # editor.setTextInBufferRange([[row, left], [row, right]], text, [options])
