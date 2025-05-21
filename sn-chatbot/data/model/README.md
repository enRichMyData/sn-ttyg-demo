# Queries

```spaqrl
BASE <http://sndemo.ontotext.com/base/>
PREFIX : <http://sndemo.ontotext.com/ontology/>
PREFIX cpv: <http://purl.org/cpv/2008/code->
select 
?b ?name (sum(?amount) as ?sum_amount) 
where {
    ?b a :Buyer ; :country ?country ; :place ?place ; :name ?name .
    ?t a :Tender ; :buyer ?b ; :amount ?amount .
} 
group by ?b ?name order by desc(?sum_amount)
```

Extract places
```sparql
PREFIX : <http://sndemo.ontotext.com/ontology/>
select * where {
    ?s a :Buyer ; :place ?place ; :country ?country .
} 
```

post processing 
```sparql
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
delete where {
    ?s ?p ""^^xsd:dateTime .
}
```

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
delete {
    ?x rdfs:label ?o
}
where {
    ?x rdfs:label ?o
    filter(lang(?o) not in ("","en"))
}
```

# Misc