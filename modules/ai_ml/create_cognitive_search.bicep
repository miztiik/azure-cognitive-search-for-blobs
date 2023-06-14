// SET MODULE DATE
param module_metadata object = {
  module_last_updated : '2023-06-14'
  owner: 'miztiik@github'
}

param deploymentParams object
param tags object

var cognitive_search_name = replace('${deploymentParams.enterprise_name_suffix}-${deploymentParams.loc_short_code}-search-${deploymentParams.global_uniqueness}', '_', '-')

resource r_cognitive_search 'Microsoft.Search/searchServices@2020-08-01' = {
  name: cognitive_search_name
  location: deploymentParams.location
  tags: tags
  sku: {
    name: 'standard3'
    // name: 'storage_optimized_l2'
  }
  properties: {
    replicaCount: 1
    partitionCount: 2
    // hostingMode: 'default'
    hostingMode: 'highDensity'
  }
}

// OUTPUTS
output module_metadata object = module_metadata
