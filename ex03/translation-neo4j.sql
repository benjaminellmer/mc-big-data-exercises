CREATE (alex:Folk {id: 100, name: 'Alex'})
CREATE (dad:Folk {id: 20, name: 'Dad'})
CREATE (mom:Folk {id: 30, name: 'Mom'})
CREATE (grandpa:Folk {id: 10, name: 'Grandpa Bill'})
CREATE (amy:Folk {id: 98, name: 'Sister Amy'})

CREATE (dad)-[:FATHER]->(alex)
CREATE (mom)-[:MOTHER]->(alex)

CREATE (dad)-[:FATHER]->(amy)
CREATE (mom)-[:MOTHER]->(amy)

CREATE (alex)-[:BROTHER]->(amy)
CREATE (amy)-[:SISTER]->(alex)

CREATE (mom)-[:MARRIED]->(dad)
CREATE (dad)-[:MARRIED]->(mom)

CREATE (grandpa)-[:FATHER]->(dad);

CREATE (namerica:Location {alias: 'NAmerica', label: 'Location', name: 'North America', type: 'continent'})
CREATE (europe:Location {alias: 'Europe', label: 'Location', name: 'Europe', type: 'continent'})
CREATE (usa:Location {alias: 'USA', label: 'Location', name: 'United States', type: 'country'})
CREATE (uk:Location {alias: 'UK', label: 'Location', name: 'United Kingdom', type: 'country'})
CREATE (england:Location {alias: 'England', label: 'Location', name: 'England', type: 'country'})
CREATE (austria:Location {alias: 'Austria', label: 'Location', name: 'Österreich', type: 'country'})
CREATE (idaho:Location {alias: 'Idaho', label: 'Location', name: 'Idaho', type: 'state'})
CREATE (london:Location {alias: 'London', label: 'Location', name: 'London', type: 'city'})
CREATE (upperaustria:Location {alias: 'UpperAustria', label: 'Location', name: 'Oberösterreich', type: 'Bundesland'})
CREATE (waldviertel:Location {alias: 'Waldviertel', label: 'Location', name: 'Waldviertel', type: 'Viertel'})
CREATE (grein:Location {alias: 'Grein', label: 'Location', name: 'Grein', type: 'city'})

CREATE (usa)-[:WITHIN]->(namerica)
CREATE (uk)-[:WITHIN]->(europe)
CREATE (england)-[:WITHIN]->(uk)
CREATE (austria)-[:WITHIN]->(europe)
CREATE (idaho)-[:WITHIN]->(usa)
CREATE (london)-[:WITHIN]->(england)
CREATE (upperaustria)-[:WITHIN]->(austria)
CREATE (waldviertel)-[:WITHIN]->(upperaustria)
CREATE (grein)-[:WITHIN]->(waldviertel);

MATCH (idaho:Location {alias: 'Idaho'})
MATCH (london:Location {alias: 'London'})
MATCH (grein:Location {alias: 'Grein'})

CREATE (andrea:Person {alias: 'Andrea', label: 'Person', name: 'Andrea', type: 'person'})
CREATE (bert:Person {alias: 'Bert', label: 'Person', name: 'Bert', type: 'person'})
CREATE (christian:Person {alias: 'Christian', label: 'Person', name: 'Christian', type: 'person'})

CREATE (andrea)-[:BORN_IN]->(idaho)
CREATE (andrea)-[:LIVES_IN]->(london)

CREATE (bert)-[:BORN_IN]->(grein)
CREATE (bert)-[:LIVES_IN]->(london)

CREATE (christian)-[:BORN_IN]->(london)
	
CREATE (andrea)-[:MARRIED]->(bert)
CREATE (bert)-[:MARRIED]->(andrea);
