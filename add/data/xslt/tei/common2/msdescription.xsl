<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="tei" version="2.0">
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl" scope="stylesheet" type="stylesheet">
    <desc>
      <p> TEI stylesheet dealing with elements from the msdescription module. </p>
      <p>This software is dual-licensed:

1. Distributed under a Creative Commons Attribution-ShareAlike 3.0
Unported License http://creativecommons.org/licenses/by-sa/3.0/ 

2. http://www.opensource.org/licenses/BSD-2-Clause
		
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

* Redistributions of source code must retain the above copyright
notice, this list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright
notice, this list of conditions and the following disclaimer in the
documentation and/or other materials provided with the distribution.

This software is provided by the copyright holders and contributors
"as is" and any express or implied warranties, including, but not
limited to, the implied warranties of merchantability and fitness for
a particular purpose are disclaimed. In no event shall the copyright
holder or contributors be liable for any direct, indirect, incidental,
special, exemplary, or consequential damages (including, but not
limited to, procurement of substitute goods or services; loss of use,
data, or profits; or business interruption) however caused and on any
theory of liability, whether in contract, strict liability, or tort
(including negligence or otherwise) arising in any way out of the use
of this software, even if advised of the possibility of such damage.
</p>
      <p>Author: See AUTHORS</p>
      <p>Id: $Id: msdescription.xsl 9646 2011-11-05 23:39:08Z rahtz $</p>
      <p>Copyright: 2011, TEI Consortium</p>
    </desc>
  </doc>


  <xsl:template name="msSection">
    <xsl:param name="heading"/>
    <xsl:param name="level"/>
    <xsl:param name="implicitBlock"/>
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template name="msBlock">
    <xsl:param name="style"/>
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template name="msInline">
    <xsl:param name="before"/>
    <xsl:param name="after"/>
    <xsl:param name="style"/>
    <xsl:value-of select="$before"/>
    <xsl:apply-templates/>
    <xsl:value-of select="$after"/>
  </xsl:template>
  <xsl:template name="msLabelled">
    <xsl:param name="before"/>
    <xsl:value-of select="$before"/>
    <xsl:text>: </xsl:text>
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template name="msLiteral">
    <xsl:param name="text"/>
    <xsl:value-of select="$text"/>
  </xsl:template>
  <!-- headings -->
  <xsl:template match="tei:accMat">
    <xsl:call-template name="msSection">
      <xsl:with-param name="level">2</xsl:with-param>
      <xsl:with-param name="heading">
        <xsl:text>Accompanying material</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="tei:additional">
    <xsl:call-template name="msSection">
      <xsl:with-param name="level">2</xsl:with-param>
      <xsl:with-param name="heading">
        <xsl:text>Additional</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="tei:bindingDesc">
    <xsl:call-template name="msSection">
      <xsl:with-param name="level">2</xsl:with-param>
      <xsl:with-param name="heading">
        <xsl:text>Binding</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="tei:msContents">
    <xsl:call-template name="msSection">
      <xsl:with-param name="level">1</xsl:with-param>
      <xsl:with-param name="heading">
        <xsl:text>Contents</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="tei:msDesc/tei:head">
    <xsl:call-template name="msBlock">
      <xsl:with-param name="style">msHead</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="tei:history">
    <xsl:call-template name="msSection">
      <xsl:with-param name="level">1</xsl:with-param>
      <xsl:with-param name="heading">
        <xsl:text>History</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="tei:provenance">
    <xsl:call-template name="msSection">
      <xsl:with-param name="level">2</xsl:with-param>
      <xsl:with-param name="heading">
        <xsl:text>Provenance</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="tei:acquisition">
    <xsl:call-template name="msSection">
      <xsl:with-param name="level">2</xsl:with-param>
      <xsl:with-param name="heading">
        <xsl:text>Acquisition</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="tei:origin">
    <xsl:call-template name="msSection">
      <xsl:with-param name="level">2</xsl:with-param>
      <xsl:with-param name="heading">
        <xsl:text>Origin</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="tei:msIdentifier">
    <xsl:call-template name="msSection">
      <xsl:with-param name="level">1</xsl:with-param>
      <xsl:with-param name="heading">
        <xsl:text>Identification</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="tei:layoutDesc">
    <xsl:call-template name="msSection">
      <xsl:with-param name="level">3</xsl:with-param>
      <xsl:with-param name="heading">
        <xsl:text>Layout</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="tei:decoDesc">
    <xsl:call-template name="msSection">
      <xsl:with-param name="level">3</xsl:with-param>
      <xsl:with-param name="heading">
        <xsl:text>Decoration</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="tei:msWriting">
    <xsl:call-template name="msSection">
      <xsl:with-param name="level">2</xsl:with-param>
      <xsl:with-param name="heading">
        <xsl:text>Writing</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="tei:musicNotation">
    <xsl:call-template name="msSection">
      <xsl:with-param name="level">2</xsl:with-param>
      <xsl:with-param name="heading">
        <xsl:text>Music notation</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="tei:objectDesc">
    <xsl:call-template name="msSection">
      <xsl:with-param name="level">2</xsl:with-param>
      <xsl:with-param name="heading">
        <xsl:text>Object</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="tei:physDesc">
    <xsl:call-template name="msSection">
      <xsl:with-param name="level">1</xsl:with-param>
      <xsl:with-param name="heading">
        <xsl:text>Physical description</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="tei:seal">
    <xsl:call-template name="msSection">
      <xsl:with-param name="level">4</xsl:with-param>
      <xsl:with-param name="heading">
        <xsl:text>Seal</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="tei:sealDesc">
    <xsl:call-template name="msSection">
      <xsl:with-param name="level">3</xsl:with-param>
      <xsl:with-param name="heading">
        <xsl:text>Seal description</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="tei:supportDesc">
    <xsl:call-template name="msSection">
      <xsl:with-param name="level">3</xsl:with-param>
      <xsl:with-param name="heading">
        <xsl:text>Support description</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="tei:support">
    <xsl:call-template name="msSection">
      <xsl:with-param name="level">4</xsl:with-param>
      <xsl:with-param name="heading">
        <xsl:text>Support</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="tei:collation">
    <xsl:call-template name="msSection">
      <xsl:with-param name="level">4</xsl:with-param>
      <xsl:with-param name="heading">
        <xsl:text>Collation</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="tei:extent">
    <xsl:call-template name="msSection">
      <xsl:with-param name="level">4</xsl:with-param>
      <xsl:with-param name="implicitBlock">true</xsl:with-param>
      <xsl:with-param name="heading">
        <xsl:text>Extent</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="tei:incipit">
    <xsl:call-template name="msSection">
      <xsl:with-param name="level">2</xsl:with-param>
      <xsl:with-param name="heading">
        <xsl:text>Incipit</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="tei:explicit">
    <xsl:call-template name="msSection">
      <xsl:with-param name="level">2</xsl:with-param>
      <xsl:with-param name="heading">
        <xsl:text>Explicit</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="tei:msItem/tei:listBibl">
    <xsl:call-template name="msSection">
      <xsl:with-param name="level">2</xsl:with-param>
      <xsl:with-param name="heading">
        <xsl:text>Text editions</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <!-- inline -->
  <xsl:template match="tei:abbr">
    <xsl:choose>
      <xsl:when test="parent::tei:choice">
	</xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="msInline"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="tei:orig">
    <xsl:choose>
      <xsl:when test="parent::tei:choice">
	</xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="msInline"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="tei:textLang">
    <xsl:choose>
      <xsl:when test="preceding-sibling::tei:summary"/>
      <xsl:when test="preceding-sibling::tei:*">
        <xsl:call-template name="msLiteral">
          <xsl:with-param name="text">
            <xsl:text>, </xsl:text>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:when>
    </xsl:choose>
    <xsl:call-template name="msLabelled">
      <xsl:with-param name="before">Language of text</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="tei:summary">
    <xsl:choose>
      <xsl:when test="preceding-sibling::tei:*">
        <xsl:call-template name="msLiteral">
          <xsl:with-param name="text">
            <xsl:text>, </xsl:text>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:when>
    </xsl:choose>
    <xsl:call-template name="msLabelled">
      <xsl:with-param name="before">Summary</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="tei:rubric">
    <xsl:if test="preceding-sibling::tei:*">
      <xsl:call-template name="msLiteral">
        <xsl:with-param name="text">
          <xsl:text> </xsl:text>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:if>
    <xsl:call-template name="msInline"/>
  </xsl:template>
  <xsl:template match="tei:msItem/tei:author">
    <xsl:if test="preceding-sibling::tei:*">
      <xsl:call-template name="msLiteral">
        <xsl:with-param name="text">
          <xsl:text> </xsl:text>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:if>
    <xsl:call-template name="msInline"/>
  </xsl:template>
  <xsl:template match="tei:msItem/tei:title">
    <xsl:if test="preceding-sibling::tei:*">
      <xsl:call-template name="msLiteral">
        <xsl:with-param name="text">
          <xsl:text> </xsl:text>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:if>
    <xsl:call-template name="msInline">
      <xsl:with-param name="style">italic</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="tei:expan/tei:ex">
    <xsl:call-template name="msInline">
      <xsl:with-param name="before">(</xsl:with-param>
      <xsl:with-param name="after">)</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="tei:locus">
    <xsl:call-template name="msInline">
      <xsl:with-param name="style">bold</xsl:with-param>
      <xsl:with-param name="before"/>
      <xsl:with-param name="after">: </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="tei:supplied[@reason='damage']">
    <xsl:call-template name="msInline">
      <xsl:with-param name="before">&lt;</xsl:with-param>
      <xsl:with-param name="after">&gt;</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="tei:supplied[@reason='illegible']">
    <xsl:call-template name="msInline">
      <xsl:with-param name="before">[</xsl:with-param>
      <xsl:with-param name="after">]</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="tei:supplied[@reason='omitted']">
    <xsl:call-template name="msInline">
      <xsl:with-param name="before">⟨</xsl:with-param>
      <xsl:with-param name="after">⟩</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="tei:gap" priority="10">
    <xsl:call-template name="msInline">
      <xsl:with-param name="before">[...]</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="tei:unclear" priority="10">
    <xsl:call-template name="msInline">
      <xsl:with-param name="after">[?]</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="tei:placeName|tei:genName|tei:geogName|tei:roleName|tei:name|tei:persName">
    <xsl:choose>
      <xsl:when test="*">
        <xsl:apply-templates/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="msInline"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="tei:dimensions">
    <xsl:for-each select="*">
      <xsl:apply-templates select="."/>
      <xsl:call-template name="msLiteral">
        <xsl:with-param name="text">
          <xsl:choose>
            <xsl:when test="string-length(.)=0 and @extent">
              <xsl:value-of select="@extent"/>
            </xsl:when>
            <xsl:when test="@unit">
              <xsl:value-of select="@unit"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>mm</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:if test="following-sibling::*">
            <xsl:text> x </xsl:text>
          </xsl:if>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="tei:origDate">
    <xsl:apply-imports/>
    <xsl:if test="following-sibling::tei:origPlace">
      <xsl:call-template name="msLiteral">
        <xsl:with-param name="text">
          <xsl:text>, </xsl:text>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <xsl:template match="tei:msIdentifier/tei:*">
    <xsl:apply-imports/>
    <xsl:if test="following-sibling::tei:*/text()">
      <xsl:call-template name="msLiteral">
        <xsl:with-param name="text">
          <xsl:text>, </xsl:text>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <!--
    <handNote scribe="AM_544_4to_1"
    script="carolingian-insular minuscule"
    medium="ink" scope="sole"> 
-->
  <xsl:template match="tei:handNote">
    <xsl:if test="not(preceding-sibling::tei:handNote)">
      <xsl:variable name="Notes">
        <tei:list type="ordered">
          <xsl:for-each select="../tei:handNote">
            <item>
              <xsl:copy-of select="*|text()"/>
            </item>
          </xsl:for-each>
        </tei:list>
      </xsl:variable>
      <xsl:apply-templates select="$Notes"/>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
