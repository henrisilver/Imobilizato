<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:imo="http://www.imobilizato.com/Modelo">
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    Sistema de Imobiliária
                </title>
            </head>
            <body>
                <h1>Imobilizato <i>Classificados</i></h1>
                <p>Ofertas de imóveis disponíveis agora</p>

                <hr/>

                <xsl:for-each select="imo:imoveis/imo:imovel">
                    <h3>
                        <xsl:if test="imo:finalidade/imo:venda">
                            Venda de 
                        </xsl:if>
                        <xsl:if test="imo:finalidade/imo:venda/imo:casa">
                            casa
                        </xsl:if>
                        <xsl:if test="imo:finalidade/imo:venda/imo:apartamento">
                            apartamento
                        </xsl:if>
                        <xsl:if test="imo:finalidade/imo:venda/imo:chacara">
                            chácara
                        </xsl:if>
                        <xsl:if test="imo:finalidade/imo:venda/imo:barracao">
                            barracão
                        </xsl:if>
                        <xsl:if test="imo:finalidade/imo:venda/imo:terreno">
                            terreno
                        </xsl:if>

                        <xsl:if test="imo:finalidade/imo:aluguel">
                            Aluguel de
                        </xsl:if>
                        <xsl:if test="imo:finalidade/imo:aluguel/imo:casa">
                            casa
                        </xsl:if>
                        <xsl:if test="imo:finalidade/imo:aluguel/imo:apartamento">
                            apartamento
                        </xsl:if>
                        <xsl:if test="imo:finalidade/imo:aluguel/imo:chacara">
                            chácara
                        </xsl:if>
                        <xsl:if test="imo:finalidade/imo:aluguel/imo:barracao">
                            barracão
                        </xsl:if>
                        em <xsl:value-of select="imo:endereco/imo:bairro"/>, <xsl:value-of select="imo:endereco/imo:cidade"/>
                    </h3>

                    <p><strong>Código do imóvel</strong>: <xsl:value-of select="@codigo"/></p>

                    <p><strong>Descrição</strong>: <xsl:value-of select="imo:descricao"/></p>

                    <strong>Detalhes da propriedade</strong>:

                    <ul>
                        <li><strong>Largura do terreno</strong>: <xsl:value-of select="imo:finalidade//imo:larguraTerreno"/>m</li>
                        <li><strong>Comprimento do terreno</strong>: <xsl:value-of select="imo:finalidade//imo:comprimentoTerreno"/>m</li>
                        <li><strong>Área do terreno</strong>: <xsl:value-of select="imo:finalidade//imo:areaTerreno"/>m²</li>
                    </ul>


                    <xsl:choose>
                        <xsl:when test="imo:finalidade//imo:terreno">
                        </xsl:when>
                        <xsl:otherwise>
                            <strong>Detalhes do imóvel</strong>:

                            <ul>
                                <xsl:if test="imo:finalidade//imo:numeroQuartos">
                                    <li>
                                        <xsl:value-of select="imo:finalidade//imo:numeroQuartos"/> quarto<xsl:if test="imo:finalidade//imo:numeroQuartos &gt; 1">s</xsl:if>
                                    </li>
                                </xsl:if>
                                <xsl:if test="imo:finalidade//imo:numeroBanheiros">
                                    <li>
                                        <xsl:value-of select="imo:finalidade//imo:numeroBanheiros"/> banheiro<xsl:if test="imo:finalidade//imo:numeroBanheiros &gt; 1">s</xsl:if>
                                    </li>
                                </xsl:if>
                                <xsl:if test="imo:finalidade//imo:numeroSuites">
                                    <li>
                                        <xsl:value-of select="imo:finalidade//imo:numeroSuites"/> suíte<xsl:if test="imo:finalidade//imo:numeroSuites &gt; 1">s</xsl:if>
                                    </li>
                                </xsl:if>
                                <xsl:if test="imo:finalidade//imo:numeroSalas">
                                    <li>
                                        <xsl:value-of select="imo:finalidade//imo:numeroSalas"/> sala<xsl:if test="imo:finalidade//imo:numeroSalas &gt; 1">s</xsl:if>
                                    </li>
                                </xsl:if>
                                <xsl:if test="imo:finalidade//imo:numeroGaragens">
                                    <li>
                                        <xsl:value-of select="imo:finalidade//imo:numeroGaragens"/> garage<xsl:choose>
                                        <xsl:when test="imo:finalidade//imo:numeroGaragens &gt; 1">ns</xsl:when>
                                        <xsl:otherwise>m</xsl:otherwise>
                                        </xsl:choose>
                                    </li>
                                </xsl:if>

                                <xsl:if test="imo:finalidade//imo:piscina = 'true'"><li>Piscina</li></xsl:if>
                                <xsl:if test="imo:finalidade//imo:banheira = 'true'"><li>Banheira</li></xsl:if>
                                <xsl:if test="imo:finalidade//imo:armarios = 'true'"><li>Armários</li></xsl:if>
                                <xsl:if test="imo:finalidade//imo:churrasqueira = 'true'"><li>Churrasqueira</li></xsl:if>
                                <xsl:if test="imo:finalidade//imo:quintal = 'true'"><li>Quintal</li></xsl:if>
                            </ul>

                            <strong>Área construída</strong>: <xsl:value-of select="imo:finalidade//imo:areaConstruida"/>m²
                        </xsl:otherwise>
                    </xsl:choose>

                    <p>
                        <strong>Endereço</strong>: <xsl:value-of select="imo:endereco/imo:rua"/>, <xsl:value-of select="imo:endereco/imo:numero"/> - <xsl:value-of select="imo:endereco/imo:bairro"/> - <xsl:value-of select="imo:endereco/imo:cidade"/>
                    </p>
                    
                    <p><strong><xsl:choose>
                        <xsl:when test="imo:finalidade/imo:venda">Preço de venda</xsl:when>
                        <xsl:otherwise>Valor do aluguel</xsl:otherwise>
                        </xsl:choose></strong>: <xsl:value-of select="imo:valor"/>
                        
                        <xsl:if test="imo:finalidade/imo:venda"> 
                            (<xsl:choose>
                                <xsl:when test="imo:finalidade//imo:financiamento='true'">com</xsl:when>
                                <xsl:otherwise>sem</xsl:otherwise>
                            </xsl:choose> 
                            possibilidade de financiamento)</xsl:if></p>

                    <xsl:if test="imo:finalidade//imo:condominio">
                        <p><strong>Valor do condomínio</strong>: R$<xsl:value-of select="imo:finalidade//imo:condominio"/></p>
                    </xsl:if>

                    <xsl:if test="imo:finalidade//imo:IPTU">
                        <p><strong>Valor do IPTU</strong>: R$<xsl:value-of select="imo:finalidade//imo:IPTU"/></p>
                    </xsl:if>

                    <br />

                    Para mais informações:
                    <p><strong>Contato</strong>: <xsl:value-of select="imo:contato/imo:nome"/></p>
                    <p><strong>Telefone</strong>: <xsl:value-of select="imo:contato/imo:telefone"/></p>
                    <hr/>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>