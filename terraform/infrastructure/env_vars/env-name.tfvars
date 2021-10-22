########  Project #########
tf_version          = "0.14.9"
project_version     = "Remote-Managed State PreFlight"
profile             = "project-test"
env                 = "test"
deployment_role_arn = "arn:aws:iam::x:role/x"

########    DB    #########
db_user             = "dbtestuser"
db_password         = "dbtestpw"
db_instance_type    = "db.t3.xlarge"
db_storage          = "100"
db_engine           = "sqlserver-ex"

########    EC2    #########
instance_type       = "t2.micro"
key_name            = "key-pair-test"

########  Network  #########
vpc_id              = ""
subnet_ids          = [""]
security_group_ids  = [""]
