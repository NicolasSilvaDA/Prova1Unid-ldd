<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
    <html>
        <head>
            <title>Bíblia</title>
            <style>
                table {
                    border: 1px solid black;
                    border-collapse: collapse;
                }

                td, th {
                    padding: 8px;
                    border: 1px solid black;
                }
            </style>
        </head>
        <body>
            <table>
                <thead>
                    <tr>
                        <th>Livro</th>
                        <th>Qtd de Capítulos</th>
                        <th>Qtd de Versos</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:apply-templates select="bible/book"> </xsl:apply-templates>
                </tbody>
            </table>
        </body>
    </html>
</xsl:template>

<xsl:template match="book">
    <xsl:variable name="bookName" select="./@name"/>
    <tr>
        <td><xsl:value-of select="$bookName" /></td>
        <td><xsl:value-of select="./@chapters"/></td>
        <td><xsl:value-of select="count(//v[../../@name = $bookName])" /></td>
    </tr>
</xsl:template>

</xsl:transform>