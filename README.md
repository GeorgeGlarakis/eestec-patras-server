First of all, copy your public SSH_KEY under `/home/eestec/.ssh/authorized_keys`

Run the ansible-playbook: `ansible-playbook -i inventory -e @secrets.enc --ask-vault-pass main.yml`
or use tags to run specific roles: `ansible-playbook -i inventory -e @secrets.enc --ask-vault-pass main.yml --tags { role_tag , another_role_tag }`

- To view secrets.enc run: `ansible-vault view secrets.enc`
- To decrypt secrets.enc run: `ansible-vault decrypt secrets.enc`
- To encrypt it again before commiting run: `ansible-vault encrypt secrets.enc`<br>
*Source: https://docs.ansible.com/ansible/latest/vault_guide/vault_encrypting_content.html*

Recurring Issues:
- TLS Certificate renewal. 
  - Connect to the server with SSH and run:
  - ```
    $ docker exec -it certbot certbot --force-renew renew
    $ docker restart nginx
```