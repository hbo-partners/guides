// https://squidfunk.github.io/mkdocs-material/creating-your-site/#advanced-configuration
docker run --user 33:33 --rm -it -v ${PWD}:/docs squidfunk/mkdocs-material new .

make up

// List plugins
https://github.com/mkdocs/mkdocs/wiki/MkDocs-Plugins#navigation--page-building

// Best plugins
https://chrieke.medium.com/the-best-mkdocs-plugins-and-customizations-fc820eb19759

// Swagger
https://github.com/bharel/mkdocs-render-swagger-plugin

// Nav
https://pythonrepo.com/repo/lukasgeiter-mkdocs-awesome-pages-plugin-python-documentation

// Convert Postma to Swagger online
https://metamug.com/util/postman-to-swagger/

// If not works the project will be found here:
https://github.com/tecfu/postman-to-swagger

install: `npm install tecfu/postman-to-swagger`

        const p2s = require('postman-to-swagger')
        const yaml = require('js-yaml')
        const fs = require('fs')
        const postmanJson = require('./postman_collection.json')
        const swaggerJson = p2s(postmanJson, {
        target_spec: "swagger2.0",
        info: {
            version: 'v1'
        }
        })

        //let output = JSON.stringify(swaggerJson, null, 2)
        let output = yaml.safeDump(swaggerJson)

        // Save to file
        fs.writeFileSync(
        'swagger.yaml',
        output,
        'utf8'
        )


// Download Swagger yaml to json
https://editor.swagger.io/

// Search pip plugin
https://pypi.org/search/?q=mkdocs-mermaid2-plugin&o=