var path = require('path');
var express = require('express');

var app = express();
app.use('/api', mockjs(path.join(__dirname, 'mocks')));
app.listen(3333);
