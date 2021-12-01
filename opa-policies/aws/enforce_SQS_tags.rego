package terraform

import input as tfplan

deny[reason] {
	r = tfplan.resource_changes[_]
	r.mode == "managed"
	r.type == "aws_sqs_queue"
	not r.change.after.tags.Name 

	reason := sprintf("%-40s :: Tag Name required", 
	                    [r.change.after.arn])
}
deny[reason] {
	r = tfplan.resource_changes[_]
	r.mode == "managed"
	r.type == "aws_sqs_queue"
	not r.change.after.tags.Description 

	reason := sprintf("%-40s :: Tag Description required", 
	                    [r.change.after.arn])
}
deny[reason] {
	r = tfplan.resource_changes[_]
	r.mode == "managed"
	r.type == "aws_sqs_queue"
	not r.change.after.tags.Environment 

	reason := sprintf("%-40s :: Tag Environment required", 
	                    [r.change.after.arn])
}
deny[reason] {
	r = tfplan.resource_changes[_]
	r.mode == "managed"
	r.type == "aws_sqs_queue"
	not r.change.after.tags.Project 

	reason := sprintf("%-40s :: Tag Project required", 
	                    [r.change.after.arn])
}

deny[reason] {
	r = tfplan.resource_changes[_]
	r.mode == "managed"
	r.type == "aws_sqs_queue"
	not r.change.after.tags.Owner 

	reason := sprintf("%-40s :: Tag Owner required", 
	                    [r.change.after.arn])
}

deny[reason] {
	r = tfplan.resource_changes[_]
	r.mode == "managed"
	r.type == "aws_sqs_queue"
	not r.change.after.tags.BusinessUnit 

	reason := sprintf("%-40s :: Tag BusinessUnit required", 
	                    [r.change.after.arn])
}

deny[reason] {
	r = tfplan.resource_changes[_]
	r.mode == "managed"
	r.type == "aws_sqs_queue"
	not r.change.after.tags.OpCo 

	reason := sprintf("%-40s :: Tag OpCo required", 
	                    [r.change.after.arn])
}

deny[reason] {
	r = tfplan.resource_changes[_]
	r.mode == "managed"
	r.type == "aws_sqs_queue"
	not r.change.after.tags.Confidentiality 

	reason := sprintf("%-40s :: Tag Confidentiality required", 
	                    [r.change.after.arn])
}

deny[reason] {
	r = tfplan.resource_changes[_]
	r.mode == "managed"
	r.type == "aws_sqs_queue"
	not r.change.after.tags.ServiceLevel 

	reason := sprintf("%-40s :: Tag ServiceLevel required", 
	                    [r.change.after.arn])
}

deny[reason] {
	r = tfplan.resource_changes[_]
	r.mode == "managed"
	r.type == "aws_sqs_queue"
	not r.change.after.tags.SecurityOwner 

	reason := sprintf("%-40s :: Tag SecurityOwner required", 
	                    [r.change.after.arn])
}

deny[reason] {
	r = tfplan.resource_changes[_]
	r.mode == "managed"
	r.type == "aws_sqs_queue"
	not r.change.after.tags.TechnicalOwner 

	reason := sprintf("%-40s :: Tag TechnicalOwner required", 
	                    [r.change.after.arn])
}

deny[reason] {
	r = tfplan.resource_changes[_]
	r.mode == "managed"
	r.type == "aws_sqs_queue"
	not r.change.after.tags.Source 

	reason := sprintf("%-40s :: Tag Source required", 
	                    [r.change.after.arn])
}
