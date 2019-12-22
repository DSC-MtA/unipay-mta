# Container Builder for Flutter

This is a slightly modified version of the Flutter Container Builder from the [GCP Cloud Builders Community](https://github.com/GoogleCloudPlatform/cloud-builders-community). The original Dockerfile was designed for building android apps; this one is for building web applications as well.

To build this builder, [install the gcloud sdk](https://cloud.google.com/sdk/docs/quickstarts) and run the following command in this directory:

```
$ gcloud builds submit . --config=cloudbuild.yaml
```
