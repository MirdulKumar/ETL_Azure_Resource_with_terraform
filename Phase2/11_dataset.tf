#-- Azure Data Lake Gen2 Datasets for Bronze, Silver, and Gold

resource "azapi_resource" "bronze_parquet_dataset" {
  type      = "Microsoft.DataFactory/factories/datasets@2018-06-01"
  name      = "bronze_parquet_dataset"
  parent_id = data.terraform_remote_state.phase1.outputs.data_factory_id

  body = jsonencode({
    properties = {
      linkedServiceName = {
        referenceName = azurerm_data_factory_linked_service_data_lake_storage_gen2.adls_link.name
        type          = "LinkedServiceReference"
      }
      type = "Parquet"
      typeProperties = {
        location = {
          type        = "AzureBlobFSLocation"
          fileSystem  = "bronze"
          folderPath  = "@{formatDateTime(utcnow(), 'yyyy/MM/dd')}"
          fileName    = "AdventureWorks_Sales_2015.parquet"
        }
      }
      parameters = {
      }
    }
  })
}


#-- CSV-http-link Datasets

resource "azapi_resource" "dataset_csv_http" {
  type      = "Microsoft.DataFactory/factories/datasets@2018-06-01"
  name      = "http_csv_dataset"
  parent_id = data.terraform_remote_state.phase1.outputs.data_factory_id

  body = jsonencode({
    properties = {
      linkedServiceName = {
        referenceName = azapi_resource.CSV_http_link.name
        type          = "LinkedServiceReference"
      }
      type = "DelimitedText"
      typeProperties = {
        location = {
          type        = "HttpServerLocation"
          relativeUrl = "anshlambaoldgit/Adventure-Works-Data-Engineering-Project/refs/heads/main/Data/AdventureWorks_Sales_2015.csv"  # we can chnage 
        }
        columnDelimiter = ","
        rowDelimiter    = "\n"
        encodingName    = "UTF-8"
        quoteChar       = "\""
        escapeChar      = "\\"
        firstRowAsHeader = true
      }
    }
  })
}