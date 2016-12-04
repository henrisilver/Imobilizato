import os
import sys

def execute(filename):
    print "Parsing file " + str(filename) + " ..."
    os.system("python parser.py " + str(filename))

    name = os.path.basename(filename)
    generatedXML = "XML/" + str(os.path.splitext(name)[0]) + ".xml"

    print "Checking generated " + generatedXML + " against the schema in modelo.xsd..."
    os.system("xmllint --schema modelo.xsd " + generatedXML + " --noout")

    # generatedDesktopHTML = "XSLTOutput/" + str(os.path.splitext(name)[0]) + "_desktop.html"
    # print "Generating desktop HTML " + generatedDesktopHTML + " from desktoptransform.xsl..."
    # os.system("xsltproc desktoptransform.xsl " + generatedXML + " > " + generatedDesktopHTML)

    generatedMobileHTML = "XSLTOutput/" + str(os.path.splitext(name)[0]) + "_mobile.html"
    print "Generating mobile HTML " + generatedMobileHTML + " from mobiletransform.xsl..."
    os.system("xsltproc mobiletransform.xsl " + generatedXML + " > " + generatedMobileHTML)

    generatedRSSXML = "XSLTOutput/" + str(os.path.splitext(name)[0]) + "_rss.xml"
    print "Generating RSS XML " + generatedRSSXML + " from rsstransform.xsl..."
    os.system("xsltproc rsstransform.xsl " + generatedXML + " > " + generatedRSSXML)

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print "Wrong usage! Please try again.\nUsage: executeImobilizato.py <input_file>"
    else:
        execute(sys.argv[1])