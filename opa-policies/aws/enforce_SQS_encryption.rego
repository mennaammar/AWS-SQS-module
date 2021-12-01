# Check S3 bucket is not public

package terraform

import input as tfplan

deny[reason] {
	r = tfplan.resource_changes[_]
	r.mode == "managed"
	r.type == "aws_sqs_queue"
	r.change.after.kms_master_key_id == null

	reason := sprintf("%-40s :: SQS encryption should be enabled.", 
	                    [r.change.after.arn])
}
