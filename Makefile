copy:
	cp -rf ws-d21-vector-pipelines ~/workspace/datadog/LearningLabs
	cp ws-d21-vector-pipelines-pathway.json ~/workspace/datadog/LearningLabs

kill:
	pgrep -f kclocal | xargs kill -9

dev:
	kclocal -b

validate:
	katacoda validate:all --repo ~/workspace/katacoda-scenarios
