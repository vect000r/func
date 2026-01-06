#!/bin/bash

echo "======================================"
echo "  Testing ex7"
echo "======================================"
echo ""

echo "=== Testing /is-sorted ==="
curl -X POST http://localhost:8080/is-sorted \
  -H "Content-Type: application/json" \
  -d '{"nums": [5, 4, 3, 2, 1]}'
echo -e "\n"

echo "=== Testing /sum-three ==="
curl -X POST http://localhost:8080/sum-three \
  -H "Content-Type: application/json" \
  -d '{"list1": [1, 2, 3], "list2": [4, 5, 6], "list3": [7, 8, 9]}'
echo -e "\n"

echo "=== Testing /set-head ==="
curl -X POST http://localhost:8080/set-head \
  -H "Content-Type: application/json" \
  -d '{"listSetHead": [2, 3, 4], "element": 1}'
echo -e "\n"

echo "=== Testing /append ==="
curl -X POST http://localhost:8080/append \
  -H "Content-Type: application/json" \
  -d '{"listAppend": [1, 2, 4, 5], "index": 2, "elementAppend": 3}'
echo -e "\n"

echo "=== Testing /two-square ==="
curl -X POST http://localhost:8080/two-square \
  -H "Content-Type: application/json" \
  -d '{"listTwoSquare1": [1, 2, 3], "listTwoSquare2": [4, 5, 6]}'
echo -e "\n"