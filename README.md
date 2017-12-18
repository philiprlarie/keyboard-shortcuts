# Setting up your Mac with your own customizable keyboard shortcuts

### DefaultKeyBinding.dict
This file should exist in the path `~/Library/KeyBindings/DefaultKeyBinding.dict`. Your mac will read this file to bind actions to key sequences that you give. These bindings will work system wide, but some may be overridden by applications (for example, Atom or Intellij will override or ignore most of they contents of DefaultKeyBinding.dict). These bindings will work on most native Mac applications such as Notes or Keynote.

`^` - control key
`~` - alt key
`@` - command key

For more information, checkout http://osxnotes.net/keybindings.html and https://www.hcs.harvard.edu/~jrus/site/cocoa-text.html.

Note that you will need to restart an application after changing DefaultKeyBinding.dict for the changes in keybinding to take effect. Also, watch out for "dead keys" like alt-n. Dead keys are used to type accents and special characters. See the section about "dead keys" to learn how to remove them.

### Bash
`.inputrc` - will register different key bindings for bash to interpret.

`.bashrc` - store all of your personal bash settings here. `.bash_profile` is executed for login shells, while `.bashrc` is executed for interactive non-login shells. I find it best to put everything in `.bashrc` and to simply source `.bashrc` from inside `.bash_profile`. That way `.bash_profile` will simply read and execute what is in `.bashrc` and login shells and interactive non-login shells will behave the same way.

`.bash_profile` - should simply contain:
```
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
```

`.lesskey` - the "Less" pager can have keybindings attached. The default Less that comes with Mac is not fully baked and doesn't have lesskey functionality. Try `$ which lesskey`. If you come up empty, do `$ brew install less` to get a better version of less. From there, you can create a `.lesskey` file and run `$ lesskey`. This command will read your `.lesskey` file and will output a `.less` file that Less uses to configure the keybindings. See `$ man lesskey` for more info.

`.emacs` - Emacs will read this init file each time it starts up.
