---
author: Sibi Prabakaran
title: (Ru)credstash
date: Jan 8, 2020
---

# Motivation
* Wanted to use Rust somewhere!
* Was looking for a project: Heard about this tool when J created a
  ticket for one of our clients
* Summary of the talk: What and How of Credstash

# Credstash
* History
    * AWS launches KMK on 2014
    * Fugue launches credstash tool on 2015
* Credential management and distribution system
* Depends on AWS infrastructure
* Alternatives
    - Vault
    - [cryptic](https://github.com/domodwyer/cryptic) - Similarly to
    credstash but uses redis instead of Dynamodb.
    - sneaker - Secrets are managed via S3 buckets

# Pricing 

<img src="./amazon_bill.png"/ height="50%">

Depends primarily on the number of keys you have.

# Usage examples

* Authenticate with AWS
  - Via AWS Keys
  - AWS Profiles
  - MFA
* Setup dynamodb table.
  - rucredstash setup
* Put secrets
  - rucredstash put "dbpassword" "this_is_a_difficult_password"
* Get secrets
  - rucredstash get "dbpassword"
* Delete secrets
  - rucredstash delete "dbpassword"
* Other niceities:
  - getall
  - list
  - keys

# KMS Concepts

* CMK
* Data Key
* HMAC
* Encryption context

# Encryption Algorithm

``` shellsession
$ credstash put dbpassword secret_password
```

* Generate 64 bytes Data key.
* Split the key into half.
* Encrypt credential using AES algorithm (CTR mode)
* Compute HMAC of the encrypted text.
    ** Ensures integrity and the authenticity of the message.
* Store them in the dynamo table

# Decryption Algorithm

``` shellsession
$ credstash get dbpassword
```

* Fetch the corresponding row from DynamoDB.
* Decrypt the encrypted data key using KMS.
    ** Split the key into half.
* Verify the HMAC of the encrypted text.
* Decrypt the credential using first half of the key.

# Comparision with Haskell

* rusoto / amazonka
    * Build times
    * Much well maintained
* Async code issues
* Crypto library

# Questions
