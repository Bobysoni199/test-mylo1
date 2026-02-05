resource "aws_db_subnet_group" "this" {
  name       = "${var.name_prefix}-rds-subnet-group"
  subnet_ids = var.subnet_ids

  tags = merge(
    var.mylo1_tags,
    {
      Name = "${var.name_prefix}-rds-subnet-group"
      Layer = "backend"
    }
  )
}

resource "aws_db_instance" "this" {
  identifier              = "${var.name_prefix}-rds"
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20

  db_name                 = var.db_name
  username                = var.db_username
  password                = var.db_password

  vpc_security_group_ids  = []
  db_subnet_group_name    = aws_db_subnet_group.this.name

  publicly_accessible     = false
  skip_final_snapshot     = true

  tags = merge(
    var.mylo1_tags,
    {
      Name = "${var.name_prefix}-rds"
      Layer = "backend"
    }
  )
}
