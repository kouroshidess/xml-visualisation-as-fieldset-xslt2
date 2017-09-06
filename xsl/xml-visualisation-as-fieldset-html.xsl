<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:local="local" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all">

    <xsl:param name="theme">terminal-window</xsl:param>

    <xsl:output method="xhtml" indent="yes"/>

    <xsl:strip-space elements="*"/>

    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="static/css/{$theme}.css"/>
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

    <xsl:template match="*[*] | *[not(*)][not(normalize-space())]">
        <fieldset class="{
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
                <input id="{generate-id()}" value="{.}" title="{.}" readonly="readonly"/>
            </dd>
        </dl>
    </xsl:template>

    <xsl:function name="local:node-name-to-words" as="xs:string">
        <xsl:param name="node"/>
        <xsl:variable name="void" select="$node/local-name()"/>
        <xsl:variable name="void" select="local:camel-case-to-words($void, ' ')"/>
        <xsl:variable name="void" select="concat(upper-case(substring($void,1,1)), substring($void,2))"/>
        <xsl:variable name="void" select="translate($void, '.-_', '   ')"/>
        <xsl:value-of select="$void"/>
    </xsl:function>

    <xsl:function name="local:camel-case-to-words" as="xs:string">
        <xsl:param name="string" as="xs:string?"/>
        <xsl:param name="delim" as="xs:string"/>
        <xsl:variable name="chars" select="for $i in string-to-codepoints($string) return codepoints-to-string($i)"/>
        <xsl:variable name="void"
            select="
      for $i in 1 to count($chars)
      return
      (
      $chars[$i],
      if (matches($chars[$i], '[a-z]') 
      and matches($chars[$i +1], '[A-Z]')) then
      $delim
      else if (matches($chars[$i], '[A-Z]') 
      and matches($chars[$i +1], '[A-Z]') 
      and matches($chars[$i +2], '[a-z]')) then
      $delim
      else
      ()
      )"/>
        <xsl:variable name="void" select="string-join($void, '')"/>
        <xsl:value-of select="$void"/>
    </xsl:function>

    <xsl:function name="local:path" as="xs:string">
        <xsl:param name="node" as="node()"/>
        <xsl:variable name="nodes" as="node()*" select="$node/ancestor-or-self::node()
      [. instance of element() or . instance of attribute()]"/>
        <xsl:variable name="xpath-items" as="xs:string*">
            <xsl:for-each select="$nodes">
                <xsl:choose>
                    <xsl:when test=". instance of attribute()">
                        <xsl:value-of select="concat('@', current()/name())"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="current()/name()"/>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:if test="preceding-sibling::node()[name() = current()/name()]">
                    <xsl:value-of select="concat('[', count(preceding-sibling::*[name() = current()/name()]) +1, ']')"/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="xpath" as="xs:string" select="string-join(('', $xpath-items), '/')"/>
        <xsl:value-of select="$xpath"/>
    </xsl:function>

</xsl:stylesheet>
