from azure.identity import DefaultAzureCredential
from azure.mgmt.resource import ResourceManagementClient

credential = DefaultAzureCredential()
subscription_id = "REDACTED"

client = ResourceManagementClient(credential, subscription_id)

print("=== Resource Groups ===")
for rg in client.resource_groups.list():
    if "azure-project" in rg.name or "jump-vm" in rg.name:
        print(f"  {rg.name} - {rg.location}")

print("\n=== Resources in rg-azure-project ===")
for resource in client.resources.list_by_resource_group("rg-azure-project"):
    print(f"  {resource.name} - {resource.type}")

print("\n=== Resources in rg-jump-vm ===")
for resource in client.resources.list_by_resource_group("rg-jump-vm"):
    print(f"  {resource.name} - {resource.type}")
