
#Connect-AZAccount -subscription e1d3e2f5-3185-422c-b951-f28b623c9cbc
# https://learn.microsoft.com/en-us/azure/templates/microsoft.containerinstance/2021-10-01/containergroups?pivots=deployment-language-arm-template
cls
cls
cls 


Write-Output $PSScriptRoot
$NAME = (Split-Path $PSScriptRoot -Leaf).ToLower()
Write-Output "Name=$NAME"

#Use "build image" vscode command to get syntax
docker build --pull --rm -f "$PSScriptRoot\DockerFile" -t $NAME $PSScriptRoot #--no-cache


# #After the build completes, tag your image so you can push the image to this repository:
# docker tag $NAME $IMAGEREGISTRYLOGINSERVER/$NAME
# #Push to your registry
# docker login $IMAGEREGISTRYLOGINSERVER  --username $IMAGEUSERNAME --password $IMAGEPASSWORD
# docker image push $IMAGEREGISTRYLOGINSERVER/$NAME

# if ($lastExitCode -eq 0)
# {
   
#    $IMAGENAME="$IMAGEREGISTRYLOGINSERVER/$NAME" + ":latest"

#    $CONTAINERGROUPNAMES=@()
#    for ($i = 0; $i -cle ($CONTAINERGROUPSCOUNT-1); $i++) {
   
#       $CONTAINERGROUPNAMES +="$NAME-" + $i.ToString("00")
#    }

#    $CONTAINERGROUPNAMES | ForEach-Object -ThrottleLimit 5  -Parallel  {

#       $CONTAINERGROUPNAME = $_
#       Write-Host $CONTAINERGROUPNAME

#       az deployment group  create `
#          --resource-group $using:RESOURCE_GROUP `
#          --name $CONTAINERGROUPNAME `
#          --template-file $using:TEMPLATEFILE `
#          --parameters $using:PARAMETERSFILE `
#                location=$using:LOCATION `
#                containerName=$CONTAINERGROUPNAME `
#                imageRegistryLoginServer=$using:IMAGEREGISTRYLOGINSERVER `
#                imageUsername=$using:IMAGEUSERNAME `
#                imagePassword=$using:IMAGEPASSWORD `
#                imageName=$using:IMAGENAME `
#                containersCount=$using:CONTAINERSCOUNT `
#                numberCpuCores=$using:NUMBERCPUCORES `
#                memory=$using:MEMORY `
#                storageAccountName=$using:STORAGEACCOUNTNAME `
#                storageAccountKey=$using:STORAGEACCOUNTKEY `
#                uniqueId=$using:UNIQUE_ID



#       az container stop --resource-group $using:RESOURCE_GROUP --name  $CONTAINERGROUPNAME
#       Write-Host "$_ DONE"
#    }

#    Write-Host "ALLDONE"
# } 

docker run --rm -dit --entrypoint "/bin/bash"  $NAME