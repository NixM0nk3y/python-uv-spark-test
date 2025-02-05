import pytest

@pytest.fixture()
def fake_dataframe(spark_session):

    return spark_session.createDataFrame(
        data=[
            ("a",),
            ("b",),
            ("c",),
        ],
        schema=["data_value"],
    )
