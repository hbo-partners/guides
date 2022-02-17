# UPS

Ce service est dédiée à la gestion des credits (UPS). Chaque utilisation de crédit ou de mumtiples de crédits débloque des fonctionnalités pour l'annonceur.

**Attention les crédits nont pas de date d'expiration ils sont liés au compte de l'acheteur..**

* Ces crédits sont achetés via le checkout. *Voir le parcours `checkout` pour plus d'informations*. 
* Les crédits ne sont pas expirables.
* L'augmentation du prix des crédits peut se font uniquement sur les nouveaux UPS émis. Pas sur les UPS
* Le cout de débloquage d'une fonctionnalité par des UPS ne peut pas varier en cas d'augmentation de UPS

## Business Rules

        Workflow
                
            utilisateur        service attributs
         ____________________   ______________________
        /                    \ /                      \
        -->  Ajout au panier --->   Renvoi des attributs
             d'une formule          selon critères
            (identifié)	    (Non identifié)


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