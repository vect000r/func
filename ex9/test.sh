#!/bin/bash

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' 

BASE_URL="http://localhost:3000"

echo -e "${BLUE}=== Test 1: Liczba pierwsza (Promise) ===${NC}"
curl -X POST $BASE_URL/api/is-prime \
  -H "Content-Type: application/json" \
  -d '{"number": 17}' | jq
echo ""

