# AWS-SQS-module
**Module Usage:** <br />
This module is used to create Simple Queue Service in AWS. 

**Parameters:**

Parameter Name | Description | Type | Default |
--- | --- | --- | --- |
name | This is the human-readable name of the queue. If omitted, Terraform will assign a random name. | string  | no default - Follow convention "sqs-dev-euw1-001" |
visibility_timeout_seconds | The visibility timeout for the queue. An integer from 0 to 43200 (12 hours) | number | 30 |
message_retention_seconds | The number of seconds Amazon SQS retains a message. Integer representing seconds, from 60 (1 minute) to 1209600 (14 days) | number | 345600 | 
max_message_size | The limit of how many bytes a message can contain before Amazon SQS rejects it. An integer from 1024 bytes (1 KiB) up to 262144 bytes (256 KiB) | number | 262144 |
delay_seconds | The time in seconds that the delivery of all messages in the queue will be delayed. An integer from 0 to 900 (15 minutes) | number | 0 | 
receive_wait_time_seconds | The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning. An integer from 0 to 20 (seconds)| number | 0 | 
policy | The JSON access policy for the SQS queue, if a list is provided only this list is allowed access to SQS | list | The Default policy is attached where Owner is allowed to access SQS (no Deny Policy) | 
redrive_policy | The JSON policy to set up the Dead Letter Queue, see AWS docs. Note: when specifying maxReceiveCount, you must specify it as an integer (5), and not a string ("5") | string | "" | 
fifo_queue | Boolean designating a FIFO queue | bool | false | 
content_based_deduplication | Enables content-based deduplication for FIFO queues | bool | false |
kms_master_key_id | The ID of an AWS-managed customer master key (CMK) for Amazon SQS or a custom CMK | string | null | 
kms_data_key_reuse_period_seconds | The length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling AWS KMS again. An integer representing seconds, between 60 seconds (1 minute) and 86,400 seconds (24 hours) | number | 300 | 
deduplication_scope | Specifies whether message deduplication occurs at the message group or queue level | string | null | 
tags | A mapping of tags to assign to all resources | map(string) | {} | 


**OPA Policies:** <br />
OPA policies are in opa-policies/AWS folder. 

**Validate OPA policies:** <br />
terraform plan -out plan1 <br />
terraform show -json plan1 > plan1.json <br />
opa eval  --format pretty  -d opa/aws/ --input plan1.json "data.terraform.deny" <br />

**OPA validation scripts:** <br />
- enforce_SQS_access_policies.rego: Makes sure that the policy attached to the SQS contains a Deny statement. 
- enforce_SQS_encryption.rego: Makes sure that the policy kms_master_key_id is not null. which means server side encryption enabled. 
- enforce_SQS_tags.rego: Makes sure that the required organization tags are in place
