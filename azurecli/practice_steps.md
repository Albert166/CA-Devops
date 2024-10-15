# Azure Cli startup

1. Download azure cli from microsoft
2. Open up azure cli in powershell using command 'az'
3. Login to your account by typing 'az login'

# Creating Virtual machine

1. First create a resource group which is needed for all your services on azure:
'az group create --name <yourgroupname> --location <location>'
You can view avaible locations by typing 'az account list-locations --output table'
2. Then you can create a virtual machine by typing:
'az vm create --resourse-group <resource_group_created_in_1step> --name <nameofVM> --image <yourprefferedimage> --generate-ssh-keys'
3. Then you can start or stop your VM by typing: 
'az vm stop --resource-group <resource_group_in_which_VM_is_allocated> --name <name_of_your_VM>'

# Creating storage account and uploading files to it
1. To create a storage account you type:
'az storage account create --name <name_of_storage_account*> --resource-group <resource_group_name> --location <location> --sku Standard_LRS**'
* Should be unique in azure
** You can choose from different types of sku's
2. When you have storage account you can create containers in it to store your data to do that type:
'az storage container create --name <name_for_container> --account-name <your_account_name_which_you_created>'
3. Then you can upload files to that container by typing:
'az storage blob upoad --acount-name <your_storage_account_name> --container-name <your_container_name> --name <name_your_file> --type block --file <path/to/file/>'
4. Then you can list the files which you have in the container by typing:
'az storage blob list --account-name <your_storage_account_name> --container-name <your_container_name>

# Creating your sql database
1. First you need to create a server which will host your sql database by typing:
'az sql server create --name <your_server_name> --resource-group <your_resource_group_name> --location <location_in_which_it_is_hosted> --admin-user <admin_user_name> --admin-password <admin_user_password>'
2. Then you can create your database by typing:
'az sql db create --resource-group <your_resource_group> --server <server_which_you_created> --name <name_of_your_db>'
3. You can also list your databases to get more info on them by typing:
'az sql db list --server <your_db_server> --resource-group <your_resource_group>'

# Creating Azure network security group
1. You can create your network group by typing:
'az network nsg create --resource-group <your_resource_group> --location <location> --name <network_security _group_name>'
2. Then you can add rules for the network group by typing:
'az network nsg rule create -g <your_resource_group> --nsg-name <name_of_network_security_group> -n <name_of_the_rule> --priority <priority of the rule> --access <ALLOW_or_DENY> -protocol <in_which_protocol> --direction <direction_inbound_or_outbound> --source-address-prefix <from_which_source> --source-port-ran <from_which_source_port> --destination-address-prefix <to_which_destination_adress> '
