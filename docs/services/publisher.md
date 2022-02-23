# Publisher

Ce service permet d'autoriser ou refuser la publication d'une annonce. Cet autorisation dépend de la formule associée au compte de l'utilisateur.

* Dans le parcours utilisateur, ce service ne peut être appelé que si il existe une formule associé au compte
* Fonctionne pour un particulier ou un professionnel si il bénéficie d'une formule.
* L'annonce doit être créer avant d'arriver à cette étape.
* Le boost d'une annnoce ou la publication d'une annonce doit passer par ce service.

## Business Rules

### Publication annonce
        Workflow
                
         compte utilisateur    service publisher                                                    compte utilisateur
         ____________________  __________________________________________________________________________  _____________
        /                    \/                                                                          \/             \
       -->  liste annonces  ---> selection des annonces ---> vérification total ---> mise à jour        ---> retour OK
            (identifié)	        à publier (ex.10)            annonces à publier      statut des annonces


### Boost annonce
        Workflow
                
         compte utilisateur    service publisher                                                    compte utilisateur
         ____________________  __________________________________________________________________________  _____________
        /                    \/                                                                          \/             \
       -->  liste annonces  ---> selection des annonces ---> vérification total ---> création attribut  ---> retour OK
            + boost souhaité	 à publier (ex.10)           boost à publier         boost par annonces
            (identifié)


| id      |                                                                                |
|:--------|:-------------------------------------------------------------------------------|
|`PUB_1`  | Publie une annonce préalablement crée après calcul de crédits restants         |
|`PUB_2`  | Permet d'activer le boost d'une annonce après calcul de crédits restants       |
|`PUB_3`  | Il doit obligatoirement avoir une formule associé au compte                    |
|`PUB_4`  | Les boosts ne peuvent pas être cumulable pour une meme annonce en une itération|
|`PUB_5`  | Il faut créer autant d'attributs dans l'annonce qu'il n'y de boost cumulés     |



## Technical Rules

### dtd

#### publish.dtd

    {
        "$schema": "http://json-schema.org/draft/2019-09/schema#",

        "type": "object",

        "properties": {
            "products": {"type": "array"}
            
        },
        "required": ["products"],
        "additionalProperties": true

    }

#### boost.dtd

    {
        "$schema": "http://json-schema.org/draft/2019-09/schema#",

        "type": "object",

        "properties": {
            "boost_type": {"type": "string", "enum": ["video", "a_la_une_30", "a_la_une_7", "a_la_une_3", "top_4x", "top_1x", "pics_50", "pics_20"]}
            
        },
        "required": ["boost_type"],
        "additionalProperties": true

    }

### api

!!swagger publisher.yaml!!