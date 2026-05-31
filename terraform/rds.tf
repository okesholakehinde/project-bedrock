# ================================
# RDS SUBNET GROUP
# ================================

resource "aws_db_subnet_group" "main" {
  name       = "project-bedrock-db-subnet-group"
  subnet_ids = aws_subnet.private_subnets[*].id

  tags = {
    Name    = "project-bedrock-db-subnet-group"
    Project = "karatu-2025-capstone"
  }
}

# ================================
# RDS SECURITY GROUP
# ================================

resource "aws_security_group" "rds_sg" {
  name        = "project-bedrock-rds-sg"
  description = "Allow EKS to access RDS"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"

    # Allow traffic from within the VPC (safer and simpler)
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "project-bedrock-rds-sg"
    Project = "karatu-2025-capstone"
  }
}

# ================================
# MYSQL RDS INSTANCE
# ================================

resource "aws_db_instance" "mysql" {
  identifier              = "project-bedrock-mysql"
  engine                  = "mysql"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20

  db_name                 = "retaildb"
  username                = "admin"
  password                = "StrongPassword123!"

  db_subnet_group_name    = aws_db_subnet_group.main.name
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]

  publicly_accessible     = false
  skip_final_snapshot     = true
  multi_az                = false

  tags = {
    Name    = "project-bedrock-mysql"
    Project = "karatu-2025-capstone"
  }
}

# ================================
# POSTGRESQL RDS INSTANCE
# ================================

resource "aws_db_instance" "postgres" {
  identifier              = "project-bedrock-postgres"
  engine                  = "postgres"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20

  db_name                 = "retaildb"
  username                = "pgadmin"
  password                = "StrongPassword123!"

  db_subnet_group_name    = aws_db_subnet_group.main.name
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]

  publicly_accessible     = false
  skip_final_snapshot     = true
  multi_az                = false

  tags = {
    Name    = "project-bedrock-postgres"
    Project = "karatu-2025-capstone"
  }
}


