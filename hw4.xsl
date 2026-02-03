<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>ABC Financial Startup</title>
        <style type="text/css">
          body { font-family: Georgia, "Times New Roman", Times, serif; margin: 40px; color: #222; }
          h1 { font-size: 36px; margin-bottom: 10px; }
          .centerimg { display: block; margin: 20px auto; max-width: 420px; }
          p { font-size: 16px; line-height: 1.6; }
          .clients { margin-top: 10px; }
        </style>
      </head>
      <body>
        <h1>ABC Financial Startup</h1>

        <!-- Company Image (centered) -->
        <img src="../CNIT131AFiles/financialstartup.jpg" alt="ABC Financial Startup" class="centerimg" />

        <!-- Introductory paragraph -->
        <p>We are a very young financial manager company and we are proud of our clients.</p>

        <!-- Client count -->
        <p class="clients">We have started with 1 client a little bit more than 10 years ago and now we have <strong><xsl:value-of select="count(/Accounts/Client)"/></strong> clients!</p>

        <!-- Client names separated by commas, final name preceded by ", and" -->
        <p>These are our clients: 
          <xsl:for-each select="/Accounts/Client">
            <xsl:value-of select="normalize-space(concat(Name/First, ' ', Name/Last))"/>
            <xsl:choose>
              <xsl:when test="position() = last()">.</xsl:when>
              <xsl:when test="position() = last() - 1">, and </xsl:when>
              <xsl:otherwise>, </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
        </p>

        <!-- Long-term clients count (more than 7 years) -->
        <p><xsl:value-of select="count(/Accounts/Client[Years &gt; 7])"/> of our clients have been with us for more than 7 years!</p>

      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
