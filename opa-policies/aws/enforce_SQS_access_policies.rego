
package terraform

import input as tfplan

deny[reason] {
	r = tfplan.resource_changes[_]
	r.mode == "managed"
	r.type == "aws_sqs_queue"
	#r.change.after.policy == 
	not contains(r.change.after.policy, "Deny")

	reason := sprintf("%-40s :: Access Policies need to be restricted", 
	                    [r.change.after.arn])
}
