# src/test_spark.py
from pyspark.sql import SparkSession
from pyspark.sql import functions as F


def main():
    spark = SparkSession.builder.appName("SparkSmokeTest").master("local[*]").getOrCreate()
    print(f"✅ Spark version: {spark.version}")

    df = spark.createDataFrame([("PVC_001", 150), ("PVC_002", 200), ("PVC_003", 75)], ["product_id", "demand"])
    df.show(truncate=False)
    total = df.agg(F.sum("demand").alias("total")).first()["total"]
    assert total == 425, f"Total esperado 425, obtenido {total}"
    print("✅ Aggregation OK (sum == 425)")

    tmp = "/tmp/spark_smoke_parquet"
    df.write.mode("overwrite").parquet(tmp)
    df2 = spark.read.parquet(tmp)
    assert df2.count() == df.count(), "Conteo tras lectura Parquet no coincide"
    print("✅ Parquet read/write OK")

    spark.stop()
    print("🎉 Spark smoke test completado con éxito.")

if __name__ == "__main__":
    main()
