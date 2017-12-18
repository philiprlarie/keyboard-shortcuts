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

### Dead Keys
See https://en.wikipedia.org/wiki/Dead_key#Dead_keys_on_various_keyboard_layouts to learn about dead keys. To remove dead keys on your mac, you need to create a custom keyboard layout. To do that, you can use an app called Ukelele to create a keyboard with no dead keys. I've already done this, so you can also use mine. You need to copy `keyboard-layout/Resources/U.S.\ fewer\ dead\ keys.keylayout` and `keyboard-layout/Resources/U.S.\ fewer\ dead\ keys.icns` (to get the american flag icon) into `~/Library/Keyboard\ Layouts/`. You will need to restart your computer after copying these files. Then you can choose this keyboard layout from System Preferences -> Keyboard -> Input Sources.

### Karabiner
Karabiner is an application that allows you to override input signals from your keyboard. This can be very powerful and can let you avoid a lot of headache if you have a keybinding that you want to be applied globally. For example, I use Karabiner to do three things. 1. I remap the caps lock key to left control. 2. I remap ctrl-m to the Return key. 3. I remap ctrl-[ to the Esc key. The latter two are "Complex Modifications" in Karabiner. To add these, you need to add them directly in the .json configuration file, you can't add them through the UI of Karabiner. Karabiner's configuration file can be found at `~/.config/karabiner/karabiner.json`.

### BetterTouchTool
BetterTouchTool's main purpose is adding customizable handlers for trackpad gestures, though I don't use it for this. It has two other features that I really like: 1. It allows you to remap key sequences for specific applications. 2. It includes the features of BetterSnapTool which lets you drag windows to the edges of your screen and they will snap into place to take up half/a quarter/the whole screen.

### Atom
Atom provides some configuration files that you can use to customize the editor. `keymap.cson` lets you bind your own keybindings. `styles.less` lets you change the css that is used to style the editor. `snippets.cson` will let you add custom snippets. `init.coffee` will run coffee script while the application boots that lets you and your own functionality to the editor. `config.cson` contains all of the settings for each package.
