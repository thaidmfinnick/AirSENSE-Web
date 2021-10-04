const app = require('./config/express.js');
const pagesRouters = require('./routes/page.route.js')

app.listen(app.get('port'), app.get('host'), () => {
    console.log(`Server is running at http://${app.get('host')}:${app.get('port')}`);
  });


app.use('/', pagesRouters);

