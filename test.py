from libs import dicttoxml
from xml.dom.minidom import parseString

dict = {'Nome': 'HighEnd', 'Age': 65, 'Class': 'Super Professor'}

xml = parseString(dicttoxml.dicttoxml(dict, attr_type=False)).toprettyxml(encoding="UTF-8")

with open('instance.xml', 'w') as f:
    f.write(xml)
