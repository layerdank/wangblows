
bitsadmin /transfer myDownloadJob /download /priority FOREGROUND "https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=windows&version=7.2.4&product=universalforwarder&filename=splunkforwarder-7.2.4-8a94541dcfac-x64-release.msi&wget=true" "C:\Users\Public\Downloads\splunkforwarder-7.2.4-8a94541dcfac-x64-release.msi"

msiexec.exe /i "C:\Users\Public\Downloads\splunkforwarder-7.2.4-8a94541dcfac-x64-release.msi" RECEIVING_INDEXER="splunk.layer8.edu:9997" DEPLOYMENT_SERVER="splunk.layer8.edu:8089" LAUNCHSPLUNK=1 SERVICESTARTTYPE=auto AGREETOLICENSE=yes /quiet