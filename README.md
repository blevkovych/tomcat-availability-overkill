**Playbook names, short description and variables to use with them:**

**1.** change_hostname.yml: Change hostname and time. 

Variables: *None*

**2.** install_nginx.yml: Install Nginx and change the config file for load balancing.

Variables: *None*

**3.** install_tomcat.yml: Install Tomcat and change few config files. 

Variables: 

- admin_name="The name for admin user" 
- admin_pass="The password for admin user"
- logging_name="The name for a user with logging privileges"
- logging_pass="The password for a user with logging privileges"

**4.** install_haproxy.yml: Install HaProxy and change the config file for load balancing.

Variables: *None*

**5.** configure_keepalived.yml: Install Keepalived and change the config file for Active/Passive balancer.

Variables:

- node="The name of the machine to use this playbook on"
- state="State of the balancer is it Active or Passive can be set only to one of those: MASTER/BACKUP"
- interface="The name of the network interface"
- virtual_ip="Virtual IP address that will be used for both load balancers"
- app_name="The name of the application to check on. Can be any but I tested on those: HaProxy/Nginx"

**6.** install_postgresql.yml: Install PostgreSQL on the machine.

Variables: *None*

**7.** configure_postgresql.yml: Create a  database, fill it from SQL file, create a user, give him privileges to that database, in parallel create a user for logging.

Variables:

- db_name="The name of the database to be created"
- db_username="The name of the user to have access to that database"
- db_userpass="Password to that user"
- logging_name="The name of the user that can access logging"
- logging_pass="The password of the user that can access logging"

**8.** install_bucardo.yml: Install Bucardo on the machine with already installed PostgreSQL for replication.

Variables:

- bucardo_password="The password for the user bucardo"

**9.** configure_bucardo.yml: Create replication between two databases

Variables:

- node="The name of the machine to use this playbook on"
- local_name="The name to represent a local database. You can't use the same name twice for different replication"
- remote_name="The name to represent a remote database. You can't use the same name twice for different replication"
- db_name="The name of the database you what to replicate. You can't use the same database for different replications"
- bucardo_password="The password for the bucardo user"
- herd_name="The name of the herd. It's naming for a bunch of tables and sequences"
- group_name="The name of the group where the  local and remote database will be added"
- sync_name="The name of the synchronization"
