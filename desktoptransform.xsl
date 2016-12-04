<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>

            <head>
                <title>Imobilizato Imóveis</title>
                <meta charset="ISO-8859-1" />

                <!-- Bootstrap Stylesheet Inclusion -->
                <link rel="stylesheet" href="css/bootstrap.min.css" />

                <link rel="stylesheet" href="styles.css"/>
            </head>

            <body>
                <div class="container">
                    <div class="page-header">
                        <h1>Catálogo de Imóveis</h1>
                    </div>
                <xsl:for-each select="imoveis/imovel">
                    <div class="row">
                    <div class="col-6-lg col-6-xs">
                    <div class="media well">
                            <xsl:choose>
                                <xsl:when test="finalidade/venda">
                                        <xsl:choose>
                                            <xsl:when test="finalidade/venda/casa">
                                                <div class="media-left">
                                                    <img class="media-object" src="imagens/casa.png" alt="casa" />
                                                </div>
                                                <div class="media-body">
                                                    <h4 class="media-heading">Casa à Venda <small>(REF #<xsl:value-of select="@codigo" />)</small></h4>
                                                    <xsl:apply-templates />
                                                </div>
                                            </xsl:when>
                                            <xsl:when test="finalidade/venda/apartamento">
                                                <div class="media-left">
                                                    <img class="media-object" src="imagens/apartamento.png" alt="apartamento" />
                                                </div>
                                                <div class="media-body">
                                                    <h4 class="media-heading">Apartamento à Venda <small>(REF #<xsl:value-of select="@codigo" />)</small></h4>
                                                    <xsl:apply-templates />
                                                </div>
                                            </xsl:when>
                                            <xsl:when test="finalidade/venda/barracao">
                                                <div class="media-left">
                                                    <img class="media-object" src="imagens/barracao.png" alt="barracao" />
                                                </div>
                                                <div class="media-body">
                                                    <h4 class="media-heading">Barracão à Venda <small>(REF #<xsl:value-of select="@codigo" />)</small></h4>
                                                    <xsl:apply-templates />
                                                </div>
                                            </xsl:when>
                                            <xsl:when test="finalidade/venda/chacara">
                                                <div class="media-left">
                                                    <img class="media-object" src="imagens/characa.png" alt="chacara" />
                                                </div>
                                                <div class="media-body">
                                                    <h4 class="media-heading">Cháraca à Venda <small>(REF #<xsl:value-of select="@codigo" />)</small></h4>
                                                    <xsl:apply-templates />
                                                </div>
                                            </xsl:when>
                                            <xsl:when test="finalidade/venda/terreno">
                                                <div class="media-left">
                                                    <img class="media-object" src="imagens/terreno.png" alt="terreno" />
                                                </div>
                                                <div class="media-body">
                                                    <h4 class="media-heading">Terreno à Venda <small>(REF #<xsl:value-of select="@codigo" />)</small></h4>
                                                    <xsl:apply-templates />
                                                </div>
                                            </xsl:when>
                                        </xsl:choose>
                                </xsl:when>

                                <xsl:when test="finalidade/aluguel">
                                    <xsl:choose>
                                            <xsl:when test="finalidade/aluguel/casa">
                                                <div class="media-left">
                                                    <img class="media-object" src="imagens/casa.png" alt="casa" />
                                                </div>
                                                <div class="media-body">
                                                    <h4 class="media-heading">Casa para Alugar <small>(REF #<xsl:value-of select="@codigo" />)</small></h4>
                                                    <xsl:apply-templates />
                                                </div>
                                            </xsl:when>
                                            <xsl:when test="finalidade/aluguel/apartamento">
                                                <div class="media-left">
                                                    <img class="media-object" src="imagens/apartamento.png" alt="apartamento" />
                                                </div>
                                                <div class="media-body">
                                                    <h4 class="media-heading">Apartamento para Alugar <small>(REF #<xsl:value-of select="@codigo" />)</small></h4>
                                                    <xsl:apply-templates />
                                                </div>
                                            </xsl:when>
                                            <xsl:when test="finalidade/aluguel/barracao">
                                                <div class="media-left">
                                                    <img class="media-object" src="imagens/barracao.png" alt="barracao" />
                                                </div>
                                                <div class="media-body">
                                                    <h4 class="media-heading">Barracão para Alugar <small>(REF #<xsl:value-of select="@codigo" />)</small></h4>
                                                    <xsl:apply-templates />
                                                </div>
                                            </xsl:when>
                                            <xsl:when test="finalidade/aluguel/chacara">
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

    <xsl:template match="casa | terreno | barracao | apartamento | chacara">
        <table class="table">
            <xsl:if test="./larguraTerreno">
                <tr>
                    <td>Largura</td>
                    <td><xsl:value-of select="larguraTerreno" /></td>
                </tr>
            </xsl:if>
            <xsl:if test="./comprimentoTerreno">
                <tr>
                    <td>Comprimento</td>
                    <td><xsl:value-of select="comprimentoTerreno" /></td>
                </tr>
            </xsl:if>
            <xsl:if test="./areaTerreno">
                <tr>
                    <td>Área Terreno</td>
                    <td><xsl:value-of select="areaTerreno" /></td>
                </tr>
            </xsl:if>
            <xsl:if test="./areaConstruida">
                <tr>
                    <td>Área Construída</td>
                    <td><xsl:value-of select="areaConstruida" /></td>
                </tr>
            </xsl:if>
            <xsl:if test="./numeroQuartos">
                <tr>
                    <td>Quartos</td>
                    <td><xsl:value-of select="numeroQuartos" /></td>
                </tr>
            </xsl:if>
            <xsl:if test="./numeroBanheiros">
                <tr>
                    <td>Banheiros</td>
                    <td><xsl:value-of select="numeroBanheiros" /></td>
                </tr>
            </xsl:if>
            <xsl:if test="./numeroGaragens">
                <tr>
                    <td>Garagens</td>
                    <td><xsl:value-of select="numeroGaragens" /></td>
                </tr>
            </xsl:if>
            <xsl:if test="./numeroSuites">
                <tr>
                    <td>Suítes</td>
                    <td><xsl:value-of select="numeroSuites" /></td>
                </tr>
            </xsl:if>
            <xsl:if test="./numeroSalas">
                <tr>
                    <td>Salas</td>
                    <td><xsl:value-of select="numeroSalas" /></td>
                </tr>
            </xsl:if>
            <xsl:if test="./escritorio">
                <tr>
                    <td>Escritório</td>
                    <td>
                        <xsl:choose>
                            <xsl:when test=".[escritorio='true']">
                                Sim
                            </xsl:when>
                            <xsl:when test=".[escritorio='false']">
                                Não
                            </xsl:when>
                        </xsl:choose>
                    </td>
                </tr>
            </xsl:if>
            <xsl:if test="./piscina">
                <tr>
                    <td>Piscina</td>
                    <td>
                        <xsl:choose>
                            <xsl:when test=".[piscina='true']">
                                Sim
                            </xsl:when>
                            <xsl:when test=".[piscina='false']">
                                Não
                            </xsl:when>
                        </xsl:choose>
                    </td>
                </tr>
            </xsl:if>
            <xsl:if test="./banheira">
                <tr>
                    <td>Banheira</td>
                    <td>
                        <xsl:choose>
                            <xsl:when test=".[banheira='true']">
                                Sim
                            </xsl:when>
                            <xsl:when test=".[banheira='false']">
                                Não
                            </xsl:when>
                        </xsl:choose>
                    </td>
                </tr>
            </xsl:if>
            <xsl:if test="./armarios">
                <tr>
                    <td>Armários</td>
                    <td>
                        <xsl:choose>
                            <xsl:when test=".[armarios='true']">
                                Sim
                            </xsl:when>
                            <xsl:when test=".[armarios='false']">
                                Não
                            </xsl:when>
                        </xsl:choose>
                    </td>
                </tr>
            </xsl:if>
            <xsl:if test="./churrasqueira">
                <tr>
                    <td>Churrasqueira</td>
                    <td>
                        <xsl:choose>
                            <xsl:when test=".[churrasqueira='true']">
                                Sim
                            </xsl:when>
                            <xsl:when test=".[churrasqueira='false']">
                                Não
                            </xsl:when>
                        </xsl:choose>
                    </td>
                </tr>
            </xsl:if>
            <xsl:if test="./quintal">
                <tr>
                    <td>Quintal</td>
                    <td>
                        <xsl:choose>
                            <xsl:when test=".[quintal='true']">
                                Sim
                            </xsl:when>
                            <xsl:when test=".[quintal='false']">
                                Não
                            </xsl:when>
                        </xsl:choose>
                    </td>
                </tr>
            </xsl:if>
            <xsl:if test="./financiamento">
                <tr>
                    <td>Financiamento</td>
                    <td>
                        <xsl:choose>
                            <xsl:when test=".[financiamento='true']">
                                Sim
                            </xsl:when>
                            <xsl:when test=".[financiamento='false']">
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
            <xsl:if test="./financiamento">
                <p>
                <xsl:choose>
                    <xsl:when test=".[financiamento='true']">
                        Aceita financiamento
                    </xsl:when>
                    <xsl:when test=".[financiamento='false']">
                        Não aceita financiamento
                    </xsl:when>
                </xsl:choose>
                </p>
            </xsl:if>

            <xsl:if test="./IPTU">
                <p>Valor do IPTU: R$<xsl:value-of select="IPTU" /></p>
            </xsl:if>
            <xsl:if test="./condominio">
                <p>Condomínio: R$<xsl:value-of select="condominio" /></p>
            </xsl:if>
    </xsl:template>

    <!-- Comeco do Template de Endereço -->
    <xsl:template match="endereco">
        <p>Local: <xsl:value-of select="rua"/> - <xsl:value-of select="numero"/> - <xsl:value-of select="bairro"/> - <xsl:value-of select="cidade"/></p>
    </xsl:template>
    <!-- Final do Template de Endereço -->

    <!-- Comeco do Template de Valor -->
    <xsl:template match="valor">
        <p>Valor: R$<xsl:value-of select="."/></p>
    </xsl:template>
    <!-- Final do Template de Valor -->

    <!-- Comeco do Template de Descrição -->
    <xsl:template match="descricao">
        <p>Descrição: <xsl:value-of select="."/></p>
    </xsl:template>
    <!-- Final do Template de Descrição -->

    <!-- Comeco do Template de Contato -->
    <xsl:template match="contato">
        <p>Tratar com: <xsl:value-of select="nome"/> / <xsl:value-of select="telefone"/></p>
    </xsl:template>
    <!-- Final do Template de Contato -->

    <xsl:template match="areaConstruida">
        <xsl:value-of select="." />
    </xsl:template>

    <xsl:template match="numeroQuartos">
        <xsl:value-of select="." />
    </xsl:template>

    <xsl:template match="numeroBanheiros">
        <xsl:value-of select="." />
    </xsl:template>

    <xsl:template match="numeroGaragens">
        <xsl:value-of select="." />
    </xsl:template>

    <xsl:template match="numeroSuites">
        <xsl:value-of select="." />
    </xsl:template>

    <xsl:template match="numeroSalas">
        <xsl:value-of select="." />
    </xsl:template>

    <xsl:template match="escritorio">
        <xsl:value-of select="." />
    </xsl:template>

    <xsl:template match="piscina">
        <xsl:value-of select="." />
    </xsl:template>

    <xsl:template match="banheira">
        <xsl:value-of select="." />
    </xsl:template>

    <xsl:template match="armarios">
        <xsl:value-of select="." />
    </xsl:template>

    <xsl:template match="churrasqueira">
        <xsl:value-of select="." />
    </xsl:template>

    <xsl:template match="quintal">
        <xsl:value-of select="." />
    </xsl:template>

</xsl:stylesheet>