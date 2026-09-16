data_dir = "/data/kapacitor"

[replay]
  dir = "/data/kapacitor/replay"

[storage]
  boltdb = "/data/kapacitor/kapacitor.db"

[http]
  bind-address = "127.0.0.1:9092"

[logging]
  level = "{{ .log_level }}"

[[influxdb]]
  urls = ["http://localhost:8086"]
  username = "kapacitor"
  password = "{{ .secret }}"

[reporting]
  enabled = {{ .reporting }}
  url = "https://usage.influxdata.com"
