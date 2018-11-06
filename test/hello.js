'use strict';

const http = require('http');

var cntr = 0;

http.createServer(function (req, res) {
  cntr++;
  res.end('hello from alinode docker: ' + cntr + '\n');
}).listen(3333);

console.log('hello at port: 3333');
console.log('You may check your applicaiton from node.console.aliyun.com.')
console.log('Instance id: ' + process.env.HOSTNAME);
console.log('process.alinode: ' + process.alinode);
