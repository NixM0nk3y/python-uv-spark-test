from typing import List

from pyspark.sql import SparkSession


def get_data(identifier: str) -> List:

    spark = SparkSession.getActiveSession()

    return [row.data_value for row in spark.sql(f"SELECT data_value FROM table where id = {identifier}").collect()]
