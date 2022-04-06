#!/bin/sh

# This script dose not create docker image,
# will only work on existing docker image.

# Usages of this script and help
function usage {
        echo "./mkdockerize.sh -p produce -l directory_name -n docker_image_name"
        echo "./mkdockerize.sh -s serve -l directory_name -n docker_image_name"
        exit 3
}

# If no parameters are supply with this script
if [ $# -eq 0 ] ; then
     usage
fi

# Getting parameters
while getopts "p:s:l:n:h" OPT; do
	case $OPT in
        p) produce=$OPTARG;;
        s) serve=$OPTARG;;
		l) path=$OPTARG;;
		n) image_name=$OPTARG;;
		h) usage;;
	esac
done
shift $((OPTIND -1))

# Check whether it produce, if "produce" then it will
# attached a local volume and create MkDocs contents
# inside container image and exit.
# We should be able to see local directory that contains the Mkdocs project.
if [ "$produce" == "produce" ] ; then
      docker run -d -v "$(pwd)/$path":/projects $image_name produce
      echo "Out to $(pwd)/$path/site.tar.gz"
      exit 0
fi

# If the parameter is serve then local directory which contains MkDocs project
# will attached container image and run MkDocs project
if [ "$serve" == "serve" ] ; then
      docker run -p 8000:8000 -v "$(pwd)/$path":/projects $image_name serve
fi
