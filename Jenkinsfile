#!/usr/bin/env groovy
@Library(['piper-lib', 'piper-lib-os']) _

def checkacc() {
	
	withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId:env.BTPCredentialID,usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]){	  
				  sh '''
				  echo "************ Check if Subaccount exists *********************************"
				  echo "************************************************************************** " 
					   pip3 install -r requirements.txt
					   cd scripts
					   python3 installations.py
					   python3 subaccount_exists.py  
				 '''
				is_account_exists = readFile(file: 'myfile.txt')
				print(is_account_exists)	
				return is_account_exists
	}
	
}

node ('master') {
	dockerExecuteOnKubernetes(script: this, dockerEnvVars: ['pusername':pusername, 'puserpwd':puserpwd], dockerImage: 'docker.wdf.sap.corp:51010/sfext:v3-py' )
{

	try {
		    stage('Git-clone')
			{
				cleanWs()
				checkout scm
                withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId:'GithubTools',usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]){

				sh'''
				git clone https://$USERNAME:$PASSWORD@github.tools.sap/btp-ppu-test/ReusableActions.git --branch 'master'
				mv ./ReusableActions/* ./
				'''
				}
			}
			stage ('delete_customer_subaccount') 
			{
				
				withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId:env.BTPCredentialID,usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]){
           
				    writeJSON file: 'manifest.json', json: params.ManifestJsonFileContent
							data = readJSON file:'manifest.json'
							print(data) 
				    sh '''
				    mv manifest.json ./config/
				    '''
				    is_account_exists = checkacc()
				    print(is_account_exists)	

				    if (is_account_exists == 'True') 
					{

					print("Subaccount already exists.")
					
					paramOrg = "${data.subaccounts[0].org_name}"
	               print paramOrg
					paramSpace = "${data.subaccounts[0].space_name}"
					print paramSpace
					region = "${data.subaccounts[0].region}"
                             		print region					
					endpoint = "https://api.cf.${region}.hana.ondemand.com"
	 
	               cloudFoundryDeleteService(script: this, cfApiEndpoint: endpoint, cfOrg: paramOrg, cfSpace: paramSpace,cfServiceInstance: env.serviceInstanceName,cfCredentialsId: env.BTPCredentialID)

					sh '''
					cd scripts
                      python3 delete_subaccount.py

					'''
					
				     } 
					 else {
						print("Subaccount does not exists.")
					 }
            
				       }


				}	  
			
		
		
		
		
		}
				 
	catch(e){
		echo e.toString()
		echo 'This will run only if failed'
		currentBuild.result = "FAILURE"
	}
	finally {
		emailext body: '$DEFAULT_CONTENT', subject: '$DEFAULT_SUBJECT', to: 'vanita.dhanagar@sap.com'
	}

} 
}
