from sqltest.tool import get_data
from unittest import mock


@mock.patch("sqltest.tool.SparkSession.sql")
def test_combo_data_flatten(sql: mock.Mock, fake_dataframe):

    sql.return_value = fake_dataframe

    expected_data = ["a", "b", "c"]

    retrieved_data = get_data("my_random_id")

    assert expected_data == retrieved_data
