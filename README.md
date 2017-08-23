# XML visualisation as HTML fieldset (XSLT 2.0)
Non configurable stylesheet to transform any data-centric XML document to provide an automated visualisation as HTML. Terminal window and MS Windows CSS themes provided.

CSS filename can be swapped out by passing stylesheet $theme parameter.

Function local:camel-case-to-words(name(), ' ') manages XML tree node names to presentable fieldset legends and a friendlier HTML view.

Function local:path(node()) evaluates each XML tree node XPath string so that is can be presented as a tooltip title on hovering over fieldset legends. 

Simple JavaScript functionality adds collapse and expand feature on clicking fieldset legends. 
