acl = "write"

operator = "write"

service_prefix "" {
  policy = "read"
  intentions = "read"
}

consul acl policy create -name replication -rules @replication-policy.hcl
consul acl token create -description "replication token" -policy-name replication