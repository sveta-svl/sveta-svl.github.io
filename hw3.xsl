<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>List of Clients</title>

        <style>
          table {
            border-collapse: collapse;
          }
          th, td {
            border: 2px solid blue;
            padding: 6px 10px;
          }
          th {
            text-align: left;
          }
          .right {
            text-align: right;
          }
          .low {
            color: red;
            font-weight: bold;
          }
        </style>
      </head>

      <body>
        <h1>List of Clients</h1>

        <table>
          <tr>
            <th>Name</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Account Total</th>
          </tr>

          <xsl:for-each select="Accounts/Client">
            <tr>
              <td>
                <xsl:value-of select="Name/First"/>
                <xsl:value-of select="Name/Last"/>
              </td>
              <td>
                <xsl:value-of select="Phone"/>
              </td>
              <td>
                <xsl:value-of select="E-mail"/>
              </td>
              <td class="right">
                <xsl:choose>
                  <xsl:when test="Account_Total &lt;= 80000">
                    <span class="low">
                      $<xsl:value-of select="Account_Total"/>
                    </span>
                  </xsl:when>
                  <xsl:otherwise>
                    $<xsl:value-of select="Account_Total"/>
                  </xsl:otherwise>
                </xsl:choose>
              </td>
            </tr>
          </xsl:for-each>

        </table>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
