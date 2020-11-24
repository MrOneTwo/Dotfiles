# Defined in - @ line 0
set TOKEN ...
function cju --description alias\ cju=curl\ -X\ GET\ \"http://michalc:$TOKEN@carnegiebrewery.smarteye.se/jenkins/job/TrackerCoreKPIManual/api/json\?tree=builds\\\[number,url,description,result\\\]\"\ \|\ jq\ \".builds\[\]\ \|\ select\(.description\ \|\ contains\(\\\"Michal\\\"\)\)\"
	curl -X GET "http://michalc:$TOKEN@carnegiebrewery.smarteye.se/jenkins/job/TrackerCoreKPIManual/api/json?tree=builds\[number,url,description,result\]" | jq ".builds[] | select(.description | contains(\"Michal\"))" $argv;
end
