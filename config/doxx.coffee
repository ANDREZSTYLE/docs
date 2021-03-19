path = require('path')

config = require('./index')
links = require('./links')
names = require('./names')

root = path.resolve(__dirname, '..')

module.exports = {
  docsExt: config.docsExt
  rootDir: root
  sourceDir: config.docsSourceDir
  destDir: config.docsDestDir
  templatesDir: config.templatesDir
  partialsDir: config.partialsDir
  metaExtra: (fileName) ->
    fileMatch = fileName.match(config.dynamicDocs)
    externalFileMatch = fileName.match(config.externalDocs)
    improveDocsLink: if fileMatch then "#{config.editPageLink}/#{config.partialsDir}/#{fileMatch[1]}" else "#{config.editPageLink}/#{config.docsSourceDir}/#{fileName}"
    externalImproveDocsLink: if externalFileMatch then links.externalDocs[externalFileMatch[1]]
    $links: links
    $names: names
  layoutLocals: config.layoutLocals
  parseNav: true
  serializeNav: path.join(root, 'server', 'nav.json')
  buildLunrIndex: false
  pathPrefix: config.pathPrefix
}
