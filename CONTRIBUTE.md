# How to contribute

## From an issue

Create an issue, with your resource graph queries, a contributor add it to the repository. 

## From a pull request

For each query, add a folder inside **queries** folder with this folder hierarchy : 

```bash
queries
- domain
  - usecase
    - query.txt
    - README.md
```

This repository contains a Github Action workflow to add **azuredeploy.json** and Azure Deploy Button to your readme for each queries in this repository.
