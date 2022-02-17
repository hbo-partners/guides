# Account

Ce service est entièrement géré par Cognito AWS (IDP) et permet la création de compte, mot de passe oublié, mise à jour d'un profile, ... 


* Ce service est le premier des services Account, Profiles composant le parcours de création d'un compte
* Service entièrement géré par AWS Cognito.

## Business Rules

        Workflow
                
            up2go           Connexion/inscription             up2go
         ____________  ________________________________   _____________
        /            \/                                \ /             \
        --> site ------------> pop-up ----> Confirmation  ---> site
          (anonyme)	         (anonyme)      (identifié)      (identifié)



| id        |                                                                   |
|:----------|:------------------------------------------------------------------|
|`LOG_IN_1`	| Connexion avec un email et mot de passe                           |
|`LOG_IN_2` | Connexion avec les réseaux sociaux Facebook et Google             |
|`LOG_IN_3` | Inscription en 2 étapes (2 slides)                                |
|`LOG_IN_4` | Inscription via les réseaux sociaux facebook et Google            |
|`LOG_IN_5`	| Informations différentes entre un particulier et un professionnel.|

