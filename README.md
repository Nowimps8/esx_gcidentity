# esx_identity
FXserver ESX Identity

Credit to GC Gannon for "GCIdentity"

Edited by Chubbs

[INSTALLATION]

1) CD in your resources/[esx] folder
2) Clone the repository


3) Add this in your server.cfg :

```
start esx_identity
```
To open the identity card just use

```
TriggerEvent("gcl:showItentity", ...)
```