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

atom.commands.add 'atom-text-editor', 'custom:select-down-multi', ->
  editor = atom.workspace.getActiveTextEditor()
  editor.selectDown(5)

atom.commands.add 'atom-text-editor', 'custom:select-up-multi', ->
  editor = atom.workspace.getActiveTextEditor()
  editor.selectUp(5)

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

atom.commands.add 'body', 'custom:show-next-item', ->
  centerPane = atom.workspace.getCenter().getActivePane()
  centerPane.focus()
  centerPane.activateNextItem()

atom.commands.add 'body', 'custom:show-previous-item', ->
  centerPane = atom.workspace.getCenter().getActivePane()
  centerPane.focus()
  centerPane.activatePreviousItem()

defineShowItemAt = (number) ->
  atom.commands.add 'body', 'custom:show-item-' + number, ->
    centerPane = atom.workspace.getCenter().getActivePane()
    centerPane.focus()
    centerPane.activateItemAtIndex(number - 1)

for number in [1..8]
  defineShowItemAt(number)

atom.commands.add 'body', 'custom:show-item-9', ->
  centerPane = atom.workspace.getCenter().getActivePane()
  centerPane.focus()
  centerPane.activateLastItem()

atom.commands.add 'atom-text-editor',
  'editor:wrap-with-strong': ->
    editor = atom.workspace.getActiveTextEditor()
    checkPt = editor.createCheckpoint()
    for selection in editor.getSelections()
      textToWrap = selection.getText()
      selection.insertText("<strong>#{textToWrap}</strong>")
    editor.groupChangesSinceCheckpoint(checkPt)

atom.commands.add 'atom-text-editor',
  'editor:wrap-with-cloze': ->
    editor = atom.workspace.getActiveTextEditor()
    checkPt = editor.createCheckpoint()
    for selection in editor.getSelections()
      textToWrap = selection.getText()
      cursor = selection.cursor
      rangeOfInsertedText = selection.insertText("{{c::#{textToWrap}}}")
      newCursorPosition = rangeOfInsertedText.start.copy()
      newCursorPosition.column += 3
      cursor.setBufferPosition(newCursorPosition)
    editor.groupChangesSinceCheckpoint(checkPt)

convertSelectionToIndexNumber = (selection, idx) ->
  selection.insertText (idx + 1).toString(), select: true
  return

atom.commands.add 'atom-text-editor',
  'editor:multi-cursor-tonum': ->
    editor = atom.workspace.getActiveTextEditor()
    checkPt = editor.createCheckpoint()
    editor.getSelections().forEach(convertSelectionToIndexNumber)
    editor.groupChangesSinceCheckpoint(checkPt)

incrementSelection = (selection, idx) ->
  foundText = selection.getText()
  foundNum = +foundText
  if foundNum.toString() == foundText and foundText != 'NaN'
    newText = (foundNum + 1).toString()
    selection.insertText newText, select: true
  return

atom.commands.add 'atom-text-editor',
  'editor:multi-cursor-increment': ->
    editor = atom.workspace.getActiveTextEditor()
    checkPt = editor.createCheckpoint()
    editor.getSelections().forEach(incrementSelection)
    editor.groupChangesSinceCheckpoint(checkPt)

decrementSelection = (selection, idx) ->
  foundText = selection.getText()
  foundNum = +foundText
  if foundNum.toString() == foundText and foundText != 'NaN'
    newText = (foundNum - 1).toString()
    selection.insertText newText, select: true
  return

atom.commands.add 'atom-text-editor',
  'editor:multi-cursor-decrement': ->
    editor = atom.workspace.getActiveTextEditor()
    checkPt = editor.createCheckpoint()
    editor.getSelections().forEach(decrementSelection)
    editor.groupChangesSinceCheckpoint(checkPt)
