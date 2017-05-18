#!/bin/bash

curl -XPOST http://localhost:9200/ecommerce/product/_bulk --data-binary "@data/ecommerce.json"