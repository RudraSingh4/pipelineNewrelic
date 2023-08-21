resource "newrelic_cloud_aws_link_account" "foo" {
  arn = "arn:aws:iam::676634049556:role/RudraRole"
  metric_collection_mode = "PULL"
  name = "foo"
}

resource "newrelic_cloud_aws_integrations" "bar" {
  linked_account_id = newrelic_cloud_aws_link_account.foo.id

    ec2 {
    aws_regions              = ["us-east-1"]
    duplicate_ec2_tags       = true
    fetch_ip_addresses       = true
    metrics_polling_interval = 6000
    tag_key                  = "tag key"
    tag_value                = "tag value"
  }
}