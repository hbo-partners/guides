# Attributes

Ce service fonctionne de concert avec le service Akeneo, il permet depuis les différents frontaux de référencer l'ensemble des attributs utiles pour le moteur de recherche par exemple.
Cela permet de créer plus facilement des filtres sans avoir a sur sollicité la base de données ES.

!!! warning "Attention"

    Les attributs créer dans le service Akeneo sont doublonnés dans le service attributs.


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


    {
        "$schema": "http://json-schema.org/draft/2019-09/schema#",

        "type": "object",

        "properties": {
            "id": {"type": "string"},
            "values": {"type": "array"}
            
        },
        "required": ["id", "values"],
        "additionalProperties": false

    }

### api

!!swagger attributes.yaml!!