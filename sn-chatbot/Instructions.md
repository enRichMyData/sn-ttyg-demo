# TTYG demo Instructions
TTYG [documentation](https://graphdb.ontotext.com/documentation/11.0/talk-to-graph.html)

* GDB Download and install from [download page](https://www.ontotext.com/products/graphdb/#try-graphdb)
* Fill in form 
* Install distribution for your OS
* Launch GDB

# Add OpenAI creds
From the system dialog of the desktop application 

Settings > Set > Save And Restart

![](img/config-api-key.png)

* key: 
```
graphdb.openai.api-key
```
* value: 
```
Ask nikola!
```

See [doc](https://graphdb.ontotext.com/documentation/11.0/directories-and-config-properties.html#configuration) for other means of setting configuration variables.  

*This API key has a very low global limit. 
Please don't abuse it for purposes other than this demo, it's not worth it!*


# Create a repository 

Setup > Repository > New GraphDB repository 
- name `snproc`
- check box to enable FTS 

# Load data 

Import > Get RDF data from URL 

Paste this link 
```
https://github.com/enRichMyData/sn-ttyg-demo/raw/refs/heads/master/sn-chatbot/data/out/snproc.data.ttl.zip
``` 

# Talk To Your Graph

Lab > Talk To Your Graph

*Can get extremly slow due to OpenAI's new restrictions*

select `emd-sn-proc-demo`

this chatbot is configured to generate SPARQL queries based on ther ontoogy and iuse them to query the data 

Converse with the data using the chatbot interface.

Use `explain response` button to see the generated query  

Example questions: 

* What is in your database?`
* What countries are represented in the data?`
* How many buyers from France do you have in the data?
* What is the total amount of the tenders from french buyer for the month of march 2025?

![](img/ttyg.png)