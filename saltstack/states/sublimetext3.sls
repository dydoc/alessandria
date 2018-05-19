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
{% set my_sublime_congiration_folder = my_home + '/'+ '.config/' + 'sublime-text-3' %}
{% set packagemanager_package_name = 'Package Control.sublime-package' %}

install_package_manager:
  file.managed:
    - name: {{ my_sublime_congiration_folder}}/Installed Packages/{{ packagemanager_package_name }}
    - source: https://packagecontrol.io/Package%20Control.sublime-package
    - skip_verify: true
    - makedirs: true
    - user: {{ my_user }}
    - group: {{ my_user }}
    - mode: 664 

{% set package_to_be_installed = salt['pillar.get']('sublime:package') %}

install_plugin_packages:
  file.serialize:
    - name: {{ my_sublime_congiration_folder}}/Packages/User/Package Control.sublime-settings
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

{% set packages_configuration_directory = my_sublime_congiration_folder + '/' + 'Packages/User'%}


{% for package,settings in package_to_be_installed.items() %}
{% if settings %}
condigure_package_{{ package }}:
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


ciao:
  cmd.run:
    - name: echo {{ my_home }} && echo {{ my_sublime_congiration_folder }}
