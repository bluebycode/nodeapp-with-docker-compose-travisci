'use strict';
const express = require('express');
const app = express();
const debug = require('debug')
app.get('/', (_, res) => {
    res.send('OK.');
});
module.exports = app.listen(8080, function() {
    debug('listening 8080')
});
