#!/usr/bin/env python
# -*- coding: utf-8 -*-

# biblioteca lxml: utilizada para formar o arquivo XML
from lxml import etree
import sys, os

# Constantes utilizadas para Namespace da biblioteca LXML
SCHEMA_INSTANCE_NS = "http://www.w3.org/2001/XMLSchema-instance"
SCHEMA = "{%s}" % SCHEMA_INSTANCE_NS
NSMAP_SCHEMA = {"xsi" : SCHEMA_INSTANCE_NS}

IMOBILIZATO_NS = "http://www.imobilizato.com/Modelo"
IMOBILIZATO = "{%s}" % IMOBILIZATO_NS
NSMAP_IMOBILIZATO = {None : IMOBILIZATO_NS}

TIPO_IMOVEL_DIC = {"casa": "casa", "apartamento": "apartamento", "chácara": "chacara", "terreno": "terreno", "barracão": "barracao"}

# Funcoes para procesmento de campos do arquivo.
# Em caso de campos booleanos, deve haver um tratamento especial,
# para converter "sim" e "não" em "true" e "false", aceitos pelo XML
def processRegularField(field):
    return field

def processBooleanField(field):
    if field == "sim":
        return "true"
    elif field == "não":
        return "false"
    else:
        return "error"

# Funcoes para parsing de campos opcionais como Suites, Salas, Escritorio, etc.
# Caso o campo esteja presente para o imovel em questao, ele e processado.
# Caso contrario, e usado um valor padrao
def setOptionalPropertyImovelType(optionalProperty, xmlName, exceptTypes, parent, flatDict, defaultValue, processingFunc):
    currentField = getFieldFromDict(flatDict, optionalProperty)
    if currentField is not None:
        currentElement = etree.SubElement(parent, xmlName)
        currentElement.text = unicode(processingFunc(currentField), "utf-8")
    elif parent.tag not in exceptTypes:
        currentElement = etree.SubElement(parent, xmlName)
        currentElement.text = defaultValue

def setOptionalPropertyFinalidadeType(optionalProperty, xmlName, parent, flatDict, processingFunc):
    currentField = getFieldFromDict(flatDict, optionalProperty)
    if currentField is not None:
        currentElement = etree.SubElement(parent, xmlName)
        currentElement.text = unicode(processingFunc(currentField), "utf-8")

# Dado um dicionario contendo o conteudo do txt, e retornado o valor de uma chave
# field do dicionario. Caso a chave nao exista, e retornado None
def getFieldFromDict(dictionary, field):
    try:
        return dictionary.pop(field)
    except KeyError:
        return None

