const app = require('./config/express.js');


app.listen(app.get('port'), app.get('host'), () => {
    console.log(`Server is running at http://${app.get('host')}:${app.get('port')}`);
  });


app.get('/', (req, res) => {
    res.render('home');
})