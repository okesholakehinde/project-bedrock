# ================================
# DYNAMODB TABLE (PRODUCT CATALOG)
# ================================

resource "aws_dynamodb_table" "products" {
  name           = "project-bedrock-products"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Name    = "project-bedrock-products"
    Project = "karatu-2025-capstone"
  }
}