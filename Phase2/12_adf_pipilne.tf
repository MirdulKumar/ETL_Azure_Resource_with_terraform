resource "azapi_resource" "example_pipeline" {
  type      = "Microsoft.DataFactory/factories/pipelines@2018-06-01"
  name      = "terraform_pipeline"
  parent_id = data.terraform_remote_state.phase1.outputs.data_factory_id
  body = jsonencode({
    "properties": {
        "activities": [
            {
                "name": "copy_http_data",
                "type": "Copy",
                "dependsOn": [],
                "policy": {
                    "timeout": "0.12:00:00",
                    "retry": 0,
                    "retryIntervalInSeconds": 30,
                    "secureOutput": false,
                    "secureInput": false
                },
                "userProperties": [],
                "typeProperties": {
                    "source": {
                        "type": "DelimitedTextSource",
                        "storeSettings": {
                            "type": "HttpReadSettings",
                            "requestMethod": "GET"
                        },
                        "formatSettings": {
                            "type": "DelimitedTextReadSettings"
                        }
                    },
                    "sink": {
                        "type": "ParquetSink",
                        "storeSettings": {
                            "type": "AzureBlobFSWriteSettings"
                        },
                        "formatSettings": {
                            "type": "ParquetWriteSettings"
                        }
                    },
                    "enableStaging": false,
                    "translator": {
                        "type": "TabularTranslator",
                        "typeConversion": true,
                        "typeConversionSettings": {
                            "allowDataTruncation": true,
                            "treatBooleanAsNumber": false
                        }
                    }
                },
                "inputs": [
                    {
                        "referenceName": "http_csv_dataset",
                        "type": "DatasetReference"
                    }
                ],
                "outputs": [
                    {
                        "referenceName": "bronze_parquet_dataset",
                        "type": "DatasetReference"
                    }
                ]
            },
            {
                "name": "Bronze_to_silver",
                "type": "DatabricksNotebook",
                "dependsOn": [
                    {
                        "activity": "copy_http_data",
                        "dependencyConditions": [
                            "Succeeded"
                        ]
                    }
                ],
                "policy": {
                    "timeout": "0.12:00:00",
                    "retry": 0,
                    "retryIntervalInSeconds": 30,
                    "secureOutput": false,
                    "secureInput": false
                },
                "userProperties": [],
                "typeProperties": {
                    "notebookPath": "/Users/mirdul.kumar@itindexnine.onmicrosoft.com/Mk_notebook/bronze_to_silver"
                },
                "linkedServiceName": {
                    "referenceName": "ADBLinkedServiceWithPAT",
                    "type": "LinkedServiceReference"
                }
            },
            {
                "name": "silver_to_gold",
                "type": "DatabricksNotebook",
                "dependsOn": [
                    {
                        "activity": "Bronze_to_silver",
                        "dependencyConditions": [
                            "Succeeded"
                        ]
                    }
                ],
                "policy": {
                    "timeout": "0.12:00:00",
                    "retry": 0,
                    "retryIntervalInSeconds": 30,
                    "secureOutput": false,
                    "secureInput": false
                },
                "userProperties": [],
                "typeProperties": {
                    "notebookPath": "/Users/mirdul.kumar@itindexnine.onmicrosoft.com/Mk_notebook/silver_to_gold"
                },
                "linkedServiceName": {
                    "referenceName": "ADBLinkedServiceWithPAT",
                    "type": "LinkedServiceReference"
                }
            }
        ],
        "annotations": []
    }
}
  )
  depends_on = [
    azapi_resource.dataset_csv_http,
    azapi_resource.bronze_parquet_dataset
  ]
}


