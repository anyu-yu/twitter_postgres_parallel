#!/bin/sh

files=$(find data/*)

echo '================================================================================'
echo 'load pg_denormalized'
echo '================================================================================'
# FIXME: implement this
echo "$files" | time parallel sh load_tweets_parallel.sh

echo '================================================================================'
echo 'load pg_normalized'
echo '================================================================================'
echo "$files" | time parallel python3 -u load_tweets.py --db=postgresql://postgres:pass@localhost:1232/ --inputs

echo '================================================================================'
echo 'load pg_normalized_batch'
echo '================================================================================'
echo "$files" | time parallel python3 -u load_tweets_batch.py --db=postgresql://postgres:pass@localhost:1532/ --inputs
