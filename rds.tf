provider "aws" {
  region = "us-west-1"
}

resource "aws_db_subnet_group" "example" {
  name       = "example-subnet-group"
  subnet_ids = ["subnet-0123456789abcdef0", "subnet-0123456789abcdef1"]
}

resource "aws_db_cluster" "aurora_cluster" {
  count               = 2
  cluster_identifier = "aurora-cluster-${count.index}"
  engine              = "aurora-mysql"
  engine_version      = "5.7.mysql_aurora.2.03.2"
  availability_zones = ["us-west-1a", "us-west-1b"]
  skip_final_snapshot = true

  db_subnet_group_name = aws_db_subnet_group.example.name

  tags = {
    Name = "aurora-cluster-${count.index}"
  }
}

resource "aws_db_instance" "aurora_instance" {
  count           = 2
  allocated_storage    = 100
  storage_type        = "gp2"
  engine              = "aurora-mysql"
  engine_version      = "5.7.mysql_aurora.2.03.2"
  instance_class      = "db.t2.small"
  name                = "aurora-instance-${count.index}"
  username            = "user-${count.index}"
  password            = "P@ssw0rd1234!"
  db_subnet_group_name = aws_db_subnet_group.example.name

  tags = {
    Name = "aurora-instance-${count.index}"
  }

  db_cluster_identifier = element(aws_db_cluster.aurora_cluster.*.id, count.index)
}
