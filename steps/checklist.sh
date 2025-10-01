#!/bin/bash
. demo-magic.sh
clear

echo -n "Le Mac a-t-il été rebooté ? "
wait
echo "✅"

echo -n "Le wifi est-il connecté ? "
wait
echo "✅"

echo -n "Le cluster est-il fraîchement installé ? "
wait
echo "✅"

echo -n "Un pull warmup des image a-t-il été effectué "
wait
echo "✅"

