# Profiles

Ce service permet de gérer les profils des utlisateurs, profils particuliers ou professionnels. 


* Ce service arrive après la création de l'account sur le service fournisseur d'identité. (IDP)
* Les profils sont organisés sous forme d'arbre AVL, c'est à dire que les profiles peuvent être parcourus avec leurs ancestors.

## Business Rules

        Workflow
                
            user-agent      service profile
         _______________   ________________
        /               \ /                \
        -->  Création   ---> Sauvegarde &
             du profile      Association à l'account
            (connecté)	     (connecté)


| id      | Description                                                                                         |
|:--------|:----------------------------------------------------------------------------------------------------|
|`PROF_1` | l'utilisateur doit être identifié pour créer son profile                                            |
|`PROF_2` | Le particulier peut créer un profile                                                                |
|`PROF_3` | Le professionnel peut créer un profile avec des attributs supplémentaires                           |
|`PROF_4` | La validation d'un compte professionnel se fait manuellement                                        |


## Technical Rules

### dtd

        {
            "$schema": "http://json-schema.org/draft/2019-09/schema#",
            "type": "object",
            "properties": {
                "id": {
                    "type": "string",
                    "optional": true
                },
                "firstname": {
                    "type": "string"
                },
                "lastname": {
                    "type": "string"
                },
                "advertiser": {
                    "type": "string",
                    "optional": true
                },
                "email": {
                    "type": "email"
                },
                "account": {
                    "type": "string"
                },
                "status": {
                    "type": "string",
                    "enum": [
                        "enabled",
                        "disabled"
                    ]
                }
            },
            "required": [
                "firstname",
                "lastname",
                "email",
                "account",
                "status"
            ],
            "additionalProperties": false
        }

### api

!!swagger profiles.yaml!!