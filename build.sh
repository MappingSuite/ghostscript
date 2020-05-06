
artifactoryip=192.168.217.52:8081
version=$(cat version.txt)

echo "### Start build mapping-ghostscript ###"
echo "## Version = $version"


echo "# Configuration"
cd src/ghostscript-9.50
./configure

echo "# Build"
gmake

echo "# Deployement"
cd bin 
zip gs.zip gs
curl -ujenkins:Mapping1234\$ -T gs.zip "http://$artifactoryip/artifactory/Opale/Dependencies/IBMi/mapping-ghostscript-pase-${version}.zip"
