import boto3
import pandas as pd
import os


def read_csv(folder, file_name):
    df = pd.read_csv(f"{folder}/{file_name}")
    print(df)


def download(client, bucket_name, folder, file_name):
    if not os.path.exists(folder):
        os.makedirs(folder)

    basename = os.path.basename(file_name)
    print(f"BASENAME: {basename}")

    file_path = os.path.join(folder, basename)

    client.download_file(bucket_name, file_name, file_path)

    print("Download file DF: ")
    read_csv(folder, basename)


def upload(client, bucket_name, file):
    client.upload_file(file, bucket_name, file)


if __name__ == "__main__":
    s3_client = boto3.client("s3", region_name="us-east-2")
    download_folder = "download_data"
    upload_folder = "upload_data"
    bucket = "datalake-patrick-igti-edc"

    download(s3_client, bucket, download_folder, "complaint.csv")

    upload(s3_client, bucket, "upload_data/neighbourhoods.csv")
