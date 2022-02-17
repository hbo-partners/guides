# Attributs

Ce service fonctionne de concert avec le service Akeneo, il permet depuis les différents frontaux de référencer l'ensemble des attributs utiles pour le moteur de recherche par exemple.
Cela permet de créer plus facilement des filtres sans avoir a sur sollicité la base de données ES.

**Attention les attributs créer dans le service Akeneo sont doublonnés dans le service attributs.**

* Les attributs sont enregistrés sous forme de clé/valeur
* Le service attributs peut être appelés depuis divers frontaux en mode déconnecté
* Le service AWS WAF protège les attaques de type DDOS, ..., le `service attributs`
* Les attributs sont mis en cache via l'api gateway AWS
* Il faut impérativement que les attributs soient synchronizés avec les attributs présents dans Akeneo

## Business Rules

        Workflow
                
            user-agent        service attributs        
         _________________   ______________________
        /                 \ /                      \
        -->  Recherche   --->   Renvoi des attributs
             selon critères     selon critères
            (Non identifié)	    (Non identifié)


| id      | Description                                                                          |
|:--------|:-------------------------------------------------------------------------------------|
|`ATTR_1` | le user-agent doit spécifier des critères de selection                               |
|`ATTR_2` | les attributs doiventt être synchronizés avec les attributs dans le service Akeneo   |


## Technical Rules

### dtd


        // 20220217201201
        // https://raw.githubusercontent.com/hbo-partners/attributes/master/src/dtd/attributes.dtd?token=GHSAT0AAAAAABLH63ONKEUJ5V7S6MMPNADMYQOTY6Q
        {
            "$schema": "http://json-schema.org/draft/2019-09/schema#",
            "type": "object",
            "definitions": {
                "company": {
                    "type": "object",
                    "properties": {
                        "siret": {
                            "type": "string"
                        },
                        "type": {
                            "type": "string"
                        },
                        "street": {
                            "type": "string"
                        },
                        "address": {
                            "$ref": "#/definitions/address"
                        }
                    },
                    "additionalProperties": false
                },
                "address": {
                    "type": "object",
                    "properties": {
                        "zipcode": {
                            "type": "string"
                        },
                        "city": {
                            "type": "string"
                        },
                        "street": {
                            "type": "string"
                        }
                    },
                    "additionalProperties": false
                }
            },
            "properties": {
                "id": {
                    "type": "string",
                    "optional": true
                },
                "parent": {
                    "type": "string"
                },
                "name": {
                    "type": "string"
                },
                "phone": {
                    "type": "string"
                },
                "email": {
                    "type": "email"
                },
                "company": {
                    "$ref": "#/definitions/company"
                }
            },
            "required": [
                "parent",
                "name",
                "phone",
                "email",
                "company"
            ],
            "additionalProperties": false
        }
        
### api

!!swagger swagger.json!!