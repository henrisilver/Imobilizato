import os

print "\n*** IMOBILIZATO - INSTALLATION OF DEPENDENCIES ***\n"
print "This script will install lxml, a Python library used in this project to handle XML files, and pip, a package manager needed to install lxml."
print "** Requirements **"
print "- easy_install installed on your machine"
print "- Internet connection"
print "- admin access (being able to run sudo)\n"
print "Do you want to proceed and install the two dependencies? (y/n)"
option = str(raw_input())

if option == "y":
    os.system("sudo -H easy_install pip")
    os.system("sudo -H pip install lxml")

else:
    print "Aborting..."
