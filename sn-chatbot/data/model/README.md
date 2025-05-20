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