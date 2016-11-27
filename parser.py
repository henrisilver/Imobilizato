from libs import dicttoxml
import sys
from xml.dom.minidom import parseString

def runParser(filename):
    data = readFile(filename)
    dictionary = text2dict(data)
    xml = dict2XML(dictionary)
    writeXML(xml)
    print "File parsed successfuly."


def readFile(filename):
    with open(filename, 'r') as f:
        read_data = f.read()
    return read_data

def text2dict():


def dict2XML(dict):
    xml = parseString(dicttoxml.dicttoxml(dict, attr_type=False)).toprettyxml(encoding="UTF-8")
    return xml

def writeXML(xml):
    with open('instance.xml', 'w') as f:
        f.write(xml)


#dict = {'Nome': 'HighEnd', 'Age': 65, 'Class': 'Super Professor'}





if __name__ == '__main__':
    if len(sys.argv) != 2:
        print "Wrong usage! Please try again.\nUsage: parser.py <input_file>"
    else:
        runParser(sys.argv[1])