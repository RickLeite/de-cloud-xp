import pyspark
from pyspark.sql.functions import mean, max, min, col, count
from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("ExerciseSpark").getOrCreate()

enem = (
    spark.read.format("csv")
    .option("header", True)
    .option("delimiter", ";")
    .option("inferSchema", True)
    .option("encoding", "ISO-8859-1")
    .load("s3://meubucketigti/raw-data/MICRODADOS_ENEM_2020.csv")
)


(enem.write.mode("overwrite").format("parquet").save("s3://meubucketigti/staging/enem"))
