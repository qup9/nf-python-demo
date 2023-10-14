# Before Run

## ensure Environment Variables are loaded
. /etc/environment
echo $GOOGLE_APPLICATION_CREDENTIALS
sudo chmod a+r $GOOGLE_APPLICATION_CREDENTIALS

## Grant exe permission to python files
chmod +x /home/q/nf-python-demo/bin/*.*

# Clear Work Directory
sudo rm -R /home/q/work 

# Execute Workflow
# Local
./nextflow run /home/q/nf-python-demo -profile local

## Docker
./nextflow run /home/q/nf-python-demo -profile docker

## Google Batch

*sudo is needed for nextflow process to be able to read $GOOGLE_APPLICATION_CREDENTIALS file.*
sudo ./nextflow run /home/q/nf-python-demo -profile gcp

## Nextflow Tower w/ Google Batch

Compute environment: Google_Cloud_Batch
Pipeline to launch: https://github.com/qup9/nf-python-demo (repo code url)
Revision number: tower (this branch)