killall -v node
if [ -z "$1" ]
then
    workingdir=$(pwd)
else
    workingdir=$(realpath "$1")
fi
echo $workingdir
rm -vrf "$workingdir"/public/*
rm -vrf "$workingdir"/public/.??*
hugo --baseURL="https://kai.dj/"
#hugo --baseURL="https://new.kai.dj/"
#hugo --baseURL="http://192.168.2.123:8080/"
rm -vrf "$workingdir"/public/categories/index.*
mv -v "$workingdir"/public/categories/* "$workingdir"/public/
find "$workingdir"/public/ -type f -exec sed -i 's#/categories/#/#g' {} \;
#find "$workingdir"/public/ -type f -exec sed -i 's#/tags/♥#/♥#g' {} \;
#find "$workingdir"/public/ -type f -exec sed -i 's#/tags/♥#/♥#g' {} \;
mv -v "$workingdir"/public/heart "$workingdir"/public/♥
cp -Rv "$workingdir"/public/♥ "$workingdir"/public/tags/

http-server -p 8080 "$workingdir"/public/ 2>&1 >/dev/null &

     
#rm public/categories/index.*
