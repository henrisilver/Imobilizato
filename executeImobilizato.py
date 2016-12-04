import os
import commands
import sys

def execute(filename):
    print "\nParsing file " + str(filename) + " ...\n"
    status, output = commands.getstatusoutput("python parser.py " + str(filename))
    print output
    if status != 0:
        print "\nAborting due to invalid .txt file...\n"
        return

    name = os.path.basename(filename)
    generatedXML = "XML/" + str(os.path.splitext(name)[0]) + ".xml"

    print "\nChecking generated " + generatedXML + " against the schema in modelo.xsd...\n"
    status, output = commands.getstatusoutput("xmllint --schema modelo.xsd " + generatedXML + " --noout")
    print output
    if status != 0:
        print "\nNot generating Desktop, mobile HTML and RSS XML since " + generatedXML + " is invalid...\n"
        return

    generatedDesktopHTML = "XSLTOutput/" + str(os.path.splitext(name)[0]) + "_desktop.html"
    print "Generating desktop HTML " + generatedDesktopHTML + " from desktoptransform.xsl..."
    os.system("xsltproc desktoptransform.xsl " + generatedXML + " > " + generatedDesktopHTML)

    generatedMobileHTML = "XSLTOutput/" + str(os.path.splitext(name)[0]) + "_mobile.html"
    print "\nGenerating mobile HTML " + generatedMobileHTML + " from mobiletransform.xsl...\n"
    os.system("xsltproc mobiletransform.xsl " + generatedXML + " > " + generatedMobileHTML)

    generatedRSSXML = "XSLTOutput/" + str(os.path.splitext(name)[0]) + "_rss.xml"
    print "\nGenerating RSS XML " + generatedRSSXML + " from rsstransform.xsl...\n"
    os.system("xsltproc rsstransform.xsl " + generatedXML + " > " + generatedRSSXML)

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print "\nWrong usage! Please try again.\nUsage: executeImobilizato.py <input_file>\n"
    else:
        execute(sys.argv[1])