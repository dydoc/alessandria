{% from "map.jinja2" import name, surname, email, my_user, my_home with context %}

setting up gitconfig for {{ name }} {{ surname }}:
  file.managed:
    - name: {{ my_home }}/.gitconfig
    - source: salt://git/files/gitconfig.jinja2
    - template: jinja
    - makedirs: true
    - user: {{ my_user }}
    - group: {{ my_user }}
    - mode: 664
    - context:
        surname: {{ surname }}
        name: {{ name }}
        email: {{ email }}