PREFIX gn: <https://www.geonames.org/ontology#>
PREFIX cpv: <http://purl.org/cpv/2008/>
PREFIX onto: <http://www.ontotext.com/>
PREFIX : <http://sndemo.ontotext.com/ontology/>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

CLEAR SILENT GRAPH <http://sndemo.ontotext.com/ontology/> ;

INSERT {
    GRAPH <http://sndemo.ontotext.com/ontology/> {
    ?x ?p ?o .
	}
}
WHERE {
    {
        SELECT DISTINCT ?x {
            {
                [] ?x []
            } UNION {
                [] a ?x
            }
        }
    }
    UNION {
        ?x rdfs:isDefinedBy :
    }
    UNION {
            SELECT ?x (count(*) as ?c) {
                ?thing :cpv ?x
            } group by ?x having(?c>25)
        }
    UNION {
        ?x a gn:Code ; skos:inScheme gn:A .
    }
    {
        ?x ?p ?o .
        filter(?p not in 	(owl:sameAs,owl:propertyChainAxiom,skos:historyNote,skos:narrower,skos:inScheme,skos:altLabel))
    } 
}   