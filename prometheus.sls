prometheus_user:
  user.present:
    - name: prometheus
    - system: True

prometheus_group:
  group.present:
    - name: prometheus
    - system: True

prometheus_package:
  archive.extracted: 
    - name: /opt/
    - source: https://github.com/prometheus/prometheus/releases/download/v2.48.1/prometheus-2.48.1.linux-amd64.tar.gz
    - source_hash: 5d58b52ccfeff25700bc8d14ecc1235cbf112a05041e3b2f6900d16b44856f6f
    - user: prometheus
    - group: prometheus
    - if_missing: /opt/prometheus/prometheus

prometheus_config:
  file.managed:
    - name: /etc/prometheus/prometheus.yml
    - source: salt://prometheus/prometheus.yml
    - user: prometheus
    - group: prometheus
    - mode: 644

prometheus_service:
  file.managed:
    - name: /etc/systemd/system/prometheus.service
    - source: salt://prometheus/files/prometheus.service
    - mode: 644

  service.running:
    - name: prometheus
    - enable: True
    - require:
      - file: prometheus_service
      - file: prometheus_config
    - watch:
      - file: prometheus_config
