const jsonServer = require('json-server');
const uuid = require("uuid");

const server = jsonServer.create();
const router = jsonServer.router('db.json'); // <== Will be created later
const middlewares = jsonServer.defaults();
const port = process.env.PORT || 3000; // <== You can change the port

server.use(middlewares);

// add uuid if not exists
server.use(jsonServer.bodyParser);
server.use((req, res, next) => {
  if (req.method === 'POST')
  {
    if (!uuid.validate(res.body?.id || "") )
    {
      req.body.id = uuid.v4();
    }
  }
  next()
});

server.use(router);

server.listen(port);