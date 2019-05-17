---
author: Sibi Prabakaran
title: ASG and lifecycle hooks
date: May 15, 2019
---

# Objective

* Run scripts before terminating EC2 instances of an ASG group
  - Like de registering the instances from ALB.
  - Inform Kubernetes/Nomad that this instance is in-eligible for new tasks

# Terminology

* ASG: Collection of EC2 instances with policies on scaling.
* Lifecycle hooks:
  - Like callbacks which can be added to ASG.

# ASG Events

* Scale Out: Instructs ASG to launch new instances.
* Scale In: Instructs ASG to detach EC2 instances.
* Fired on
  - Manually increasing the size of the group
  - Based on Policy (like demand)
  - Based on Schedule

# ASG Events (2)

* On receiving the events, the ASG will put the instance into Pending
  or Terminating state. If you have defined any lifecycle hooks - that
  will happen in this state.
* Timeouts

# lifecycled

* Daemon built by buildkite for gracefully handling EC2 scaling events.
* When a termination notice is received, lifecycled runs a user
  provided script before proceeding to shutdown the instance.
* Repo: https://github.com/buildkite/lifecycled

# Demo

* PR: https://github.com/fpco/terraform-aws-foundation/pull/189
* Testing instance: http://18.222.32.132:3000
* Based on vpc scenario 1 (VPC with single public subnet).
  - ASG with two EC2 instances, also registered with ELB.
  - Instances has lifecycled installed on it.

# Questions
