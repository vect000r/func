#!/bin/bash

echo "======================================"
echo "  Testing ex7"
echo "======================================"
echo ""

echo "=== Test 1: GET /3.0 (Random Int) ==="
echo "Response:"
curl -s http://localhost:3000/3.0
echo ""
echo "Calling again:"
curl -s http://localhost:3000/3.0
echo ""
echo ""

echo "=== Test 2: GET /3.5 (Random Double) ==="
echo "Response:"
curl -s http://localhost:3000/3.5
echo ""
echo "Calling again:"
curl -s http://localhost:3000/3.5
echo ""
echo ""

echo "=== Test 3: GET /4.0 (Pairs and Triple) ==="
echo "Response:"
curl -s http://localhost:3000/4.0
echo ""
echo "Calling again:"
curl -s http://localhost:3000/4.0
echo ""
echo ""