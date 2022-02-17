# Messagerie

Ce service permet de laisser des messages à un annonceur. 

**Attention ce n'est pas un dialogue qui est entamé avec un annonceur mais bien une prise de contact.**

* L'utilisateur connecté laisse un message à destination du concessionnaire responsable de l'annonce

## Business Rules

        Workflow
                
            utilisateur             service messagerie
         _______________   ____________________________________
        /               \ /                                    \
        -->  Poste un   ---> Validation  ---> Sauve le  + Notifie
             message         du message       message     l'annonceur
            (identifié)	     (identifié)     (identifié)  (identifié)


| id      | Description                                                                 |
|:--------|:----------------------------------------------------------------------------|
|`MSG_1`  | l'utilisateur doit être identifié pour laisser un message                   |
|`MSG_2`  | l'utilisateur doit laisser ses coordonnées Email + Téléphone                |
|`MSG_3`  | l'utilisateur peut laisser un message; cette fonctionalité est optionnelle  |
|`MSG_4`  | L'annonceur doit être notifié à chaque nouvelle demande de contact          |
|`MSG_5`  | L'annonceur doit pouvoir retrouver le nombre de prise de contact            |

## Technical Rules

### dtd


        {
            "$schema": "http://json-schema.org/draft/2019-09/schema#",
            "type": "object",
            "properties": {
                "ad": {
                    "type": "string"
                },
                "advertiser": {
                    "type": "string"
                },
                "profile": {
                    "type": "string",
                    "optional": true
                },
                "message": {
                    "type": "string"
                },
                "starts_at": {
                    "type": "string",
                    "format": "date"
                }
            },
            "required": [
                "ad",
                "advertiser",
                "message",
                "starts_at"
            ],
            "additionalProperties": false
        }

### api

!!swagger swagger.json!!