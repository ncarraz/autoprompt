#!/bin/bash

for REL in $(ls data/filtered_original/)
do
python -m autoprompt.create_trigger \
    --train data/filtered_original/$REL/train.jsonl \
    --dev data/filtered_original/$REL/dev.jsonl \
    --template ' {sub_label} [T] [T] [T] [T] [T] [P]. </s>'\
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
