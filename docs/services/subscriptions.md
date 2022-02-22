# Subscriptions

Ce service est dédiée à la gestion des abonnements. Les fomules liés aux abonnements correspondent

* Ces abonnements sont achetés via le checkout. *Voir le parcours `checkout` pour plus d'informations*. 
* Les abonnements sont expirables avec une date anniversaire qui doit être fixée dans *Stripe*
* Les abonnements permettent de publier une annonce mais ne permette pas de booster une annonce déjà publiée

## Business Rules

        Workflow
                
                up2go          stripe                                   eventbridge
         ____________  ____________________________________________   ____________________________
        /            \/                                            \ /                            \
        -->  Panier  ---> Checkout  ---> Confirmation  --->  hook  --->  MAJ service subscriptions
            (anonyme)	(identifié)     (identifié)                      idclient + quantité



| id      |                                                  |
|:--------|:-------------------------------------------------|
|`ABO_1`  | Les abonnements sont réservés aux professionnels |


## Technical Rules

### dtd

    {
        "$schema": "http://json-schema.org/draft/2019-09/schema#",

        "type": "object",

        "properties": {
            "id": {"type": "string", "optional": true},
            "advertiser": {"type": "string"},
            "quantity": {"type": "integer"},
            "status": {"type":"string", "enum":["enabled","disabled"]}
        },
        "required": ["advertiser", "quantity", "status"],
        "additionalProperties": false
    }

### api

!!swagger subscriptions.yaml!!