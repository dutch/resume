<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:attribute-set name="section-separator">
    <xsl:attribute name="margin-top">0.1in</xsl:attribute>
    <xsl:attribute name="padding-top">0.1in</xsl:attribute>
    <xsl:attribute name="border-top-width">1px</xsl:attribute>
    <xsl:attribute name="border-top-style">dotted</xsl:attribute>
    <xsl:attribute name="border-top-color">#aaa</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="section-body">
    <xsl:attribute name="margin-top">-12px</xsl:attribute>
    <xsl:attribute name="margin-left">1in</xsl:attribute>
  </xsl:attribute-set>
  <xsl:template match="resume">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
      <fo:layout-master-set>
        <fo:simple-page-master master-name="resume" page-width="8.5in" page-height="11in">
          <fo:region-body margin="1in" margin-top="1.5in" margin-bottom="1.5in"/>
        </fo:simple-page-master>
      </fo:layout-master-set>
      <fo:page-sequence master-reference="resume">
        <fo:flow flow-name="xsl-region-body" color="#555" font-family="Core Sans NR">
          <fo:block font-size="30pt">
            <xsl:value-of select="firstname"/>
            <xsl:text> </xsl:text>
            <fo:inline color="#027dba">
              <xsl:value-of select="lastname"/>
            </fo:inline>
          </fo:block>
          <fo:block color="#999" font-size="9pt">
            <fo:block>
              <xsl:value-of select="address/street"/>
              <xsl:text> </xsl:text>
              <fo:inline color="#027dba">
                <xsl:text>•</xsl:text>
              </fo:inline>
              <xsl:text> </xsl:text>
              <xsl:value-of select="address/city"/>
              <xsl:text> </xsl:text>
              <fo:inline color="#027dba">
                <xsl:text>•</xsl:text>
              </fo:inline>
              <xsl:text> </xsl:text>
              <xsl:value-of select="address/zip"/>
            </fo:block>
            <fo:block>
              <fo:inline color="#555" font-weight="bold">
                CELL
              </fo:inline>
              <xsl:text> </xsl:text>
              <xsl:value-of select="phone"/>
              <xsl:text> </xsl:text>
              <fo:inline color="#027dba">
                <xsl:text>•</xsl:text>
              </fo:inline>
              <xsl:text> </xsl:text>
              <fo:inline color="#555" font-weight="bold">
                EMAIL
              </fo:inline>
              <xsl:text> </xsl:text>
              <xsl:value-of select="email"/>
            </fo:block>
          </fo:block>
          <fo:block margin-top="0.3in" font-size="10pt">
            <fo:block color="#027dba">
              PROFILE
            </fo:block>
            <fo:block text-align="justify" xsl:use-attribute-sets="section-body">
              <xsl:value-of select="profile"/>
            </fo:block>
          </fo:block>
          <fo:block font-size="10pt" xsl:use-attribute-sets="section-separator">
            <fo:block color="#027dba">
              SKILLS
            </fo:block>
            <xsl:for-each select="skills">
              <fo:block margin-left="1in">
                <xsl:if test="position()=1">
                  <xsl:attribute name="margin-top">-12px</xsl:attribute>
                </xsl:if>
                <xsl:for-each select="skill">
                  <xsl:value-of select="text()"/>
                  <xsl:if test="position()!=last()">
                    <xsl:text> </xsl:text>
                    <fo:inline color="#027dba">
                      <xsl:text>•</xsl:text>
                    </fo:inline>
                    <xsl:text> </xsl:text>
                  </xsl:if>
                </xsl:for-each>
              </fo:block>
            </xsl:for-each>
          </fo:block>
          <fo:block font-size="10pt" xsl:use-attribute-sets="section-separator">
            <fo:block color="#027dba">
              EXPERIENCE
            </fo:block>
            <fo:block xsl:use-attribute-sets="section-body">
              <xsl:for-each select="jobs/job">
                <fo:block>
                  <xsl:value-of select="employer"/>
                  <xsl:text> </xsl:text>
                  <fo:inline color="#027dba">
                    <xsl:text>•</xsl:text>
                  </fo:inline>
                  <xsl:text> </xsl:text>
                  <fo:inline color="#999">
                    <xsl:value-of select="title"/>
                  </fo:inline>
                  <fo:block margin-top="-12px" color="#999" text-align="right">
                    <xsl:value-of select="date"/>
                  </fo:block>
                </fo:block>
                <fo:block margin-bottom="0.1in" text-align="justify">
                  <xsl:value-of select="description"/>
                </fo:block>
              </xsl:for-each>
            </fo:block>
          </fo:block>
          <fo:block font-size="10pt" xsl:use-attribute-sets="section-separator">
            <fo:block color="#027dba">
              EDUCATION
            </fo:block>
            <fo:block xsl:use-attribute-sets="section-body">
              <xsl:for-each select="schools/school">
                <fo:block>
                  <xsl:value-of select="degree"/>
                  <fo:block margin-top="-12px" color="#999" text-align="right">
                    <xsl:value-of select="date"/>
                  </fo:block>
                </fo:block>
                <fo:block>
                  <xsl:value-of select="name"/>
                </fo:block>
              </xsl:for-each>
            </fo:block>
          </fo:block>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>
</xsl:stylesheet>
