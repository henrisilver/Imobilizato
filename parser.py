#!/usr/bin/env python
# -*- coding: utf-8 -*-

from libs.lxml import etree
import sys, os

SCHEMA_INSTANCE_NS = "http://www.w3.org/2001/XMLSchema-instance"
SCHEMA = "{%s}" % SCHEMA_INSTANCE_NS
NSMAP_SCHEMA = {"xsi" : SCHEMA_INSTANCE_NS}

IMOBILIZATO_NS = "http://www.imobilizato.com/Modelo"
IMOBILIZATO = "{%s}" % IMOBILIZATO_NS
NSMAP_IMOBILIZATO = {None : IMOBILIZATO_NS}

TIPO_IMOVEL_DIC = {"casa": "casa", "apartamento": "apartamento", "chácara": "chacara", "terreno": "terreno", "barracão": "barracao"}

def processRegularField(field):
    return field

def processBooleanField(field):
    if field == "sim":
        return "true"
    else:
        return "false"

def setOptionalPropertyImovelType(optionalProperty, xmlName, exceptTypes, parent, flatDict, defaultValue, processingFunc):
    currentField = getFieldFromDict(flatDict, optionalProperty)
    if currentField is not None:
        currentElement = etree.SubElement(parent, xmlName)
        currentElement.text = unicode(processingFunc(currentField), "utf-8")
    elif parent.tag not in exceptTypes:
        currentElement = etree.SubElement(parent, xmlName)
        currentElement.text = defaultValue

def setOptionalPropertyFinalidadeType(optionalProperty, xmlName, exceptTypes, parent, finalidade, finalidadeMatch, flatDict, defaultValue, processingFunc):
    currentField = getFieldFromDict(flatDict, optionalProperty)
    if currentField is not None:
        currentElement = etree.SubElement(parent, xmlName)
        currentElement.text = unicode(processingFunc(currentField), "utf-8")
    elif finalidade.tag == finalidadeMatch and parent.tag not in exceptTypes:
        currentElement = etree.SubElement(parent, xmlName)
        currentElement.text = defaultValue

def getFieldFromDict(dictionary, field):
    try:
        return dictionary.pop(field)
    except KeyError:
        return None

