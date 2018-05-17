sublime_text_repo:
  pkgrepo.managed:
    - humanname: sublime_text_repo
    - name: deb https://download.sublimetext.com/ apt/stable/
    - file: /etc/apt/sources.list.d/sublime_text_repo.list
    - key_url: https://download.sublimetext.com/sublimehq-pub.gpg


sublimetext_package:
  pkg.installed:
    - fromrepo: sublime_text_repo
    - name: sublime-text


{% set my_user = salt['pillar.get']('my_user') %}
{% set my_home = salt['user.info'](my_user).home %}
{% set my_sublime_congiration_folder = my_home + '/'+ '.config/' + 'sublime-text-3/' + 'Installed Packages' %}
{% set packagemanager_package_name = 'Package Control.sublime-package' %}

install_package_manager:
  file.managed:
    - name: {{ my_sublime_congiration_folder}}/{{ packagemanager_package_name }}
    - source: https://packagecontrol.io/Package%20Control.sublime-package
    - skip_verify: true
    - makedirs: true

ciao:
  cmd.run:
    - name: echo {{ my_home }} && echo {{ my_sublime_congiration_folder }}