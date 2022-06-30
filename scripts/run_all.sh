#!/bin/bash

for LM in "bert-base-cased" "bert-large-cased" "distilbert-base-cased" 
do
bash scripts/run.sh $LM '[CLS] {sub_label} [T] [T] [T] [T] [T] [P]. [SEP]'
done

for LM in "roberta-base" "roberta-large" "allenai/longformer-base-4096" "allenai/longformer-large-4096" "distilroberta-base" "facebook/bart-base" "facebook/bart-large"  
do
scripts/run.sh $LM '<s> {sub_label} [T] [T] [T] [T] [T] [P].</s>'
done

for LM in "t5-small" "t5-base" "t5-large"  
do
scripts/run.sh $LM '{sub_label} [T] [T] [T] [T] [T] [P]. </s>'
done

scripts/run.sh gpt2 '{sub_label} [T] [T] [T] [T] [T] [P].' 
