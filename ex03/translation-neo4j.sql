CREATE (n:Folk {id: 100, name: 'Alex'});
CREATE (n:Folk {id: 20, name: 'Dad'});
CREATE (n:Folk {id: 30, name: 'Mom'});
CREATE (n:Folk {id: 10, name: 'Grandpa Bill'});
CREATE (n:Folk {id: 98, name: 'Sister Amy'});


CREATE (n:Location {vertex_id: 1, alias: 'NAmerica', label: 'Location', name: 'North America', type: 'continent'});
CREATE (n:Location {vertex_id: 2, alias: 'Europe', label: 'Location', name: 'Europe', type: 'continent'});
CREATE (n:Location {vertex_id: 3, alias: 'USA', label: 'Location', name: 'United States', type: 'country'});
CREATE (n:Location {vertex_id: 4, alias: 'UK', label: 'Location', name: 'United Kingdom', type: 'country'});
CREATE (n:Location {vertex_id: 5, alias: 'England', label: 'Location', name: 'England', type: 'country'});
CREATE (n:Location {vertex_id: 6, alias: 'Austria', label: 'Location', name: 'Österreich', type: 'country'});
CREATE (n:Location {vertex_id: 7, alias: 'Idaho', label: 'Location', name: 'Idaho', type: 'state'});
CREATE (n:Location {vertex_id: 8, alias: 'London', label: 'Location', name: 'London', type: 'city'});
CREATE (n:Location {vertex_id: 9, alias: 'UpperAustria', label: 'Location', name: 'Oberösterreich', type: 'Bundesland'});
CREATE (n:Location {vertex_id: 10, alias: 'Waldviertel', label: 'Location', name: 'Waldviertel', type: 'Viertel'});
CREATE (n:Location {vertex_id: 11, alias: 'Grein', label: 'Location', name: 'Grein', type: 'city'});

CREATE (n:Person {vertex_id: 12, alias: 'Andrea', label: 'Person', name: 'Andrea', type: 'person'});
CREATE (n:Person {vertex_id: 13, alias: 'Bert', label: 'Person', name: 'Bert', type: 'person'});
CREATE (n:Person {vertex_id: 14, alias: 'Christian', label: 'Person', name: 'Christian', type: 'person'});


MATCH (tail:Location {vertex_id: 3}), (head:Location {vertex_id: 1})
CREATE (tail)-[:WITHIN]->(head);

MATCH (tail:Location {vertex_id: 4}), (head:Location {vertex_id: 2})
CREATE (tail)-[:WITHIN]->(head);

MATCH (tail:Location {vertex_id: 5}), (head:Location {vertex_id: 4})
CREATE (tail)-[:WITHIN]->(head);

MATCH (tail:Location {vertex_id: 6}), (head:Location {vertex_id: 2})
CREATE (tail)-[:WITHIN]->(head);

MATCH (tail:Location {vertex_id: 7}), (head:Location {vertex_id: 3})
CREATE (tail)-[:WITHIN]->(head);

MATCH (tail:Location {vertex_id: 8}), (head:Location {vertex_id: 5})
CREATE (tail)-[:WITHIN]->(head);

MATCH (tail:Location {vertex_id: 9}), (head:Location {vertex_id: 6})
CREATE (tail)-[:WITHIN]->(head);

MATCH (tail:Location {vertex_id: 10}), (head:Location {vertex_id: 9})
CREATE (tail)-[:WITHIN]->(head);

MATCH (tail:Location {vertex_id: 11}), (head:Location {vertex_id: 10})
CREATE (tail)-[:WITHIN]->(head);

MATCH (tail:Person {vertex_id: 12}), (head:Location {vertex_id: 7})
CREATE (tail)-[:BORN_IN]->(head);

MATCH (tail:Person {vertex_id: 12}), (head:Location {vertex_id: 8})
CREATE (tail)-[:LIVES_IN]->(head);

MATCH (tail:Person {vertex_id: 13}), (head:Location {vertex_id: 11})
CREATE (tail)-[:BORN_IN]->(head);

MATCH (tail:Person {vertex_id: 13}), (head:Location {vertex_id: 8})
CREATE (tail)-[:LIVES_IN]->(head);

MATCH (tail:Person {vertex_id: 14}), (head:Location {vertex_id: 8})
CREATE (tail)-[:BORN_IN]->(head);

MATCH (tail:Person {vertex_id: 12}), (head:Person {vertex_id: 13})
CREATE (tail)-[:MARRIED]->(head);

MATCH (tail:Person {vertex_id: 13}), (head:Person {vertex_id: 12})
CREATE (tail)-[:MARRIED]->(head);
