
# Cottonmouth

`cottonmouth` is a command line scanner to discover compliance issues in tree-structures
through a double-plugin system.

## The problem

Developers are exposed to vast amounts of data, which makes it difficult to find compliance
issues because of the vast amount of code they must review.

A good way to think about `cottonmouth` is as a disk usage analyze. You know how you
start at the top level, find what folders are using the most data, and descend?

## The workflow

Cottonmouth works as follows:

1. Scan at the project top level. `cm` provides a sum for each folder of issues found
2. Descend into a folder. Scan in this folder and get a sum of compliance issues
3. Scan a file. Get a sum of compliance issues per function
4. Examine individual functions for problems.


## THe double-plugin system

1. language plugins
2. compliance plugins


`cottonmouth` is language agnostic.  There are too many languages to focus on
any single one. Indeed, the target need not be a language. It just needs a
tree-like structure, that can be descended.

No single universal compliance  regime exists.  Different organization have
different requirements, so commonmouth allows configuration of compliance
regimes via plugin.


## The core

The core of cottonmouth is a tree scanner.  The language plugin provides an AST
for a given data source.  The compliance plugin analyzes the AST for relevant concerns.

## The prototype

This prototype focus on fangs in a given tree. In this case we focus on yaml.

### Why a CLI

A command line tool can be integrated with any other tool, such as an IDE,
devops pipeline, or heads-up display.

Tree structures are key, consider this AR solution:

A building is a tree. The root of the building is the property. Each room is a
branch of the tree. Tables, computers, sticky notes---any object---is a leaf.
So you could integrate `cottonmouth` with a SOC2 walkthrough, looking for
physical vulnerabilities (e.g. the sticky note with a password taped to a
developer's monitor.

In this case, an AR user would wak through the building. The data would be
collected by the AR SOC2 walkthrough plugin and converted to a AST.  Then, on
review, the compliance sums can be displayed on future navigation of the
physical site.

## How is this different from `<tool>`

`cottonmouth` is an aggregation tool. Plenty of tools exist to detect security
problems, but summarizing their results is nontrivial. Cottonmouth helps you
navigate a project from the top down, to find where the largest mass of
problems exist.

