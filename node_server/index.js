const express = require('express');
const mysql = require('mysql');

/* Server */
const app = express();
/* Enviroment variable port */
const port = process.env.PORT || '3000';
const dbCompany = 1;

app.use(express.json());

/* Start server listener */
app.listen(port, () => {
    console.log(`Server started on ${port}...`);
});

/* Mysql connection */
const db = mysql.createConnection({
    host : 'localhost',
    user : 'nodeuser',
    password : 'nodeuser@1234',
    database : 'towingdb'
});

db.connect((err) => {
    if (err) {
        throw err;
    }
    console.log('MySql Connected...');
});

app.get('/', (req, resp) => {
    resp.send('Sprinter Towing');
});

app.get('/api/driver/:id', (req, resp) => {
    //const sql = `CALL db_get_service_driver(?)`;

    console.log(`Get driver ${req.params.id}...`);

    const sql = `select * from driver where company_idCompany = (?) and idDriver = (?)`;
 
    db.query(sql, [dbCompany, req.params.id], (error, results, fields) => {
        if (error) {
            resp.send(error.message);
        }
        resp.send(results);
    })
});

app.get('/api/driver', (req, resp) => {
    const sql = `select * from driver where company_idCompany = (?)`;
 
    db.query(sql, dbCompany, (error, results, fields) => {
        if (error) {
            resp.send(error.message);
        }
        resp.send(results);
    })
}); 