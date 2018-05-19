installing_pip2 for saltstack module pip.installed:
  pkg:
    - installed
    - name: python-pip

installing_pip3:
  pkg.installed:
    - name: python3-pip

installing flake8 for sublimlinter:
  pip.installed:
    - name: flake8
    - bin_env: '/usr/bin/pip3'