def addToTree(flatDict, root):
    # AO ADICIONAR ELEMENTOS E ATRIBUTOS, USAR O NAMESPACE!
    # IMOBILIZATO + "imoveis"
    # element = etree.Element(IMOBILIZATO + "NOME_ELEMENTO")
    # element.set(IMOBILIZATO + "NOME_ATRIBUTO", "VALOR_ATRIBUTO")
    imovel = etree.SubElement(root, "imovel")
    imovel.set("codigo", unicode(getFieldFromDict(flatDict, "Codigo"), "utf-8"))
    
    finalidade = etree.SubElement(imovel, "finalidade")
    tipoFinalidade = etree.SubElement(finalidade, unicode(getFieldFromDict(flatDict, "Finalidade"), "utf-8"))
    tipoImovel = etree.SubElement(tipoFinalidade, TIPO_IMOVEL_DIC[getFieldFromDict(flatDict, "Tipo")])
    dimensaoField = getFieldFromDict(flatDict, "Dimensao").split("x")
    larguraTerreno = etree.SubElement(tipoImovel, "larguraTerreno")
    larguraTerreno.text = unicode(dimensaoField[0].strip(), "utf-8")
    comprimentoTerreno = etree.SubElement(tipoImovel, "comprimentoTerreno")
    comprimentoTerreno.text = unicode(dimensaoField[1].strip(), "utf-8")
    areaTerreno = etree.SubElement(tipoImovel, "areaTerreno")
    areaTerreno.text = unicode(getFieldFromDict(flatDict, "Area"), "utf-8")

    # Propriedades "opcionais" (so aparecem em algumas finalidades/tipos de imovel)

    setOptionalPropertyImovelType("Construcao", "areaConstruida", ("terreno"), tipoImovel, flatDict, "0,0", processRegularField)

    setOptionalPropertyImovelType("Quartos", "numeroQuartos", ("terreno"), tipoImovel, flatDict, "0", processRegularField)

    setOptionalPropertyImovelType("Banheiros", "numeroBanheiros", ("terreno"), tipoImovel, flatDict, "0", processRegularField)

    setOptionalPropertyImovelType("Garagens", "numeroGaragens", ("terreno"), tipoImovel, flatDict, "0", processRegularField)

    setOptionalPropertyImovelType("Suites", "numeroSuites", ("terreno"), tipoImovel, flatDict, "0", processRegularField)

    setOptionalPropertyImovelType("Salas", "numeroSalas", ("terreno"), tipoImovel, flatDict, "0", processRegularField)

    setOptionalPropertyImovelType("Escritorio", "escritorio", ("terreno"), tipoImovel, flatDict, "false", processBooleanField)

    setOptionalPropertyImovelType("Piscina", "piscina", ("terreno"), tipoImovel, flatDict, "false", processBooleanField)

    setOptionalPropertyImovelType("Banheira", "banheira", ("terreno"), tipoImovel, flatDict, "false", processBooleanField)

    setOptionalPropertyImovelType("Armario", "armarios", ("terreno"), tipoImovel, flatDict, "false", processBooleanField)

    setOptionalPropertyImovelType("Churrasqueira", "churrasqueira", ("terreno"), tipoImovel, flatDict, "false", processBooleanField)

    setOptionalPropertyImovelType("Quintal", "quintal", ("terreno"), tipoImovel, flatDict, "false", processBooleanField)

    setOptionalPropertyFinalidadeType("Financiamento", "financiamento", (), tipoImovel, tipoFinalidade, "venda", flatDict, "false", processBooleanField)

    setOptionalPropertyFinalidadeType("IPTU", "IPTU", (), tipoImovel, tipoFinalidade, "aluguel", flatDict, "0,0", processRegularField)

    setOptionalPropertyFinalidadeType("Condominio", "condominio", ("casa", "apartamento", "chacara", "terreno", "barracao"), tipoImovel, tipoFinalidade, "aluguel", flatDict, "0,0", processRegularField)

    valor = etree.SubElement(imovel, "valor")
    valor.text = unicode(getFieldFromDict(flatDict, "Valor"), "utf-8")

    endereco = etree.SubElement(imovel, "endereco")
    enderecoFields = getFieldFromDict(flatDict, "Endereco").split(",")
    rua = etree.SubElement(endereco, "rua")
    rua.text = unicode(enderecoFields[0].strip(), "utf-8")
    numero = etree.SubElement(endereco, "numero")
    numero.text = unicode(enderecoFields[1].strip(), "utf-8")
    bairro = etree.SubElement(endereco, "bairro")
    bairro.text = unicode(enderecoFields[2].strip(), "utf-8")
    cidade = etree.SubElement(endereco, "cidade")
    cidade.text = unicode(enderecoFields[3].strip(), "utf-8")

    descricao = etree.SubElement(imovel, "descricao")
    descricao.text = unicode(getFieldFromDict(flatDict, "Descricao"), "utf-8")

    contato = etree.SubElement(imovel, "contato")
    contatoFields = getFieldFromDict(flatDict, "Contato").split(",")
    nome = etree.SubElement(contato, "nome")
    nome.text = unicode(contatoFields[0], "utf-8")
    telefone = etree.SubElement(contato, "telefone")
    telefone.text = unicode(contatoFields[1][contatoFields[1].index("("):], "utf-8")

    # Inclusao de propriedades extras que possam estar presentes no txt.
    # O parser inclui essas propriedades no XML, sendo que e tarefa do
    # xmllint, com o esquema, verificar se essas outras propriedades
    # tornam o XML invalido
    while len(flatDict) > 0:
        key, value = flatDict.popitem()
        child = etree.SubElement(imovel, unicode(key, "utf-8"))
        child.text = unicode(value, "utf-8")


def runParser(filename):
    data = readFile(filename)
    
    tree = text2tree(data)
    
    if tree is None:
        return
    
    xml = tree2XML(tree)
    
    writeXML(xml)
    
    print "File parsed successfuly."


def readFile(filename):
    with open(filename, 'r') as f:
        read_data = f.read()
    return read_data

def text2tree(data):
    #try:
    lines = data.splitlines()
        
    flatDict = {}

    root = etree.Element(IMOBILIZATO + "imoveis", nsmap=NSMAP_IMOBILIZATO)

    root.set(SCHEMA + "schemaLocation", "http://www.imobilizato.com/Modelo modelo.xsd")
        
    firstRun = True

    for line in lines:
        parsedLine = line.split(":")
        if parsedLine[0] == "Codigo" and not firstRun:
            addToTree(flatDict, root)
            flatDict = {}

        flatDict[parsedLine[0].strip()] = parsedLine[1].strip()
        firstRun = False

    if len(flatDict) > 0:
        addToTree(flatDict, root)

    return root

    # except Exception as e:
    #     print "Bad input! The txt file provided cannot be parsed."
    #     exc_type, exc_obj, exc_tb = sys.exc_info()
    #     fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
    #     print(exc_type, fname, exc_tb.tb_lineno)
    #     return None




def tree2XML(root):
    xml = etree.tostring(root, xml_declaration=True, encoding='UTF-8', pretty_print=True)
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