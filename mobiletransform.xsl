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
                <h1>Imobilizato</h1>
                <p>Imóveis disponíveis no sistema:</p>

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
                                <li><xsl:value-of select="imo:finalidade//imo:numeroQuartos"/> quarto<xsl:if test="imo:finalidade//imo:numeroQuartos &gt; 1">s</xsl:if></li>
                                <li><xsl:value-of select="imo:finalidade//imo:numeroBanheiros"/> banheiro<xsl:if test="imo:finalidade//imo:numeroBanheiros &gt; 1">s</xsl:if></li>
                                <li><xsl:value-of select="imo:finalidade//imo:numeroSuites"/> suíte<xsl:if test="imo:finalidade//imo:numeroSuites &gt; 1">s</xsl:if></li>
                                <li><xsl:value-of select="imo:finalidade//imo:numeroSalas"/> sala<xsl:if test="imo:finalidade//imo:numeroSalas &gt; 1">s</xsl:if></li>
                                <li><xsl:value-of select="imo:finalidade//imo:numeroGaragens"/> garage<xsl:choose>
                                        <xsl:when test="imo:finalidade//imo:numeroGaragens &gt; 1">ns</xsl:when>
                                        <xsl:otherwise>m</xsl:otherwise>
                                    </xsl:choose>.</li>
                                <li><xsl:if test="imo:finalidade//imo:piscina = 'true'">Piscina</xsl:if></li>
                                <li><xsl:if test="imo:finalidade//imo:banheira = 'true'">Banheira</xsl:if></li>
                                <li><xsl:if test="imo:finalidade//imo:armarios = 'true'">Armários</xsl:if></li>
                                <li><xsl:if test="imo:finalidade//imo:churrasqueira = 'true'">Churrasqueira</xsl:if></li>
                                <li><xsl:if test="imo:finalidade//imo:quintal = 'true'">Quintal</xsl:if></li>
                            </ul>

                            Área construída: <xsl:value-of select="imo:finalidade//imo:areaConstruida"/>m²
                        </xsl:otherwise>
                    </xsl:choose>

                    <p><strong>Endereço</strong>: <xsl:value-of select="imo:endereco/imo:rua"/>, <xsl:value-of select="imo:endereco/imo:numero"/> - <xsl:value-of select="imo:endereco/imo:bairro"/> - <xsl:value-of select="imo:endereco/imo:cidade"/></p>
                    
                    <p><strong><xsl:choose>
                        <xsl:when test="imo:finalidade/imo:venda">Preço de venda</xsl:when>
                        <xsl:otherwise>Valor do aluguel</xsl:otherwise>
                        </xsl:choose></strong>: <xsl:value-of select="imo:valor"/> (<xsl:choose>
                        <xsl:when test="imo:finalidade//financiamento = 'true'">com</xsl:when>
                        <xsl:otherwise>sem</xsl:otherwise>
                    </xsl:choose> possibilidade de financiamento).</p>

                    <xsl:if test="imo:finalidade//imo:condominio">
                        <p><strong>Valor do condomínio</strong>: R$<xsl:value-of select="imo:finalidade//imo:condominio"/></p>
                    </xsl:if>

                    <xsl:if test="imo:finalidade//imo:IPTU">
                        <p><strong>Valor do IPTU</strong>: R$<xsl:value-of select="imo:finalidade//imo:IPTU"/></p>
                    </xsl:if>

                    <p><strong>Contato</strong>: <xsl:value-of select="imo:contato/imo:nome"/></p>
                    <p><strong>Telefone</strong>: <xsl:value-of select="imo:contato/imo:telefone"/></p>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>