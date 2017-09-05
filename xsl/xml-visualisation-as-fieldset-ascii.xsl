<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:functx="http://www.functx.com" 
    xmlns:local="local" 
    xmlns:l="local" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all">

    <xsl:import href="functx-1.0-nodoc-2007-01.xslt"/>

    <xsl:output method="text" encoding="UTF-16"/>

    <xsl:strip-space elements="*"/>

    <xsl:param name="w" as="xs:integer" select="80"/>
    <xsl:param name="b" as="xs:integer" select="2"/>
    <xsl:param name="s" as="xs:string" select="':'"/>
    <xsl:param name="o" as="xs:string" select="'…'"/>

    <xsl:variable name="n" select="'&#10;'"/>

    <xsl:template match="/">
        <xsl:apply-templates>
            <xsl:with-param name="a" select="0" tunnel="yes"/>
            <xsl:with-param name="l" select="''" tunnel="yes"/>
            <xsl:with-param name="r" select="''" tunnel="yes"/>
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template match="*[*] | *[not(*)][not(normalize-space())]">
        <xsl:param name="a" as="xs:integer" tunnel="yes"/>
        <xsl:param name="l" as="xs:string" tunnel="yes"/>
        <xsl:param name="r" as="xs:string" tunnel="yes"/>

        <xsl:variable name="t" as="xs:string" select="local:node-name-to-words(.)"/>
        <xsl:variable name="y" as="xs:integer" select="$w - $a * 2"/>

        <xsl:value-of
            select="
            if ($a lt $b) then 
                concat($l, '╔', $t, l:h($y - l:l($t), '═'), '╗', $r, $n) 
            else 
                concat($l, '┌', $t, l:h($y - l:l($t), '─'), '┐', $r, $n)
                "/>

        <xsl:apply-templates select="@* | node()">
            <xsl:with-param name="a" select="$a + 1" tunnel="yes"/>
            <xsl:with-param name="l" tunnel="yes" select="if ($a lt $b) then concat($l, '║') else concat($l, '│')"/>
            <xsl:with-param name="r" tunnel="yes" select="if ($a lt $b) then concat('║', $r) else concat('│', $r)"/>
        </xsl:apply-templates>

        <xsl:value-of
            select="
            if ($a lt $b) then
                concat($l, '╚', l:h($y, '═'), '╝', $r, $n)
            else
                concat($l, '└', l:h($y, '─'), '┘', $r, $n)
                "/>

    </xsl:template>

    <xsl:template match="*[not(*)][normalize-space()] | @*">
        <xsl:param name="a" as="xs:integer" tunnel="yes"/>
        <xsl:param name="l" as="xs:string" tunnel="yes"/>
        <xsl:param name="r" as="xs:string" tunnel="yes"/>

        <xsl:variable name="y" as="xs:integer" select="$w - $a * 2"/>
        <xsl:variable name="t" as="xs:string" select="local:node-name-to-words(.)"/>
        <xsl:variable name="v" as="xs:string" select="substring(., 0, $y - (l:l($t) + $a))"/>
        <xsl:variable name="o" as="xs:string" select="if (l:l(.) eq l:l($v)) then '' else $o"/>

        <xsl:apply-templates select="@*"/>

        <xsl:value-of select="concat($l, ' ', $t, $s, ' ', $v, $o, l:h($y - l:l(concat($t, $s, ' ', $v, $o)), ' '), ' ', $r, $n)"/>

    </xsl:template>

    <xsl:function name="local:node-name-to-words" as="xs:string">
        <xsl:param name="node"/>

        <xsl:variable name="void" select="$node/local-name()"/>
        <xsl:variable name="void" select="local:camel-case-to-words($void, ' ')"/>
        <xsl:variable name="void" select="functx:capitalize-first($void)"/>
        <xsl:variable name="void" select="translate($void, '.-_', '   ')"/>

        <xsl:value-of select="$void"/>

    </xsl:function>

    <xsl:function name="local:camel-case-to-words" as="xs:string">
        <xsl:param name="arg" as="xs:string?"/>
        <xsl:param name="delim" as="xs:string"/>

        <xsl:variable name="chars" select="functx:chars($arg)"/>
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
    
    <xsl:function name="l:l" as="xs:integer">
        <xsl:param name="string" as="xs:string"/>
        
        <xsl:sequence select="string-length($string)"/>
        
    </xsl:function>

    <xsl:function name="l:h" as="xs:string">
        <xsl:param name="quantity" as="xs:integer"/>
        <xsl:param name="item" as="item()"/>

        <xsl:sequence select="string-join(local:hatch($quantity, $item), '')"/>

    </xsl:function>

    <xsl:function name="local:hatch" as="item()*">
        <xsl:param name="quantity" as="xs:integer"/>
        <xsl:param name="item" as="item()"/>

        <xsl:sequence select="for $i in 1 to $quantity return $item"/>

    </xsl:function>

</xsl:stylesheet>
