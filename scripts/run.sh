#!/bin/bash

for REL in $(ls data/filtered_original/)
do
python -m autoprompt.create_trigger \
    --train data/filtered_original/$REL/train.jsonl \
    --dev data/filtered_original/$REL/dev.jsonl \
    --template "$2" \
    --num-cand 10 \
    --accumulation-steps 1 \
    --model-name $1 \
    --bsz 100 \
    --eval-size 100 \
    --iters 100 \
    --label-field 'obj_label' \
    --tokenize-labels \
    --filter \
    --print-lama 
done
