import csv
import json

war_list_file="war_list.csv"
template_file="weblogic10_app_deploy_tpl.json"

print """
Marathon JSON Auto configurator

Properties: war_list.csv - a list of war files to build the Marathon configuration files
                CSV File Schema (number corresponds to field number):
                ----------------
                0 - Marathon JSON file name
                1 - Marathon task name (i.e. /my-app-group/app1)
                2 - DOMAIN_NAME
                3 - tar.gz registry access url
                3 - healthcheck path
            base_tomcat_template.json - the Marathon JSON file used as a template
            
Notes for running this program:
  -  The 'for war_item in war_list' loop contains the instructions for customizing values within the template
  -  You will probbably want to configure the env section in the template with your specific environment variables
  
WARNING: THIS IS UNSUPPORTED SOFTWARE...USE AT YOUR OWN RISK!
---------------------------------------------------------------------------------------- 
"""
war_list = None
with open(war_list_file, 'rb') as f:
    reader = csv.reader(f)
    war_list = list(reader)

with open(template_file, "rb") as template_file:
    tmpl_file=template_file.read()
    template = json.loads(tmpl_file)

bulk_loader = open('bulk_load_war.sh','w')

for war_item in war_list:
    z = template
    z['id'] = war_item[1]
    z['container']['portMappings'][0]['labels']['VIP_0'] = "{}:8080".format(war_item[1])
    z['container']['portMappings'][0]['name'] = war_item[1].replace("/","")
    z['env']['LogFile'] = "logs/{}/weblogic/nodemanager.log".format(war_item[2])
    z['env']["DOMAIN_HOME"] = "projects/{}".format(war_item[2])
    z["fetch"][0]["uri"] = war_item[3]
    z["healthChecks"][0]["command"]["value"]=war_item[4]
    with open(war_item[0], 'w') as fp:
 #       json.dump(z, fp)
        fp.write(json.dumps(z, indent=4, sort_keys=True))
    print "{}".format(war_item[0])
    bulk_loader.write("dcos marathon app add {}\n".format(war_item[0]))

bulk_loader.close()
print "-----------------------------------------------------------------------------------"
print "To load all of the generated Marathon JSON definitions, run 'bash bulk_load_war.sh"
print "-----------------------------------------------------------------------------------"





