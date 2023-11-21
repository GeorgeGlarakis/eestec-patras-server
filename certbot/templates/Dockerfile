FROM certbot/dns-cloudflare:v2.2.0

COPY cloudflare.ini /secrets/certbot/cloudflare.ini

# Installs certbot and a cron entry for it
RUN apk --no-cache add tini && \
    echo '0 4 * * * date && certbot renew \
    -n --agree-tos \
    --email certificates@{{ domain }} \
    --dns-cloudflare \
    --dns-cloudflare-credentials /secrets/certbot/cloudflare.ini \
    --dns-cloudflare-propagation-seconds 20 \
    --cert-name {{ domain }}' > /etc/crontabs/root

# We might get rid of the init system if we can run certbot in foreground
ENTRYPOINT [ "/sbin/tini", "--" ]

CMD [ "/usr/sbin/crond", "-f", "-l", "6", "-L", "/dev/stdout" ]
