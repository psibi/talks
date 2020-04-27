---
author: Sibi Prabakaran
title: OPA for policy enforcement
date: April 29, 2020
---

# Agenda

* Overview of OPA
* Rego
* Usecases/Integrations
* Example integration of OPA + Python web service

# OPA

* Project started in a company named Styra at 2016
* Currently an incubator project at Linux foundation (CNCF)
* Goal: Unify policy enforcement

# Overview

![](https://d33wubrfki0l68.cloudfront.net/b394f524e15a67457b85fdfeed02ff3f2764eb9e/6ac2b/docs/latest/images/opa-service.svg){height=400px}

# Rego

* Language for writing policy
* Expresssions, Variables, Rules
* Iteration
* Tooling

# Expressions

``` prolog
> input.servers[0].protocols[0]
"https"
```

``` prolog
> input.servers[0].protocols[0]
undefined decision
```

``` prolog
input.servers[0].id == "app"
input.servers[0].protocols[0] == "https"
```

# Rego Variables

``` prolog
hello := "world"
```

# Iteration

``` json
networks = [{ "id": "net1", "public": false}, { "id": "net2", "public": false}]
```

``` prolog
> networks[x]
+---+------------------------------+
| x |         networks[x]          |
+---+------------------------------+
| 0 | {"id":"net1","public":false} |
| 1 | {"id":"net2","public":false} |
+---+------------------------------+
```

# Rules

``` prolog
any_public_networks = true {  # is true if...
    net := networks[_]        # some network exists and..
    net.public                # it is public.
}
```

# API Integration

* [Python code](https://github.com/open-policy-agent/example-api-authz-python/blob/master/server.py)
* [Rego code](https://github.com/open-policy-agent/example-api-authz-python/blob/master/example.rego)

# Experience

* Policies
* Error messages aren't nice
* Community
* Tooling

# OPA Integrations

* Kubernetes
* HTTP APIs
* Terraform
* Kafka
* Docker

# Comparision with Sentinel

* Open Source
* Applicable more generally
* Language differences

# Other Stuff

* https://play.openpolicyagent.org/
* WASM
* Editor integrations

# Haskell

* [https://github.com/fugue/fregot](Fregot) - Fugue Rego Toolkit

# Questions


