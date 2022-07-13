import os
import pandas as pd
import numpy as np

scores = []
dir = "data/filtered_LAMA"
for f in os.listdir(dir):
    filepath = os.path.join(dir, f)
    df = pd.read_json(filepath, orient="records", lines=True)
    most_freq = df["obj_label"].mode().values[0]
    scores.append(len(df[df["obj_label"]==most_freq])/len(df))
print(np.array(scores).mean())
