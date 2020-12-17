# should solve one and two... but two would take a looong time!
# for two change the number of loops
#lloops="30000002"
lloops="2022"
#used sql... tired of parsing arrays in bash
source sqlsettings.sh
# CREATE TABLE aoc (id int(8) UNSIGNED AUTO_INCREMENT PRIMARY KEY, data int(32));
# truncate table aoc
# query="insert into aoc (data) values (11),(18),(0),(20),(1),(7),(16);
# mysql -u $sqluser -p$sqlpass $sqldb -N -B -r -e "$query"
i="1"
while true; do
	latestrec=()
	query="select id,data from aoc ORDER BY id DESC LIMIT 1;"
	latestrec=($(mysql -u $dbuser -p$dbpass $dbname -N -B -r -e "$query"))

	beenseen=""
	query="select id,data from aoc where data=${latestrec[1]} and id !=${latestrec[0]} ORDER BY id DESC LIMIT 1;"
	beenseen=($(mysql -u $dbuser -p$dbpass $dbname -N -B -r -e "$query"))

	if [[ "$beenseen" = "" ]]; then
		newnum="0"
	else
		newnum="$((latestrec[0]-beenseen[0]))"
	fi

	query="insert into aoc (data) values ($newnum);"
	mysql -u $dbuser -p$dbpass $dbname -N -B -r -e "$query"

	if [[ "$(( i % 50000 ))" = "0" ]]; then # clean db or 30M records saturate ram
		echo "50k -> cleaning"
		query="delete aoc from aoc inner join ( select max(id) as lastId, data from aoc where data in (select data from aoc group by data having count(*) > 1) group by data) duplic on duplic.data = aoc.data where aoc.id < duplic.lastId;"
		mysql -u $dbuser -p$dbpass $dbname -N -B -r -e "$query"
	fi

	if [[ "${latestrec[0]}" -ge "$lloops" ]]; then break; fi
	(( i ++ ))
done
query="select id,data from aoc ORDER BY id DESC LIMIT 5;"
mysql -u $dbuser -p$dbpass $dbname -N -B -r -e "$query"
