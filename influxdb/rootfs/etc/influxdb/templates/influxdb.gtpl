reporting-disabled = {{ not .reporting }}

[meta]
  dir = "/data/influxdb/meta"

[data]
  dir = "/data/influxdb/data"
  engine = "tsm1"
  wal-dir = "/data/influxdb/wal"

[http]
  auth-enabled = {{ .auth }}
  realm = "InfluxDB"
  log-enabled = false
  https-enabled = false
  flux-enabled = true

[logging]
  level = "{{ .log_level }}"
