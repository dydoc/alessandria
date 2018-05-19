sublime:
  package:
    ApacheConf:
    auto-save:
        conf:
            auto_save_on_modified: true
            auto_save_delay_in_seconds: 1
            auto_save_all_files: true
            auto_save_current_file: ''
            auto_save_backup: false
            auto_save_backup_suffix: "autosave"
        filename: auto_save                
    BracketHighlighter:
    Git:
    Git blame:
    Git Commit Message Syntax:
        conf:
            rulers:
                - 50
                - 72
        filename: commit-message
    GitGutter:
    Jinja2:
    Package Control:
    SaltStack-related syntax highlighting and snippets:
    SideBarEnhancements:
    Sublimerge 3:
    SublimeLinter:
        conf:
            debug: false
            delay: 0.1
            gutter_theme: Default
            highlights.demote_while_editing: none
            highlights.demote_scope: ''
            highlights.time_to_idle: 1.5
            kill_old_processes: false
            lint_mode: background
            linters: {}
            no_column_highlights_line: false
            paths:
              linux: []
              osx: []
              windows: []
            show_hover_line_report: true
            show_hover_region_report: true
            show_marks_in_minimap: true
            show_panel_on_save: never
            statusbar.counters_template: "({}|{})"
            statusbar.messages_template: "{message}"
            statusbar.show_active_linters: true
            styles:
            - scope: region.yellowish markup.warning.sublime_linter
              types:
              - warning
            - scope: region.redish markup.error.sublime_linter
              types:
              - error
            - priority: 1
              icon: dot
              mark_style: outline
            syntax_map:
              html (django): html
              html (rails): html
              html 5: html
              javascript (babel): javascript
              magicpython: python
              php: html
              python django: python
              pythonimproved: python
        filename: SublimeLinter
    SublimeLinter-flake8:
    Anaconda:
      conf:
        python_interpreter: /usr/bin/python3
        anaconda_linting": false
        pep8: false
      filename: Anaconda