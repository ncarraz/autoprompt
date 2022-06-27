#!/bin/bash

for REL in $(ls data/fact-retrieval/original/)
do
CUDA_VISIBLE_DEVICES=$2 python -m autoprompt.create_trigger \
    --train data/filtered_original/$REL/train.jsonl \
    --dev data/filtered_original/$REL/dev.jsonl \
    --template '[CLS] {sub_label} [T] [T] [T] [T] [T] [P]. [SEP]' \
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
