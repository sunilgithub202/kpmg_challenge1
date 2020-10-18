# Create RDS subnet group

resource "aws_db_subnet_group" "rds_subnet_group1" {
  name       = var.rds_subnet_name
  subnet_ids = aws_subnet.db.*.id

  tags =  {
    Name = var.rds_subnet_name
  }
}

# Create RDS instance

resource "aws_db_instance" "rds1" {
  allocated_storage    = var.rds_storage
  engine               = var.rds_engine
  instance_class       = var.rds_instance_class
  name                 = var.rds_name
  username             = var.rds_username
  password             = var.rds_password
  final_snapshot_identifier = "rds-cluster-backup"
  skip_final_snapshot       = true
  db_subnet_group_name = var.rds_subnet_name
  depends_on = [aws_db_subnet_group.rds_subnet_group1]
}
