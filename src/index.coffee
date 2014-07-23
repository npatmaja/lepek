express = require 'express'
stylus = require 'stylus'
ECT = require 'ect'
ectRenderer = ECT({ watch: true, root: __dirname + '/../views', ext: '.ect'})

#### Application initialization
# Create app instance
app = express()

# Define Port & Environment
app.port = process.env.PORT or process.env.VMC_APP_PORT or 3000
env = process.env.NODE_ENV or "development"

# Set view engine
app.set 'view engine', 'ect'
app.engine 'ect', ectRenderer.render

#### Routes
# Routes initialization
routes = require './routes'
routes(app)

module.exports = app