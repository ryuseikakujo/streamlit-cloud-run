# Streamlit on Cloud Run

This repo is for deploying your Streamlit app on Google Cloud Run. It is deployed via GitHub Actions, and the service accounts for Cloud Run and workload identity is created by Terraform.

## Steps to Deploy Your App

1. **Create service accounts by Terraform**

```bash
$ cd terraform
```

And follow the README.

2. **Set up secrets of GutHub Actions**

`VAR1` and `VAR2` as secret variables at GitHub Actions. These variables are for streamlit app.

Finally the GitHub Actions automatically deploys the streamlit app sourced at `app/main.py` to Cloud Run.
