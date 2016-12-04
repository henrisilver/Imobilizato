#from libs import dicttoxml
from libs.lxml import etree
from xml.dom.minidom import parseString

#dict = {'Nome': 'HighEnd', 'Age': 65, 'Class': 'Super Professor'}

#xml = parseString(dicttoxml.dicttoxml(dict, attr_type=False)).toprettyxml(encoding="UTF-8")

#with open('instance.xml', 'w') as f:
#    f.write(xml)



SCHEMA_INSTANCE_NS = "http://www.w3.org/2001/XMLSchema-instance"
SCHEMA = "{%s}" % SCHEMA_INSTANCE_NS
NSMAP_SCHEMA = {"xsi" : SCHEMA_INSTANCE_NS}

IMOBILIZATO_NS = "http://www.imobilizato.com/Modelo"
IMOBILIZATO = "{%s}" % IMOBILIZATO_NS
NSMAP_IMOBILIZATO = {None : IMOBILIZATO_NS}

root = etree.Element(IMOBILIZATO + "imoveis", nsmap=NSMAP_IMOBILIZATO)

root.set(SCHEMA + "schemaLocation", "http://www.imobilizato.com/Modelo modelo.xsd")
#root.set("xmlns", "http://www.imobilizato.com/Modelo")

imovel = etree.SubElement(root, IMOBILIZATO + "imovel")

xml = etree.tostring(root, xml_declaration=True, encoding='UTF-8', pretty_print=True)
print xml