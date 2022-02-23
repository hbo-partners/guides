# Advertisers

Ce service permet de gérer les annonceurs.<br/>
Un annonceur peut etre indifférement un particulier ou un professionnel.<br/>
Un utilisateur devient annonceur dès lors qu'il décide de publier une annonce. Cela permet de gérer d'une manière unique tous les utlisateurs souhaitant passer une annonce.


!!! warning "Attention"

    Il faut impérativement lié les professionnels quand il s'agit d'une même société.


* Un annonceur est soit un professionnel ou un particulier.
* Un annonceur unique (PART/PRO) permet de conserver le workflow d'abonnement ou crédits.
* Un annonceur particulier peut ainsi bénéficier de formule gratuite.
* La différence entre un  particulier et un professionnel réside dans la saisie des informations liès à l'entreprise dans le champ "company".
* Cette unicité PART/PRO permet de ne pas doubler les services crédits & abonnements et ainsi simplifier la compréhension.
* Les annonceurs sont organisés sous forme d'arbre AVL, c'est à dire qu'ils peuvent être parcourus avec leurs ancestors.

## Business Rules

        Workflow
                
           stripe       eventbridge    advertisers
         ____________  _____________  _____________
        /            \/             \/             \
        --> hook    --> sqs trigger -->  création  
          (identifié)	  (identifié)     (identifié)



| id        |                                                                   |
|:----------|:------------------------------------------------------------------|
|`ADVT_1`	  | ~                                                                 |


## Technical Rules

### dtd

#### advertisers.dtd

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
          "$ref": "#/definitions/company",
          "optional": true
        }
      },
      "required": [
        "parent",
        "name",
        "phone",
        "email"
      ],
      "additionalProperties": false
    }


#### attach.dtd

    {
      "$schema": "http://json-schema.org/draft/2019-09/schema#",
      "type": "object",
      "properties": {
        "advertiser": {
          "type": "string"
        }
      },
      "required": [
        "advertiser"
      ],
      "additionalProperties": false
    }


### api

!!swagger advertisers.yaml!!