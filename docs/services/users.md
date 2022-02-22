# Administration

Ce service permet de créer de nouveux utilisateurs et est le point d'entrée de tous les parcours du backoffice


* Il faut impérativement créer un utilisateur avec ses droits pour faire les manipulations de compte, crédits, susbscriptions
* Le backoffice est un site comme un autre hormis l'identification et les accreditations des utilisateurs

## Business Rules

        Workflow
                
            Login       Connexion             Admin                                     backoffice
         ____________  ________________   ________________________________________  _________________________
        /            \/                \ /                                        \/                         \
        --> site    ----> Confirmation --> connecté en tant que Modérateur/Admin  --> parcours backoffice ...
          (anonyme)	      (identifié)



| id        |                                                                   |
|:----------|:------------------------------------------------------------------|
|`ADMN_1`	  | ~                                                                 |

## Technical Rules

### api

!!swagger users.yaml!!