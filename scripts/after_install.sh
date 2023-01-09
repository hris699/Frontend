# Change working directory
cd /home/ec2-user/server

# Remove used code
rm -rf node_modules
rm -rf build

# install node module and run build
npm install 
npm run build