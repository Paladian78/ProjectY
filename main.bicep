param location string = resourceGroup().location
resource storageAccount 'Microsoft.Storage/storageAccounts@2021-08-01' = {
  name: 'toylunchstorageaccnt'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}
resource appServicePlan 'Microsoft.Web/serverFarms@2021-03-01' = {
  name: 'toy-product-launch-plan-starterpp'
  location: location
  sku: {
    name: 'F1'
  }
}

resource appServiceApp 'Microsoft.Web/sites@2021-03-01' = {
  name: 'toy-product-launch-785'
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}
