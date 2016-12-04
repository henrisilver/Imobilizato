<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:imo="http://www.imobilizato.com/Modelo">
    <xsl:output method="xml"/>

    <xsl:template match="/">
		<rss version="2.0">
    		<channel>
    			<title>Sistema de Imobiliária</title>
    			<link>http://www.imobilizato.com/imoveis</link>
    			<description>Imóveis disponíveis</description>

    			<xsl:for-each select="imo:imoveis/imo:imovel">
                    <item>
                        <title>
                            <xsl:if test="imo:finalidade/imo:venda">
                                Venda: 
                            </xsl:if>
                            <xsl:if test="imo:finalidade/imo:aluguel">
                                Aluguel:
                            </xsl:if>
                            <xsl:if test="imo:finalidade//imo:casa">
                                casa
                            </xsl:if>
                            <xsl:if test="imo:finalidade//imo:apartamento">
                                apartamento
                            </xsl:if>
                            <xsl:if test="imo:finalidade//imo:chacara">
                                chácara
                            </xsl:if>
                            <xsl:if test="imo:finalidade//imo:barracao">
                                barracão
                            </xsl:if>
                            <xsl:if test="imo:finalidade//imo:terreno">
                                terreno
                            </xsl:if>
                        </title>
                        <link/>
                        <description>Bairro: <xsl:value-of select="imo:endereco/imo:bairro"/>, Valor: <xsl:value-of select="imo:valor"/>, Contato: <xsl:value-of select="imo:contato/imo:telefone"/></description>
                    </item>
                </xsl:for-each>
            </channel>
        </rss>
    </xsl:template>

</xsl:stylesheet>
