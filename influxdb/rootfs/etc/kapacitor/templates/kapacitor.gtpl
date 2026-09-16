data_dir = "/data/kapacitor"

[replay]
  dir = "/data/kapacitor/replay"

[storage]
  boltdb = "/data/kapacitor/kapacitor.db"

[http]
  bind-address = "{{ .bind_address }}:9092"

[logging]
  level = "{{ .log_level }}"

[[influxdb]]
  urls = ["http://localhost:8086"]
  username = "kapacitor"
  password = "{{ .secret }}"

[reporting]
  enabled = {{ .reporting }}
  url = "https://usage.influxdata.com"
