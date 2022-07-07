#!/bin/bash

for LM in "bert-base-cased" "bert-large-cased" "distilbert-base-cased" 
do
bash scripts/bert_run.sh $LM 
done

for LM in "roberta-base" "roberta-large" "allenai/longformer-base-4096" "allenai/longformer-large-4096" "distilroberta-base" "facebook/bart-base" "facebook/bart-large"  
do
bash scripts/roberta_run.sh $LM 
done

for LM in "t5-small" "t5-base" "t5-large"  
do
bash scripts/t5_run.sh $LM 
done

bash scripts/gpt2_run.sh gpt2  
