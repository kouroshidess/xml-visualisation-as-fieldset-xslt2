<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:functx="http://www.functx.com" xmlns:local="local"
  exclude-result-prefixes="#all">

  <xsl:import href="../../common-xslt-functions/xsl/xslt-functions.xsl"/>
  
  <xsl:param name="theme">terminal-window</xsl:param>

  <xsl:output method="xhtml" indent="yes"/>

  <xsl:strip-space elements="*"/>

  <xsl:template match="/">
    <html>
      <head>
        <link rel="stylesheet" type="text/css"
          href="static/css/{$theme}.css"/>
        <title>
          <xsl:value-of select="local:node-name-to-words(*)"/>
        </title>
      </head>
      <body>
        <form>
          <xsl:apply-templates/>
        </form>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.js" type="text/javascript"/>
        <script src="static/js/fieldset-legend-expand.js" type="text/javascript"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="*[*] | *[not(*)][not(normalize-space())][not(@*)]">
    <fieldset
      class="{
      if (count(ancestor-or-self::*) eq 1) then 'main'
      else if (count(ancestor-or-self::*) lt 3) then 'section'
      else 'subsection'
      }">
      <legend title="{local:path(.)}">
        <xsl:sequence select="local:node-name-to-words(.)"/>
      </legend>
      <xsl:apply-templates select="@* | node()"/>
    </fieldset>
  </xsl:template>

  <xsl:template match="*[not(*)][normalize-space()] | @*">
    <xsl:apply-templates select="@*"/>
    <dl class="form">
      <dt>
        <label for="{generate-id()}" title="{local:path(.)}">
          <xsl:value-of select="local:node-name-to-words(.)"/>
          <xsl:text>:</xsl:text>
        </label>
      </dt>
      <dd>
        <input id="{generate-id()}" value="{.}" title="{.}" readonly="readonly"
        />
      </dd>
    </dl>
  </xsl:template>

</xsl:stylesheet>
