<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Azure Data Platform Deployment using Terraform</title>
</head>
<body>

  <h1>🚀 Azure Data Platform Deployment using Terraform</h1>

  <p>This project automates the deployment of a complete Azure Data Platform using <strong>Terraform</strong>, provisioning key resources like <strong>Azure Data Factory</strong>, <strong>Azure Databricks</strong>, <strong>ADLS Gen2</strong>, and <strong>Azure Key Vault</strong>. It also includes Python-based <strong>Databricks notebooks</strong> to implement a medallion architecture (Bronze → Silver → Gold) for data transformation.</p>

  <hr>

  <h2>📁 Project Structure</h2>

  <pre><code>.
├── Phase1/
│   ├── 01_provider.tf
│   ├── 02_resource_group.tf
│   ├── 03_ADLS_gen2.tf
│   ├── 04_Azure_data_factory.tf
│   ├── 05_Azure_databricks.tf
│   ├── 06_keyvault.tf
│   ├── 07_output.tf
│   ├── 14_integration_runtime.tf
│   ├── terraform.tfvars
│   └── variable.tf
│
├── Phase2/
│   ├── 08_provider.tf
│   ├── 09_linked_services.tf
│   ├── 10_databricks_notbook.tf
│   ├── 11_dataset.tf
│   ├── 12_adf_pipeline.tf
│   ├── 13_output.tf
│   ├── 15_pipeline_trigger.tf
│   ├── main.tf
│   ├── terraform.tfvars
│   └── variable.tf
│
├── python_notebook/
│   ├── bronze_to_silver.py
│   └── silver_to_gold.py
</code></pre>

  <hr>

  <h2>💡 Features</h2>
  <ul>
    <li>🔧 Fully automated infrastructure provisioning using Terraform</li>
    <li>🌐 Azure services:
      <ul>
        <li>Azure Data Factory (ADF)</li>
        <li>Azure Databricks</li>
        <li>Azure Data Lake Storage Gen2</li>
        <li>Azure Key Vault</li>
      </ul>
    </li>
    <li>🔁 ETL orchestration with ADF pipelines and Databricks notebooks</li>
    <li>🔐 Secure credential management with Key Vault</li>
    <li>📊 Notebook-based data transformation: Bronze → Silver → Gold</li>
  </ul>

  <hr>

  <h2>⚙️ Getting Started</h2>

  <h3>✅ Prerequisites</h3>
  <ul>
    <li>Azure subscription</li>
    <li>Terraform CLI installed</li>
    <li>Databricks PAT (Personal Access Token)</li>
    <li>Azure CLI configured or service principal access</li>
  </ul>

  <h3>📌 Step 1: Clone the Repository</h3>
  <pre><code>git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name
</code></pre>

  <h3>📌 Step 2: Configure Variables</h3>
  <p>Update the <code>terraform.tfvars</code> file in both <strong>Phase1</strong> and <strong>Phase2</strong> folders with values specific to your environment:</p>
  <pre><code>location     = "East US"
resource_group_name = "rg-data-platform"
databricks_workspace_name = "adb-workspace"
adls_account_name = "datalake123"
...
</code></pre>

  <h3>📌 Step 3: Deploy Phase 1 – Infrastructure</h3>
  <pre><code>cd Phase1
terraform init
terraform plan
terraform apply
</code></pre>
  <p>This will deploy:</p>
  <ul>
    <li>Resource Group</li>
    <li>ADLS Gen2</li>
    <li>Azure Data Factory</li>
    <li>Azure Databricks</li>
    <li>Azure Key Vault</li>
    <li>Self-hosted Integration Runtime (if defined)</li>
  </ul>

  <h3>📌 Step 4: Deploy Phase 2 – ADF Integration</h3>
  <pre><code>cd ../Phase2
terraform init
terraform plan
terraform apply
</code></pre>
  <p>This will create:</p>
  <ul>
    <li>Linked Services</li>
    <li>Datasets</li>
    <li>Databricks Notebooks Integration</li>
    <li>ADF Pipelines and Triggers</li>
  </ul>

  <hr>

  <h2>🧪 Python Notebooks</h2>
  <p>Located in <code>python_notebook/</code>:</p>
  <ul>
    <li><strong>bronze_to_silver.py</strong>: Cleans and structures raw data into the silver layer.</li>
    <li><strong>silver_to_gold.py</strong>: Applies business logic and aggregations to generate the gold layer.</li>
  </ul>
  <p>These notebooks are triggered via ADF using Notebook activities linked to your Databricks workspace.</p>

  <hr>

  <h2>🛠️ Tools & Technologies</h2>
  <ul>
    <li>Terraform</li>
    <li>Azure Data Factory</li>
    <li>Azure Databricks</li>
    <li>ADLS Gen2</li>
    <li>Azure Key Vault</li>
    <li>Python</li>
  </ul>

  <hr>

  <h2>📬 Contact</h2>
  <p>For questions, suggestions, or contributions, feel free to raise an issue or contact:</p>
  <p>📧 <a href="mailto:your.email@example.com">kmirdul91@gmail.com</a></p>

</body>
</html>
