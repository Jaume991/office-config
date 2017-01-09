<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-generate-toc again -->
**Table of Contents**

- [Zsh](#zsh)
- [Tmux - Terminal multiplexer](#tmux---terminal-multiplexer)
- [Spacemacs - The best editor is neither Emacs nor Vim, it's Emacs and Vim!](#spacemacs---the-best-editor-is-neither-emacs-nor-vim-its-emacs-and-vim)
    - [Configuration](#configuration)
        - [User configuration](#user-configuration)
    - [Shorcuts](#shorcuts)
        - [Quicksave perspective](#quicksave-perspective)
        - [Avy](#avy)
        - [Edit spacemacs configuration](#edit-spacemacs-configuration)
        - [Kill buffer and window - `SPC w b`](#kill-buffer-and-window---spc-w-b)
        - [Open projetile on new frame - `SPC p P`](#open-projetile-on-new-frame---spc-p-p)
        - [Transient states](#transient-states)
            - [Toggle manipulation](#toggle-manipulation)
    - [Windows](#windows)
        - [Winner mode](#winner-mode)
    - [Languages](#languages)
        - [PHP](#php)
        - [Markdown](#markdown)
    - [Useful documentation](#useful-documentation)
        - [Change meta+number shortcut. Currently used by window-numbering](#change-metanumber-shortcut-currently-used-by-window-numbering)
        - [Define global key only when mode is active](#define-global-key-only-when-mode-is-active)
        - [Define evil key](#define-evil-key)
        - [Functions](#functions)
            - [Search with ag](#search-with-ag)
    - [Todo](#todo)
- [Gitignore](#gitignore)

<!-- markdown-toc end -->


# Zsh

Use .profile, .zprofile to load required PATHS

- Common
  - `DOTPATH` -> where all dot configuration files are (`/home/<username>`)
  - `HOSTSPATH` -> hosts file location ( `/etc/hosts` )
  - `PATH` -> Add composer bin (`/.composer/vendor/bin`)
- Android
  - `ANDROID_HOME` -> Sdk (`/home/<username>/Android/Sdk`)
  - `PATH` -> add bin, tool and platform tools
   - `/usr/local/android-studio/bin`
   - `${ANDROID_HOME}/tools`
   - `${ANDROID_HOME}/platform-tools`
- Spacemacs
  - `YCMDPATH` -> YCMD executable (`/home/<username>/ycmd/ycmd`)
  - Flycheck php laravel oriented
    - `PHPMD` -> Mess detector executable (`/home/<username>/.composer/vendor/bin/phpmd`)
    - `PHPCS` -> Sintax checker executable (`/home/<username>/.composer/vendor/bin/phpcs`)
    - `PHPCS_RULESET` -> Sintax checker ruleset (`/home/<username>/.composer/vendor/pragmarxlaravelcs/Standards/Laravel/ruleset.xml`)


# Tmux - Terminal multiplexer

Attach to session without syncyng windows:

The reason both clients switch windows at the same time is because they are both connected to the same session (the “current window” is an attribute of the session, not the client). What you can do is link one or more windows into multiple different sessions. Since each session has its own “current window”, you can then switch windows independently in each session.

The easiest way to use this feature is to use the “grouped sessions” feature of the new-session command:


``` sh
tmux new-session -t 'original session name or number'
```

Each session in a group will automatically share the same set of windows: opening/linking (or closing/unlinking) a window in one session of the group automatically causes the same window to be linked (or unlinked) in all the other sessions of the group.

# Spacemacs - The best editor is neither Emacs nor Vim, it's Emacs and Vim!

## Configuration

- Start with fullscreen
- Layers
  - Auto-completion
  - Syntax-cheking
  - Ycmd
  - Php
  - html
  - Javascript
  - Emacs-lisp
  - Vimscript
  - Python
  - Markdown
    - `Markdown-live-preview-engine 'vmd`
  - Themes-megapack
  - Git
  - Helm
  - Better-defaults
- Editing style vim
- Random startup banner
- Font
  - Source code pro for powerline
- Cycling themes
  - Spacemacs-dark
  - Gotham

### User configuration

- `display-time-24hr-format t`
- `display-time-default-load-average nil`
- `auto-save nil`
- `which-key-max-description-length 100`

## Shorcuts

### Quicksave perspective

- Quicksave and exit - `SPC q f`
- Quicksave with name and exit - `SPC q f`
- Load quicksave - `SPC \ l`
- Load quicksave with name - `SPC \ L`

### Avy

Changed go to line for a custom function go to line to first non-blank character

### Edit spacemacs configuration

Use `SPC f e c` to edit spacemacs configuration in vertical split and focus

### Kill buffer and window - `SPC w b`

### Open projetile on new frame - `SPC p P`

### Transient states

#### Toggle manipulation

- Shortcut `SPC t .`

- Toggles
 - `n` Line numbers
 - `r` Relative line number
 - `g` Golden ratio
 - `w` Show whitespace
 - `h` Evil clear highlight

## Windows

### Winner mode

Winner-mode allows to 'undo' and 'redo' changes in windows configuration.

Source: https://www.emacswiki.org/emacs/WinnerMode

## Languages

### PHP

Added .blade.php format to web-mode
Custom phpcs statandard for laravel (removed tabs for whitespaces rule)

### Markdown

To use `vmd` (Github-favored live preview)

``` sh
npm install -g vmd
```

## Useful documentation

### Change meta+number shortcut. Currently used by window-numbering

``` emacs-lisp
  (let ((m window-numbering-keymap)) (define-key m "\M-n" 'select-window-n))
```

### Define global key only when mode is active

``` emacs-lisp
  (eval-after-load '{active-mode} (define-key evil-{evil-mode}-state-map (kbd "{shortcut}") '{function}))
```

### Define evil key

``` emacs-lisp
  (define-key evil-{evil-mode}-state-map (kbd "{shortcut}") '{function})
```

### Functions

#### Search with ag

 - `-G{regexp}` It's posible to use regexp to search file route from start of projectile. Can be used anywhere.

## Todo

 - (CONF) YouCompletesMe
 - (DOC) Substitute with emacs. Inner file, project of folder
 - (DOC) Change '...' -> "..." (SURROUND)
 - (DOC) Comment line
 - (DOC)(PROJECTILE) global ignore
 - (EVILMODE) Create custom text objects
  - Variables / constants
  - Functions
  - Conditions / loops
 - (EVILMODE) Movement using fuzzysearch like easymotion vim package
 - (EVILMODE) Emet and snippets
 - (EVILMODE) Multicusor
 - (EVILMODE) Delete lines without spaces
 - (FLYCHECK) Implement easy syntax rules asking for confirmation
 - (FLYCHECK) Custom syntax checks
 - (LANG)(REACTNATIVE) snippets
 - (LANG)(REACTNATIVE) Html/jsx tag creation edition
 - (SEARCH) Modify searched files
 - (SEARCH) Fuzzy single line
 - (HIGHLIGHT) Notify double blank line

# Gitignore

To set a global gitgnore
``` sh
git config --global core.excludesfile ~/.gitignore
```
