resume.pdf: fop.xconf resume.xml resume.xsl
	fop -c fop.xconf -xml resume.xml -xsl resume.xsl -pdf resume.pdf
