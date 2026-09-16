#!/command/with-contenv bashio
# ==============================================================================
# Home Assistant Community App: InfluxDB
# Configures NGINX for use with the Chronograf
# ==============================================================================
declare port
declare certfile
declare dns_host
declare ingress_interface
declare ingress_port
declare ingress_entry
declare keyfile

port=$(bashio::app.port 80)
ingress_entry=$(bashio::app.ingress_entry)
if bashio::var.has_value "${port}"; then
    bashio::config.require.ssl

    if bashio::config.true 'ssl'; then
        certfile=$(bashio::config 'certfile')
        keyfile=$(bashio::config 'keyfile')

        mv /etc/nginx/servers/direct-ssl.disabled /etc/nginx/servers/direct.conf
        sed -i "s#%%certfile%%#${certfile}#g" /etc/nginx/servers/direct.conf
        sed -i "s#%%keyfile%%#${keyfile}#g" /etc/nginx/servers/direct.conf

    else
        mv /etc/nginx/servers/direct.disabled /etc/nginx/servers/direct.conf
    fi

    sed -i "s#%%ingress_entry%%#${ingress_entry}#g" /etc/nginx/servers/direct.conf
fi

ingress_port=$(bashio::app.ingress_port)
ingress_interface=$(bashio::app.ip_address)
sed -i "s/%%port%%/${ingress_port}/g" /etc/nginx/servers/ingress.conf
sed -i "s/%%interface%%/${ingress_interface}/g" /etc/nginx/servers/ingress.conf
sed -i "s#%%ingress_entry%%#${ingress_entry}#g" /etc/nginx/servers/ingress.conf

dns_host=$(bashio::dns.host)
sed -i "s/%%dns_host%%/${dns_host}/g" /etc/nginx/includes/resolver.conf
