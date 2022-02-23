# UPS

Ce service est dédiée à la gestion des credits (UPS). Chaque utilisation de crédit ou de multiples de crédits débloque des fonctionnalités pour l'annonceur.


!!! danger "Attention"    
    
    Chacun des prix associés à un produits(crédits) doit obligatoirement être flaggués avec la mention `quantity` dans Stripe.

        {
            "id": "price_1KVZkS2eZvKYlo2CKv9tTeBp",
            ...
            "metadata": {
                "quantity": "3"
            },
            ...
        }

    
!!! warning "Attention"

    Les crédits n'ont pas de date d'expiration.


* Ces crédits sont achetés via le checkout avec le mode "payment". *Voir le parcours `checkout` pour plus d'informations*. 
* La créatin des ups se fait automatiquement via les événements `STRIPE`.
* Les crédits ne permettent pas de publier une annonce mais uniquement à booster une annonce déjà publiée
* Les crédits ne sont pas expirables.
* L'augmentation du prix des crédits peut se faire uniquement sur les nouveaux UPS émis.
* Le cout de débloquage d'une fonctionnalité par des UPS ne peut pas varier en cas d'augmentation de UPS

## Business Rules

        Workflow
                
                up2go          stripe                                   eventbridge
         ____________  ____________________________________________   ______________________
        /            \/                                            \ /                      \
        -->  Panier  ---> Checkout  ---> Confirmation  --->  hook  --->  MAJ service ups
            (anonyme)	(identifié)     (identifié)                      idclient + quantité


# UP'S (correspond à des crédits)


**up's** nommés aussi crédits ou packs sont achetables via le checkout, **pas d'abonnement possible**.
Ils permettent de **booster** une annonce entre autre ou de s'offrir une vidéo, une mise à la une, remontée... 


| id       |                                     |
|:---------|:------------------------------------|
| `UPS_1`  | Utilisables lors du dépôt d’une annonce ou par la suite dans mes annonces « Booster » |
| `UPS_2`  | Permet de déposer une annonce à l’unité pour un professionnel = 20 up’s |
| `UPS_3`  | Les up’s n’expire pas exception faite si le professionnel supprime son compte.  |
| `UPS_4`  | Les up's sont "achetables" en euros (€)  |
| `UPS_5`  | Les up's sont cumulables |
| `UPS_6`  | Remontée x 1 : correspond à faire remonter l’annonce comme si elle venait d’être publiée la date de publication est modifié par celle du jour.|
| `UPS_7`  | Remontée x 4 : correspond à faire remonter l’annonce 1 fois par semaine durant 4 semaines comme si elle venait d’être publiée, la date de publication est modifiée                 par celle du jour - Prise en compte immédiate et automatique 3 fois à 7 jours de décalage à la même heure. |
| `UPS_8`  | Les annonces à la une : dispose d’un affichage différent dans temps (3,7 ou 30 jours) au niveau des résultats de recherche autrement dit le listing. Au lieu d’une                 photo elle en à plusieurs la rendant plus visible. Elles s’affichent également dans la marque et modèle du véhicule dans la section « en vedette. ».|
| `UPS_9`  | Photos supplémentaire (pas de durée, reste visible durant la vie de l’annonce).|
| `UPS_10` | Vidéo : l’application uptogo maker disponible sur Ios et  Android détectera s’il y a suffisement de Up’s pour envoyer la vidéo en production, le client sera alors                 décrédité de 30 up’s.|


## Technical Rules

### dtd

#### ups.dtd

    {
        "$schema": "http://json-schema.org/draft/2019-09/schema#",

        "type": "object",

        "properties": {
            "id": {"type": "string"},
            "advertiser": {"type": "string"},
            "quantity": {"type": "integer"}
        },
        "required": ["id", "advertiser", "quantity"],
        "additionalProperties": false
    }

#### dispatch.dtd

    {
        "$schema": "http://json-schema.org/draft/2019-09/schema#",
        "type": "object",
        "properties": {
            "advertiser": {
            "type": "string"
            },
            "quantity": {
            "type": "integer"
            }
        },
        "required": [
            "advertiser",
            "quantity"
        ],
        "additionalProperties": false
    }


#### admin.dtd

    {
        "$schema": "http://json-schema.org/draft/2019-09/schema#",
        "type": "object",
        "properties": {
            "id": {
            "type": "string",
            "optional": true
            },
            "advertiser": {
            "type": "string"
            },
            "quantity": {
            "type": "integer"
            }
        },
        "required": [
            "advertiser",
            "quantity"
        ],
        "additionalProperties": false
    }

        
### api

!!swagger ups.yaml!!