# Funcao que cria a arvore que sera convertida em XML
def addToTree(flatDict, root):

    # Adiciona-se a raiz da arvore o elemento imovel, com subelementos adequados como
    # finalidade, endereco, descricao, tipo,  etc.
    imovel = etree.SubElement(root, "imovel")
    try:
        imovel.set("codigo", unicode(getFieldFromDict(flatDict, "Codigo"), "utf-8"))
    except:
        sys.exit("Missing 'Codigo' field in input file!")
    
    finalidade = etree.SubElement(imovel, "finalidade")

    try:
        tipoFinalidade = etree.SubElement(finalidade, unicode(getFieldFromDict(flatDict, "Finalidade"), "utf-8"))
    except:
        sys.exit("Missing 'Finalidade' field in input file!")

    try:    
        tipoImovel = etree.SubElement(tipoFinalidade, TIPO_IMOVEL_DIC[getFieldFromDict(flatDict, "Tipo")])
    except:
        sys.exit("Missing 'Tipo' field in input file!")

    try:
        dimensaoField = getFieldFromDict(flatDict, "Dimensao").split("x")
    except:
        sys.exit("Missing 'Dimensao' field in input file!")

    larguraTerreno = etree.SubElement(tipoImovel, "larguraTerreno")
    larguraTerreno.text = unicode(dimensaoField[0].strip(), "utf-8")
    comprimentoTerreno = etree.SubElement(tipoImovel, "comprimentoTerreno")
    comprimentoTerreno.text = unicode(dimensaoField[1].strip(), "utf-8")
    areaTerreno = etree.SubElement(tipoImovel, "areaTerreno")
    
    try:
        areaTerreno.text = unicode(getFieldFromDict(flatDict, "Area"), "utf-8")
    except:
        sys.exit("Missing 'Area' field in input file!")

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

    setOptionalPropertyFinalidadeType("Financiamento", "financiamento", tipoImovel, flatDict, processBooleanField)

    setOptionalPropertyFinalidadeType("IPTU", "IPTU", tipoImovel, flatDict, processRegularField)

    setOptionalPropertyFinalidadeType("Condominio", "condominio", tipoImovel, flatDict, processRegularField)

    valor = etree.SubElement(imovel, "valor")
    try:
        valor.text = unicode(getFieldFromDict(flatDict, "Valor"), "utf-8")
    except:
        sys.exit("Missing 'Valor' field in input file!")

    try:
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
    except:
        sys.exit("Missing 'Endereco' field in input file!")

    descricao = etree.SubElement(imovel, "descricao")
    try:
        descricao.text = unicode(getFieldFromDict(flatDict, "Descricao"), "utf-8")
    except:
        sys.exit("Missing 'Descricao' field in input file!")

    try:
        contato = etree.SubElement(imovel, "contato")
        contatoFields = getFieldFromDict(flatDict, "Contato").split(",")
        nome = etree.SubElement(contato, "nome")
        nome.text = unicode(contatoFields[0], "utf-8")
        telefone = etree.SubElement(contato, "telefone")
        telefone.text = unicode(contatoFields[1][contatoFields[1].index("("):], "utf-8")
    except:
        sys.exit("Missing 'Contato' field in input file!")

    # Inclusao de propriedades extras que possam estar presentes no txt.
    # O parser inclui essas propriedades no XML, sendo que e tarefa do
    # xmllint, com o esquema, verificar se essas outras propriedades
    # tornam o XML invalido
    while len(flatDict) > 0:
        key, value = flatDict.popitem()
        child = etree.SubElement(imovel, unicode(key, "utf-8"))
        child.text = unicode(value, "utf-8")

# Funcionamento do parser
# 1) os dados sao lidos do arquivo de entrada
# 2) a arvore a ser exportada para XML e criada
# 3) a qrvore e convertida para XML
# 4) o XML e escrito em um arquivo
def runParser(filename):
    data = readFile(filename)
    
    tree = text2tree(data)
    
    if tree is None:
        return
    
    xml = tree2XML(tree)
    
    name = os.path.basename(filename)

    writeXML(xml, os.path.splitext(name)[0])
    
    print "File parsed successfuly."

# Le arquivo de entrada
def readFile(filename):
    with open(filename, 'r') as f:
        read_data = f.read()
    return read_data

# Cria a arvore a ser exportada para XML
def text2tree(data):
    try:
        # Divide o conteudo do arquivo em linhas
        lines = data.splitlines()
             
        # Para facilitar o processamento do arquivo, cada linha e armazenada em um dicionario.
        # A chave e o nome da propriedade (por exemplo, "Finalidade") e o valor corresponde ao
        # valor da propriedade (por exemplo, "venda")
        flatDict = {}

        # Cria o elemento raiz do XML
        root = etree.Element(IMOBILIZATO + "imoveis", nsmap=NSMAP_IMOBILIZATO)

        root.set(SCHEMA + "schemaLocation", "http://www.imobilizato.com/Modelo modelo.xsd")
                
        firstRun = True

        # Realiza o parsing de cada linha
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

    except Exception as e:
        print "Bad input! The txt file provided cannot be parsed."
        exc_type, exc_obj, exc_tb = sys.exc_info()
        fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
        print(exc_type, fname, exc_tb.tb_lineno)
        return None

# Converte uma arvore para XML
def tree2XML(root):
    xml = etree.tostring(root, xml_declaration=True, encoding='UTF-8', pretty_print=True)
    return xml

# Escreve o XML em um arquivo
def writeXML(xml, filename):
    with open("XML/" + str(filename) + ".xml", 'w') as f:
        f.write(xml)

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print "Wrong usage! Please try again.\nUsage: parser.py <input_file>"
    else:
        runParser(sys.argv[1])