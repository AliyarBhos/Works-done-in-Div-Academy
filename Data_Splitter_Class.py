import numpy as np
from zlib import crc32
from sklearn.model_selection import train_test_split


class DataSplitter:
    """Utility class for splitting datasets into train and test sets."""

    @staticmethod
    def is_id_in_test_set(identifier, test_ratio):
        """Check if a given ID belongs to the test set based on its hash."""
        return crc32(np.int64(identifier)) < test_ratio * 2**32

    @staticmethod
    def split_by_id_hash(data, test_ratio, id_column):
        """
        Split data deterministically using a hash of the ID column.
        Best for datasets that grow over time or require stable splits.

        Args:
            data       : pandas DataFrame
            test_ratio : float, e.g. 0.2 for 20% test
            id_column  : str, name of the stable unique ID column

        Returns:
            train_set, test_set
        """
        ids = data[id_column]
        in_test_set = ids.apply(lambda id_: DataSplitter.is_id_in_test_set(id_, test_ratio))
        return data.loc[~in_test_set].reset_index(drop=True), data.loc[in_test_set].reset_index(drop=True)

    @staticmethod
    def split_randomly(data, test_ratio, random_state=42):
        """
        Split data randomly with a fixed seed.
        Best for static datasets.

        Args:
            data         : pandas DataFrame
            test_ratio   : float, e.g. 0.2 for 20% test
            random_state : int, for reproducibility

        Returns:
            train_set, test_set
        """
        return train_test_split(data, test_size=test_ratio, random_state=random_state)