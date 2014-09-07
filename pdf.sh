#!/bin/bash
# USAGE:        bash pdf.sh "www.website.com"

WEBSITE="$1"

echo "Getting link list..."

lynx -cache=0 -dump -listonly "$WEBSITE" | grep ".*\.pdf$" | awk '{print $2}' | tee pdflinks.txt

# OPTIONAL
#
# DOWNLOAD PDF FILES
#
echo "Downloading..."    
wget -P pdflinkextractor_files/ -i pdflinks.txt
