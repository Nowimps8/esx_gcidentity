ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


function getIdentity(source, callback)
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  local identifier = GetPlayerIdentifiers(_source)[1]
  
  local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
      ['@identifier'] = identifier
    })
	  local user      	  = result[1]
    local firstname     = user['firstname']
    local lastname      = user['lastname']
    local sex           = user['sex']
    local dob           = user['dateofbirth']
    local height        = user['height']
	  local job			      = user['job']
	
	local data = {
      job         = job,
      firstname   = firstname,
      lastname    = lastname,
      sex         = sex,
      dob         = dob,
      height      = height
    }
      callback(data)
    end

RegisterServerEvent('gc:openIdentity')
AddEventHandler('gc:openIdentity',function(other)
    getIdentity(source, function(data)
        TriggerClientEvent('gc:showItentity', tonumber(other), {
            nom             = data.lastname,
            prenom          = data.firstname,
            dateNaissance   = data.dob,
            sexe            = data.sex,
            jobs            = data.job,
            taille          = data.height,
            id              = data.identifier
        })
    end)
end)

RegisterServerEvent('gc:openMeIdentity')
AddEventHandler('gc:openMeIdentity',function()
    getIdentity(source, function(data)
        TriggerClientEvent('gc:showItentity', source, {
            nom             = data.lastname,
            prenom          = data.firstname,
            dateNaissance   = data.dob,
            sexe            = data.sex,
            jobs            = data.job,
            taille          = data.height,
            id              = data.identifier
        })
    end)
end)
