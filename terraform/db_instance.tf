resource "aws_db_instance" "postgres" {
  identifier              = "my-postgres-db"
  allocated_storage       = 20  # Armazenamento em GB
  engine                  = "postgres"
  engine_version          = "11"  # Versão do PostgreSQL
  instance_class          = "db.t3.micro"  # Tipo da instância
  username                = "secretuser"  # Nome de usuário administrador
  password                = "mysecretpassword"  # Senha do administrador
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name  # Subnet group associado
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]  # Security group para acesso
  publicly_accessible     = true  # Define se o banco será acessível publicamente
  skip_final_snapshot     = true  # Evita o snapshot final ao deletar
  multi_az                = false  # Defina como true para alta disponibilidade em múltiplas zonas

  tags = {
    Name = "PostgreSQL Database"
  }
}

output "rds_endpoint" {
  value = aws_db_instance.postgres.endpoint
}

output "rds_username" {
  value = aws_db_instance.postgres.username
}

output "rds_password" {
  value = aws_db_instance.postgres.password
    sensitive = true
}