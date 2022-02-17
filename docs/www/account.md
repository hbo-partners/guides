# Account

Ce service est dédiée à la gestion du compte de l'utilisateur ou du professionnels.
L'ensemble des pages et parcours utilisateur doivent se retrouver dans ce projet.

**Attention il est possible de dissocier les accounts perso/pro en dupliquant ce projet .**

* *Les frontaux ne doivent pas être de type SSR (server side rendering)*
* *Les frontaux de type CSR (Client Side Rendering) sont sauvés sur des CDN.* 
* *Les frontaux CSR permet de faire chuter les couts d'infrastructure*


## Business Rules

#### Déploiement CI

        Workflow
                
          developer    github         S3          cloudfront
                       actions
         __________  ___________   _____________  ______________
        /          \/           \ /             \/              \
       -->  Push   ---> Deploy ---> Sauvegarde  ---> Deploy. CDN
            Repository              Bucket


| id                | Description                                                                |
|:------------------|:---------------------------------------------------------------------------|
|`WWW_ACC_1`        | Chaque push sur le projet `www-account` déploie automatiquement le front   |


## Technical Rules

### Serverless Continuous Déploiement

        name: Deploy Master
        on:
        push:
            branches:
            - master
            
        jobs:
        deploy:
            runs-on: ubuntu-latest

            steps:
            - uses: actions/checkout@v1
            
            - uses: actions/setup-node@v1
            with:
                node-version: '12.x'

            - name: Install Serverless Framework
            run: |
                npm install -g serverless
                serverless plugin install -n serverless-lift
            
            - name: Run app
            run: npm run build

            - name: Serverless AWS authentication
            run: sls config credentials --provider aws --key ${{ secrets.DEV_AWS_ACCESS_KEY_ID }} --secret ${{ secrets.DEV_AWS_SECRET_ACCESS_KEY }}
            
            - name: Deploy 
            working-directory: .
            env:
                AWS_ACCESS_KEY_ID: ${{ secrets.DEV_AWS_ACCESS_KEY_ID }}
                AWS_SECRET_ACCESS_KEY: ${{ secrets.DEV_AWS_SECRET_ACCESS_KEY }}
                AWS_DEFAULT_REGION: eu-west-3
            run: sls deploy