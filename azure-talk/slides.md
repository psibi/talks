---
author: Sibi Prabakaran
title: Haskell + Azure Pipelines
date: Feb 13, 2019
---

# Azure Pipelines

* One of the services under Azure Devops
* Used for CI/CD services
* Recently gaining popularity in OSS projects

# Pricing page

<img src="./azure_pricing_page.png"/>

# Advantages

* Build times & parallel jobs are much bigger
* Build artifacts
* choco, MinGW availablity for Window images

# Cons

* Not all the features is available via yaml
* No caching support
* UI is not straightforward
* Bugs

# Azure Terminology

* Agents
 - Microsoft hosted agents
 - Self-hosted agents

# Yaml options

``` yaml
pool:
  vmImage: ubuntu-16.04
```

```yaml
steps:
- script: |
    export PATH=$HOME/.local/bin:$PATH
    stack build
  displayName: Build Dependencies
- script: |
    export PATH=$HOME/.local/bin:$PATH
    stack test
  displayName: Test Package
```


# Prebaked Templates

* Simple configuration
* Complex configuration

# Questions
