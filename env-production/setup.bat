rem setup.bat

@ECHO OFF

set ARM_ACCESS_KEY=xxxxx

terraform init -backend-config="storage_account_name=dterraformstorage"
terraform fmt
terraform validate