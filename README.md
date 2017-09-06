# XML visualisation as ASCII or HTML fieldset (XSLT 2.0)
A couple of zero or low configurable stylesheets to transform *any* data-centric XML document to provide an automated visualisation as ASCII or HTML fieldset presentation. For example it is ideal as a quick and no fuss rendition for FpML documents. 

## As ASCII
'''
╔Request Confirmation════════════════════════════════════════════════════════════╗
║ Fpml Version: 5-0                                                              ║
║╔Header════════════════════════════════════════════════════════════════════════╗║
║║ Message Id Scheme: http://www.partyA.com/coding-scheme/message-id            ║║
║║ Message Id: 2342342                                                          ║║
║║ Sent By: PARTYABIC1                                                          ║║
║║ Send To: ABC                                                                 ║║
║║ Creation Timestamp: 2007-01-05T15:38:00Z                                     ║║
║╚══════════════════════════════════════════════════════════════════════════════╝║
║ Is Correction: false                                                           ║
║ Correlation Id Scheme: http://www.example.com/correlationId                    ║
║ Correlation Id: CORR/2007/01/02/2342322                                        ║
║ Sequence Number: 1                                                             ║
║╔Trade═════════════════════════════════════════════════════════════════════════╗║
║║┌Trade Header────────────────────────────────────────────────────────────────┐║║
║║│┌Party Trade Identifier────────────────────────────────────────────────────┐│║║
║║││┌Party Reference─────────────────────────────────────────────────────────┐││║║
║║│││ Href: Party1                                                           │││║║
║║││└────────────────────────────────────────────────────────────────────────┘││║║
║║││ Trade Id Scheme: http://www.PartyA.com/eqd-trade-id                      ││║║
║║││ Trade Id: Trade123                                                       ││║║
║║│└──────────────────────────────────────────────────────────────────────────┘│║║
║║│ Id: TRADEDATE                                                              │║║
║║│ Trade Date: 2006-12-05Z                                                    │║║
║║└────────────────────────────────────────────────────────────────────────────┘║║

'''

## As HTML
* Terminal window and MS Windows CSS themes provided.
* CSS filename can be swapped out by passing stylesheet $theme parameter.
* Simple JavaScript functionality adds collapse and expand feature on clicking fieldset legends. 
* local:path() builds current node XPath as fieldset legend title tooltip. 

## Other notes
* local:camel-case-to-words() manages XML tree node names to presentable fieldset legends.
