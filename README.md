## Monolith application at two instanses:
- reddit-app - Ubuntu 16.04 (required for Ruby 2.3.8)
- reddit-db  - Ubuntu 20.04

### Used enviroment:
* Application code https://github.com/express42/reddit
* Ruby 2.3.8 (required by this version of the application)
* MongoDB 4.4
* Firewall rules to open ports:
  - 22     SSH connection
  - 9292   Application work port
  - 27017  Database connection

### Steps:

1. #### Create instances:
  - Set terraform vars at ./terraform/prod/terraform.tfvars
    - Required: *project, public_key_path, user_ssh*
    - Optional: *region, zone, machine_type*

```bash
mv ./terraform/prod/terraform.tfvars.example ./terraform/prod/terraform.tfvars
cd terraform/prod
terraform apply -auto-approve
```

2. #### Configure Ansible:
  - Read [Ansible docs](https://docs.ansible.com/ansible/latest/scenario_guides/guide_gce.html) to add GCE service account key.
  - Set service account JSON and project id at *dynamo.gcp.yml*
  - Set ssh private key path and ssh username at *ansible.cfg*
  - Set database internal IP as variable *db_host* at app.yaml 

3. For deploy use *site.yaml* 