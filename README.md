# Before Run

## ensure Environment Variables are loaded
. /etc/environment
echo $GOOGLE_APPLICATION_CREDENTIALS

## Grant exe permission to python files
chmod +x /home/q/nf-python-demo/bin/*.*

# Clear Work Directory
sudo rm -R /home/q/work 

# Execute Workflow
# Local
./nextflow run /home/q/nf-python-demo -profile local

## Docker
./nextflow run /home/q/nf-python-demo -profile local