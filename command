Export from Agentforce Vibes IDE
cd ~/dx-project
ls sfdx-project.json   # must exist, else cd into the right folder
zip -r /tmp/MyProject.zip . -x ".git/*" ".sf/*" ".sfdx/*" "node_modules/*" "*.zip"
cp /tmp/MyProject.zip ~/dx-project/MyProject.zip

Open on the Mac
mkdir -p ~/Projects/MyProject
unzip -q ~/Downloads/MyProject.zip -d ~/Projects/MyProject
cd ~/Projects/MyProject
git init -q && git add -A && git commit -qm "starter"   # free undo button
code .                                                 # or VS Code → File → Open Folder

Install only the skills you need
npx skills add forcedotcom/sf-skills
agentforce-generate
gentforce-observe
agentforce-test 
automation-flow-generate
platform-metadata-api-context-get
platform-metadata-deploy
platform-metadata-retrieve

Log in and set the default org
sf org login web --alias bootcamp --set-default
sf org display

Org inventory → files
mkdir -p .inventory && cd .inventory

# Objects: custom only. Skip --sobject all (1,000+ lines = token sink)
sf sobject list --sobject custom > custom-objects.txt

# Licenses: which features exist
sf data query -q "SELECT MasterLabel, TotalLicenses, UsedLicenses FROM PermissionSetLicense WHERE Status='Active' ORDER BY MasterLabel" > licenses.txt

# Record counts: what actually has data
sf api request rest "/services/data/v62.0/limits/recordCount" > recordcounts.json

# Active flows: logic you can wrap as agent actions
sf data query -q "SELECT ApiName, Label, ProcessType, TriggerType FROM FlowDefinitionView WHERE IsActive = true ORDER BY Label" > flows.txt

# Existing agents and data libraries
sf data query -q "SELECT DeveloperName, MasterLabel, Type FROM BotDefinition" > agents.txt
sf agent adl list > data-libraries.txt 2>&1
cd ..



Read CLAUDE.md and HANDOFF.md first… Do the next step.
  


