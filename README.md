# XML visualisation as ASCII or HTML fieldset (XSLT 2.0)
A couple of zero or low configurable stylesheets to transform *any* data-centric XML document to provide an automated visualisation as ASCII or HTML fieldset presentation. For example it is ideal as a quick and no fuss rendition for FpML documents. 

## As ASCII
╔RECIPES═════════════════════════════════════════════════════════════════════════╗
║╔RECIPE════════════════════════════════════════════════════════════════════════╗║
║║ NAME: Burton Ale                                                             ║║
║║ VERSION: 1                                                                   ║║
║║ TYPE: All Grain                                                              ║║
║║ BREWER: Brad Smith                                                           ║║
║║┌ASST BREWER─────────────────────────────────────────────────────────────────┐║║
║║└────────────────────────────────────────────────────────────────────────────┘║║
║║ BATCH SIZE: 18.92716800                                                      ║║
║║ BOIL SIZE: 20.81988500                                                       ║║
║║ BOIL TIME: 60                                                                ║║
║║ EFFICIENCY: 72.0                                                             ║║
║║┌HOPS────────────────────────────────────────────────────────────────────────┐║║
║║│┌HOP───────────────────────────────────────────────────────────────────────┐│║║
║║││ NAME: Goldings, East Kent                                                ││║║
║║││ VERSION: 1                                                               ││║║
║║││ ORIGIN: United Kingdom                                                   ││║║

## As HTML
* Terminal window and MS Windows CSS themes provided.
* CSS filename can be swapped out by passing stylesheet $theme parameter.
* Simple JavaScript functionality adds collapse and expand feature on clicking fieldset legends. 
* local:path() builds current node XPath as fieldset legend title tooltip. 

## Other notes
* local:camel-case-to-words() manages XML tree node names to presentable fieldset legends.
