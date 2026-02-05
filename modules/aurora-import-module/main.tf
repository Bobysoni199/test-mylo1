resource "aws_rds_cluster" "this" {
  cluster_identifier = var.cluster_identifier
  engine             = "aurora-postgresql"
  engine_version     = var.engine_version

  database_name   = var.database_name
  master_username = var.master_username
  master_password = var.master_password

  db_subnet_group_name   = var.db_subnet_group_name
  vpc_security_group_ids = var.security_group_ids

  skip_final_snapshot = true

  tags = merge(
    var.mylo1_tags,
    {
      Name = var.cluster_identifier
    }
  )
}

resource "aws_rds_cluster_instance" "this" {
  identifier         = "${var.cluster_identifier}-instance-1"
  cluster_identifier = aws_rds_cluster.this.id
  instance_class     = var.instance_class
  engine             = aws_rds_cluster.this.engine
  engine_version     = aws_rds_cluster.this.engine_version

  tags = merge(
    var.mylo1_tags,
    {
      Name = "${var.cluster_identifier}-instance"
    }
  )
}
