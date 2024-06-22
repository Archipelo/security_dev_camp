---
title: Cottonmouth: Aggregation of Compliance Information
author: Yarann
lang: en-US
toc: true
---

## General Motivation

* Personally Identifying Information (PII) is about aggregation
* PII is everywhere
* Dev tools are applicable everywhere

## Specific Example: SOC2 physical site security

* SOC2 requires development and ops sites to be secured
* Security practices:
    * locking doors
    * computer lock screens
    * in-place objects (classic example: password sticky)

Site security is _ad-hoc_. Usually it's a manager walking
around and chastising personnel.

How do we take advantage of "software is eating the world"?

## Automation of Physical Security

* Many security tools operate on Abstract Syntax Trees
* Trees are broadly applicable (e.g. SceneGraph)
* Apply the AST model to site security

## Concrete Example

::: columns

:::: column

```yaml

- name: main office
  latlon: [36.0578254,-87.20356]
  branches:
    - name: entry
    - name: cubicles
      branches:
        - name: cubicle 1
          branches:
            - name: desk
            - branches:
              - name: monitor 2
                branches:
                  - name: screen
                    contents: "About Lightweight static analysis for many..."
                  - name: sticky-note
                    contents: "password: 123"


```

:::: column

screenshot

::: columns
