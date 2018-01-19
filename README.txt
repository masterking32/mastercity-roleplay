# celldoors
ESX and non-ESX versions of Doors script originally created by Darklandz and modified by Miss_Behavin



For ESX Compatibility, you must either add an export from esx_policejob or write additional code

to create an export from policejob:

ADD

[esx]/esx_policejob/client/main.lua:
``

function getJob()
  if PlayerData.job ~= nil then
	return PlayerData.job.name	
  end  
end


``
[esx]/esx_policejob/__resource.lua:
``
exports {
  'getJob' 
}


``

and CHANGE in this __resource.lua:
From:
``
client_script 'client.lua'
server_script 'server.lua'
``
to:
``
client_script 'ESX/client.lua'
server_script 'ESX/server.lua'
``

Cheers and have fun.  
