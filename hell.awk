#!/usr/bin/gawk -f

BEGIN {
	artist="notset";
	timeStart="notset";
	dateStart="notset";
	timeEnd="notset";
	dateEnd="notset";
	stage="notset";
	counter = 0;

	print "resources: [\n \
	{ id: 'valley', title: 'Valley', eventColor: 'green' },\n \
	{ id: 'warzone', title: 'Warzone', eventColor: 'orange' },\n \
	{ id: 'altar', title: 'Altar', eventColor: 'red' },\n \
	{ id: 'temple', title: 'Temple', eventColor: 'blue' },\n \
	{ id: 'mainstage', title: 'Mainstage A', eventColor: 'yellow' },\n \
	{ id: 'mainstageb', title: 'Mainstage B', eventColor: 'pink' }\n \
	],\n"
	print "events: [\n"
}

/caption/ {
	match($0, /caption (.+)"/, stageArray);
	stage = stageArray[1];
}

/div class="nom-liste"/ {
	match($0, /">(.+)<\/div/, artistArray);
	artist = artistArray[1];
}

/2018-06/ {
	dateStart = $1;
	timeStart = $2;
	dateEnd = $4;
	timeEnd = $5;

	print "{ id: '" counter "', resourceId: '" stage "', title: '" artist "', start: '" dateStart "T" timeStart "', end: '" dateEnd "T" timeEnd "' },"
	counter++;
}

END {
	print "],\n"
}
