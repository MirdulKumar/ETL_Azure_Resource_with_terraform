# resource "databricks_notebook" "silver1_to_bronze" {
#   path     = "C:/Users/Mirdul.Kumar/Desktop/VS_code/terraform/1st_azure_ETL/python_notebook/silver1-to_bronze"
#   language = "PYTHON"
# #   content_base64 = base64encode("")
# }

# resource "databricks_notebook" "bronze_to_silver" {
#   path     = "C:/Users/Mirdul.Kumar/Desktop/VS_code/terraform/1st_azure_ETL/python_notebook/bronze_to_silver"
#   language = "PYTHON"
# #   content_base64 = base64encode("")
# }


resource "databricks_notebook" "stob" {
  path     = "/Users/mirdul.kumar@itindexnine.onmicrosoft.com/Mk_notebook/silver_to_gold"
  language = "PYTHON"
  source   = "C:/Users/Mirdul.Kumar/Desktop/VS_code/terraform/1st_azure_ETL/python_notebook/silver_to_gold.py"
}

resource "databricks_notebook" "btos" {
  path     = "/Users/mirdul.kumar@itindexnine.onmicrosoft.com/Mk_notebook/bronze_to_silver"
  language = "PYTHON"
  source   = "C:/Users/Mirdul.Kumar/Desktop/VS_code/terraform/1st_azure_ETL/python_notebook/bronze_to_silver.py"
}



