resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  tags = merge(
    var.mylo1_tags,
    {
      Name = var.bucket_name
    }
  )
}

# Block public access (mandatory best practice)
resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Enable versioning (important for terraform state / safety)
resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = "Enabled"
  }
}
