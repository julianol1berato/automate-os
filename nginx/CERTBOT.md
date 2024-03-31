# Automação para o Certbot.

Verificar arquivos de configuração:
`dpkg-query -L certbot`


### Configuração do Arquivo:
/lib/systemd/system/certbot.service
```
[Unit]
Description=Certbot
Documentation=file:///usr/share/doc/python-certbot-doc/html/index.html
Documentation=https://certbot.eff.org/docs
[Service]
Type=oneshot
ExecStart=/usr/bin/certbot -q renew --post-hook "systemctl restart nginx"
PrivateTmp=true
```

### Arquivo de configuração de tempo:
/lib/systemd/system/certbot.timer

```
[Unit]
Description=Run certbot twice daily

[Timer]
OnBootSec=300
OnUnitActiveSec=1w
OnCalendar=*-*-* 01:00
Persistent=true

[Install]
WantedBy=timers.target
```
Para checar:
`systemctl list-timers`

`systemctl enable certbot-renewal.timer`
`systemctl status certbot-renewal.timer`

`journalctl -u certbot-renewal.service`


