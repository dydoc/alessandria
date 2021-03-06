{% from "map.jinja2" import my_user, my_home with context %}

sublimetextrepo1:
  pkgrepo.managed:
    - humanname: sublimetextrepo
    - name: deb https://download.sublimetext.com/ apt/stable/
    - file: /etc/apt/sources.list.d/sublimetextrepo.list
    - key_url: https://download.sublimetext.com/sublimehq-pub.gpg


sublimetext_package:
  pkg.installed:
    - name: sublime-text
    - version: latest
    - require:
      - pkgrepo: sublimetextrepo1



{% set my_sublime_configuration_folder = my_home + '/'+ '.config/' + 'sublime-text-3' %}
{% set packagemanager_package_name = 'Package Control.sublime-package' %}

install_package_manager:
  file.managed:
    - name: {{ my_sublime_configuration_folder}}/Installed Packages/{{ packagemanager_package_name }}
    - source: https://packagecontrol.io/Package%20Control.sublime-package
    - skip_verify: true
    - makedirs: true
    - user: {{ my_user }}
    - group: {{ my_user }}
    - mode: 664

{% set package_to_be_installed = salt['pillar.get']('sublime:package') %}

install_plugin_packages:
  file.serialize:
    - name: {{ my_sublime_configuration_folder}}/Packages/User/Package Control.sublime-settings
    - dataset:
        installed_packages:
        {% for package,settings in package_to_be_installed.items() %}
         - {{ package }}
        {% endfor %}
    - formatter: json
    - makedirs: true
    - user: {{ my_user }}
    - group: {{ my_user }}
    - mode: 664

{% set packages_configuration_directory = my_sublime_configuration_folder + '/' + 'Packages/User'%}


{% for package,settings in package_to_be_installed.items() %}
{% if settings %}
configure_package_{{ package }}:
    file.serialize:
        - name: {{ packages_configuration_directory }}/{{ settings.filename}}.sublime-settings
        - dataset:
            {{ settings.conf}}
        - formatter: json
        - makedirs: true
        - user: {{ my_user }}
        - group: {{ my_user }}
        - mode: 664
{% endif %}
{% endfor%}

# setup sublime configuration
python_syntax_configuration:
    file.managed:
        - name: {{ my_sublime_configuration_folder}}/Packages/User/Python.sublime-settings
        - source: salt://sublime3/Python.sublime-settings
        - makedirs: true
        - user: {{ my_user }}
        - group: {{ my_user }}

# setup sublime user preferences
sublime_user_preferences:
    file.managed:
        - name: {{ my_sublime_configuration_folder}}/Packages/User/Preferences.sublime-settings
        - source: salt://sublime3/Preferences.sublime-settings
        - makedirs: true
        - user: {{ my_user }}
        - group: {{ my_user }}

ciao:
  cmd.run:
    - name: echo {{ my_home }} && echo {{ my_sublime_configuration_folder }}
