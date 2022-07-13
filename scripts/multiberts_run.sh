#!/bin/bash

for REL in $(ls data/fact-retrieval/original/)
do
python -m autoprompt.create_trigger \
    --train data/fact-retrieval/original/$REL/train.jsonl \
    --dev data/fact-retrieval/original/$REL/dev.jsonl \
    --template '[CLS] {sub_label} [T] [T] [T] [T] [T] [P]. [SEP]' \
    --num-cand 10 \
    --accumulation-steps 1 \
    --model-name $1 \
    --bsz 20 \
    --eval-size 100 \
    --iters 1000 \
    --label-field 'obj_label' \
    --tokenize-labels \
    --filter \
    --print-lama 
done
