<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:imo="http://www.imobilizato.com/Modelo">
    <xsl:template match="/">
        <html>

            <head>
                <title>Imobilizato Imóveis</title>
                <meta charset="ISO-8859-1" />

                <!-- Bootstrap Stylesheet Inclusion -->
                <link rel="stylesheet" href="css/bootstrap.min.css" />

                <link rel="stylesheet" href="css/styles.css"/>
            </head>

            <body>
                <div class="container">
                    <div class="page-header main-header">
                        <h1>Catálogo de Imóveis</h1>
                    </div>
                <xsl:for-each select="imo:imoveis/imo:imovel">
                    <div class="row">
                        <div class="col-6-lg col-6-xs">
                            <div class="media well">
                                    <xsl:choose>
                                        <xsl:when test="imo:finalidade/imo:venda">
                                                <xsl:choose>
                                                    <xsl:when test="imo:finalidade/imo:venda/imo:casa">
                                                        <div class="media-left">
                                                            <img class="media-object" src="imagens/casa.png" alt="casa" />
                                                        </div>
                                                        <div class="media-body">
                                                            <h4 class="media-heading">Casa a Venda <small>(REF #<xsl:value-of select="@codigo" />)</small></h4>
                                                            <xsl:apply-templates />
                                                        </div>
                                                    </xsl:when>
                                                    <xsl:when test="imo:finalidade/imo:venda/imo:apartamento">
                                                        <div class="media-left">
                                                            <img class="media-object" src="imagens/apartamento.png" alt="apartamento" />
                                                        </div>
                                                        <div class="media-body">
                                                            <h4 class="media-heading">Apartamento a Venda <small>(REF #<xsl:value-of select="@codigo" />)</small></h4>
                                                            <xsl:apply-templates />
                                                        </div>
                                                    </xsl:when>
                                                    <xsl:when test="imo:finalidade/imo:venda/imo:barracao">
                                                        <div class="media-left">
                                                            <img class="media-object" src="imagens/barracao.png" alt="barracao" />
                                                        </div>
                                                        <div class="media-body">
                                                            <h4 class="media-heading">Barracão a Venda <small>(REF #<xsl:value-of select="@codigo" />)</small></h4>
                                                            <xsl:apply-templates />
                                                        </div>
                                                    </xsl:when>
                                                    <xsl:when test="imo:finalidade/imo:venda/imo:chacara">
                                                        <div class="media-left">
                                                            <img class="media-object" src="imagens/characa.png" alt="chacara" />
                                                        </div>
                                                        <div class="media-body">
                                                            <h4 class="media-heading">Cháraca a Venda <small>(REF #<xsl:value-of select="@codigo" />)</small></h4>
                                                            <xsl:apply-templates />
                                                        </div>
                                                    </xsl:when>
                                                    <xsl:when test="imo:finalidade/imo:venda/imo:terreno">
                                                        <div class="media-left">
                                                            <img class="media-object" src="imagens/terreno.png" alt="terreno" />
                                                        </div>
                                                        <div class="media-body">
                                                            <h4 class="media-heading">Terreno a Venda <small>(REF #<xsl:value-of select="@codigo" />)</small></h4>
                                                            <xsl:apply-templates />
                                                        </div>
                                                    </xsl:when>
                                                </xsl:choose>
                                        </xsl:when>

                                        <xsl:when test="imo:finalidade/imo:aluguel">
                                            <xsl:choose>
                                                    <xsl:when test="imo:finalidade/imo:aluguel/imo:casa">
                                                        <div class="media-left">
                                                            <img class="media-object" src="imagens/casa.png" alt="casa" />
                                                        </div>
                                                        <div class="media-body">
                                                            <h4 class="media-heading">Casa para Alugar <small>(REF #<xsl:value-of select="@codigo" />)</small></h4>
                                                            <xsl:apply-templates />
                                                        </div>
                                                    </xsl:when>
                                                    <xsl:when test="imo:finalidade/imo:aluguel/imo:apartamento">
                                                        <div class="media-left">
                                                            <img class="media-object" src="imagens/apartamento.png" alt="apartamento" />
                                                        </div>
                                                        <div class="media-body">
                                                            <h4 class="media-heading">Apartamento para Alugar <small>(REF #<xsl:value-of select="@codigo" />)</small></h4>
                                                            <xsl:apply-templates />
                                                        </div>
                                                    </xsl:when>
                                                    <xsl:when test="imo:finalidade/imo:aluguel/imo:barracao">
                                                        <div class="media-left">
                                                            <img class="media-object" src="imagens/barracao.png" alt="barracao" />
                                                        </div>
                                                        <div class="media-body">
                                                            <h4 class="media-heading">Barracão para Alugar <small>(REF #<xsl:value-of select="@codigo" />)</small></h4>
                                                            <xsl:apply-templates />
                                                        </div>
                                                    </xsl:when>
                                                    <xsl:when test="imo:finalidade/imo:aluguel/imo:chacara">
                                                        <div class="media-left">
                                                            <img class="media-object" src="imagens/characa.png" alt="chacara" />
                                                        </div>
                                                        <div class="media-body">
                                                            <h4 class="media-heading">Cháraca para Alugar <small>(REF #<xsl:value-of select="@codigo" />)</small></h4>
                                                            <xsl:apply-templates />
                                                        </div>
                                                    </xsl:when>
                                                </xsl:choose>
                                        </xsl:when>
                                    </xsl:choose>
                            </div>
                        </div>
                    </div>
                    <hr />
                </xsl:for-each>         
                </div>
                <!--Latest compiled and minified JavaScript that accompanies the Bootstrap Styleshee included above -->
                <script src="js/bootstrap.min.js" />
            </body>

        </html>
    </xsl:template>

        <xsl:template match="imo:casa | imo:terreno | imo:barracao | imo:apartamento | imo:chacara">
        <table class="table">
            <xsl:if test="imo:larguraTerreno">
                <tr>
                    <td>Largura</td>
                    <td><xsl:value-of select="imo:larguraTerreno" />m</td>
                </tr>
            </xsl:if>
            <xsl:if test="imo:comprimentoTerreno">
                <tr>
                    <td>Comprimento</td>
                    <td><xsl:value-of select="imo:comprimentoTerreno" />m</td>
                </tr>
            </xsl:if>
            <xsl:if test="imo:areaTerreno">
                <tr>
                    <td>Área Terreno</td>
                    <td><xsl:value-of select="imo:areaTerreno" />m²</td>
                </tr>
            </xsl:if>
            <xsl:if test="imo:areaConstruida">
                <tr>
                    <td>Área Construída</td>
                    <td><xsl:value-of select="imo:areaConstruida" />m²</td>
                </tr>
            </xsl:if>
            <xsl:if test="imo:numeroQuartos">
                <tr>
                    <td>Quartos</td>
                    <td><xsl:value-of select="imo:numeroQuartos" /></td>
                </tr>
            </xsl:if>
            <xsl:if test="imo:numeroBanheiros">
                <tr>
                    <td>Banheiros</td>
                    <td><xsl:value-of select="imo:numeroBanheiros" /></td>
                </tr>
            </xsl:if>
            <xsl:if test="imo:numeroGaragens">
                <tr>
                    <td>Garagens</td>
                    <td><xsl:value-of select="imo:numeroGaragens" /></td>
                </tr>
            </xsl:if>
            <xsl:if test="imo:numeroSuites">
                <tr>
                    <td>Suítes</td>
                    <td><xsl:value-of select="imo:numeroSuites" /></td>
                </tr>
            </xsl:if>
            <xsl:if test="imo:numeroSalas">
                <tr>
                    <td>Salas</td>
                    <td><xsl:value-of select="imo:numeroSalas" /></td>
                </tr>
            </xsl:if>
            <xsl:if test="imo:escritorio">
                <tr>
                    <td>Escritório</td>
                    <td>
                        <xsl:choose>
                            <xsl:when test="imo:escritorio='true'">
                                Sim
                            </xsl:when>
                            <xsl:when test="imo:escritorio='false'">
                                Não
                            </xsl:when>
                        </xsl:choose>
                    </td>
                </tr>
            </xsl:if>
            <xsl:if test="imo:piscina">
                <tr>
                    <td>Piscina</td>
                    <td>
                        <xsl:choose>
                            <xsl:when test="imo:piscina='true'">
                                Sim
                            </xsl:when>
                            <xsl:when test="imo:piscina='false'">
                                Não
                            </xsl:when>
                        </xsl:choose>
                    </td>
                </tr>
            </xsl:if>
            <xsl:if test="imo:banheira">
                <tr>
                    <td>Banheira</td>
                    <td>
                        <xsl:choose>
                            <xsl:when test="imo:banheira='true'">
                                Sim
                            </xsl:when>
                            <xsl:when test="imo:banheira='false'">
                                Não
                            </xsl:when>
                        </xsl:choose>
                    </td>
                </tr>
            </xsl:if>
            <xsl:if test="imo:armarios">
                <tr>
                    <td>Armários</td>
                    <td>
                        <xsl:choose>
                            <xsl:when test="imo:armarios='true'">
                                Sim
                            </xsl:when>
                            <xsl:when test="imo:armarios='false'">
                                Não
                            </xsl:when>
                        </xsl:choose>
                    </td>
                </tr>
            </xsl:if>
            <xsl:if test="imo:churrasqueira">
                <tr>
                    <td>Churrasqueira</td>
                    <td>
                        <xsl:choose>
                            <xsl:when test="imo:churrasqueira='true'">
                                Sim
                            </xsl:when>
                            <xsl:when test="imo:churrasqueira='false'">
                                Não
                            </xsl:when>
                        </xsl:choose>
                    </td>
                </tr>
            </xsl:if>
            <xsl:if test="imo:quintal">
                <tr>
                    <td>Quintal</td>
                    <td>
                        <xsl:choose>
                            <xsl:when test="imo:quintal='true'">
                                Sim
                            </xsl:when>
                            <xsl:when test="imo:quintal='false'">
                                Não
                            </xsl:when>
                        </xsl:choose>
                    </td>
                </tr>
            </xsl:if>
            <xsl:if test="imo:financiamento">
                <tr>
                    <td>Financiamento</td>
                    <td>
                        <xsl:choose>
                            <xsl:when test="imo:financiamento='true'">
                                Sim
                            </xsl:when>
                            <xsl:when test="imo:financiamento='false'">
                                Não
                            </xsl:when>
                        </xsl:choose>
                    </td>
                </tr>
            </xsl:if>
        </table>

        <div class="page-header">
            <h4>Informações Adicionais</h4>
        </div>
            <xsl:if test="imo:financiamento">
                <p>
                <xsl:choose>
                    <xsl:when test="imo:financiamento='true'">
                        Aceita financiamento
                    </xsl:when>
                    <xsl:when test="imo:financiamento='false'">
                        Não aceita financiamento
                    </xsl:when>
                </xsl:choose>
                </p>
            </xsl:if>

            <xsl:if test="imo:IPTU">
                <p>Valor do IPTU: R$<xsl:value-of select="imo:IPTU" /></p>
            </xsl:if>
            <xsl:if test="imo:condominio">
                <p>Condomínio: R$<xsl:value-of select="imo:condominio" /></p>
            </xsl:if>
    </xsl:template>

    <!-- Comeco do Template de Valor -->
    <xsl:template match="imo:valor">
        <p>Valor: R$<xsl:value-of select="."/></p>
    </xsl:template>
    <!-- Final do Template de Valor -->

    <!-- Comeco do Template de Descrição -->
    <xsl:template match="imo:descricao">
        <p>Descrição: <xsl:value-of select="."/></p>
    </xsl:template>
    <!-- Final do Template de Descrição -->


    <!-- Comeco do Template de Endereço -->
    <xsl:template match="imo:endereco">
        <p>Local: <xsl:value-of select="imo:rua"/> - <xsl:value-of select="imo:numero"/> - <xsl:value-of select="imo:bairro"/> - <xsl:value-of select="imo:cidade"/></p>
    </xsl:template>
    <!-- Final do Template de Endereço -->

    <!-- Comeco do Template de Contato -->
    <xsl:template match="imo:contato">
        <p>Tratar com: <xsl:value-of select="imo:nome"/> / <xsl:value-of select="imo:telefone"/></p>
    </xsl:template>
    <!-- Final do Template de Contato -->
</xsl:stylesheet>