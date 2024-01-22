install_grafana_repo:
  pkgrepo.managed:
    - name: deb https://packages.grafana.com/oss/deb stable main
    - file: /etc/apt/sources.list.d/grafana.list
    - key_url: https://packages.grafana.com/gpg.key
    - require_in:
      - pkg: grafana

install_grafana:
  pkg.latest:
    - name: grafana
    - refresh: True

start_grafana_service:
  service.running:
    - name: grafana-server
    - enable: True
    - require:
      - pkg: grafana

