create_NE_user:
  user.present:
    - name: node_exporter
    - system: True

node_exporter:
  group.present:
    - addusers:
      - node_exporter

prometheus_package:
  archive.extracted: 
    - name: /opt/
    - source: https://github.com/prometheus/node_exporter/releases/download/v1.7.0/node_exporter-1.7.0.linux-amd64.tar.gz 
    - source_hash: a550cd5c05f760b7934a2d0afad66d2e92e681482f5f57a917465b1fba3b02a6
    - user: node_exporter
    - tar_options: --strip-components=1
    - group: node_exporter
    - if_missing: /opt/node_exporter

