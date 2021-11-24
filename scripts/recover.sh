[ -d ~/.recovered/ ] || mkdir ~/.recovered/

if [ $# == 0 ]
then
    cp ./ -r ~/.recovered/
else
    if [ ! -d "~/.recovered/${@}/" ]
    then
        echo "\"~/.recovered/${@}/\" not found"
        exit 1
    fi
    rm -rf ../${PWD##*/}/
    mv "~/.recovered/$@/" ../${PWD##*/}/
fi
