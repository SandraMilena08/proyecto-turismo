import numpy as np
import tensorflow as tf
import tensorflow_datasets as tfds

import tensorflow_recommenders as tfrs # Tensorflow recommenders

loaded = tf.saved_model.load("export")

loaded({"user_id": np.array(["42"]), "movie_title": ["Speed (1994)"]}).numpy()
