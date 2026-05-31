# ================================
# MYSQL SECRET
# ================================

resource "aws_secretsmanager_secret" "mysql_secret" {
  name = "project-bedrock-mysql-secret"

  tags = {
    Name    = "project-bedrock-mysql-secret"
    Project = "karatu-2025-capstone"
  }
}

resource "aws_secretsmanager_secret_version" "mysql_secret_version" {
  secret_id = aws_secretsmanager_secret.mysql_secret.id

  secret_string = jsonencode({
    username = "admin"
    password = "StrongPassword123!"
    engine   = "mysql"
    host     = aws_db_instance.mysql.address
    port     = 3306
  })
}

# ================================
# POSTGRES SECRET
# ================================

resource "aws_secretsmanager_secret" "postgres_secret" {
  name = "project-bedrock-postgres-secret"

  tags = {
    Name    = "project-bedrock-postgres-secret"
    Project = "karatu-2025-capstone"
  }
}

resource "aws_secretsmanager_secret_version" "postgres_secret_version" {
  secret_id = aws_secretsmanager_secret.postgres_secret.id

  secret_string = jsonencode({
    username = "pgadmin"
    password = "StrongPassword123!"
    engine   = "postgres"
    host     = aws_db_instance.postgres.address
    port     = 5432
  })
}