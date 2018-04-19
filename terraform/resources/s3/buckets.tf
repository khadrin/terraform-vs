module "terraform-state" {
  source = "../../modules/s3/standard-bucket"
  name = "BUCKET.GOES.HERE"
}
