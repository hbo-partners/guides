# Invoices

Ce service permet la récupération des factures enregistrées sur Stripe à partir d'un abonnement ou d'un achat de credits.

**Attention ce service est en ReadOnly. Il n'est possible d'apporter de modification à une facture.**

* Les factures sont récupérables à partir d'un numéro de souscription.
* Les factures sont récupérables à partir d'un numéro d'une commande de crédits.

## Business Rules

        Workflow
                
            utilisateur             Stripe               Hook        service invoices
         ____________________   _________________  _______________  __________________
        /                    \ /                 \/               \/                  \
        -->  Ajout au panier --->  Paiement sur  ---> Trigger sur --> Sauvegarde de la
             d'une formule         Stripe             checkout        facture Stripe
            (identifié)	           (identifié)


| id                | Description   |
|:------------------|:--------------|
|`INV_1`            | ~             |


## Technical Rules

### api

!!swagger invoices.yaml!!