

const mysql = require('mysql');

const connection = mysql.createConnection({
    //following param coming from aws lambda env variable
    host: process.env.RDS_LAMBDA_HOSTNAME,
    user: process.env.RDS_LAMBDA_USERNAME,
    password: process.env.RDS_LAMBDA_PASSWORD,
    port: process.env.RDS_LAMBDA_PORT,
    // calling direct inside code
    multipleStatements: true,
    // Prevent nested sql statements
    connectionLimit: 1000,
    connectTimeout: 60 * 60 * 1000,
    acquireTimeout: 60 * 60 * 1000,
    timeout: 60 * 60 * 1000,
    debug: true,
    database: 'tutorial_ec2'
});

exports.handler = (event, context, callback) => {
    // allows for using callbacks as finish/error-handlers
    context.callbackWaitsForEmptyEventLoop = false;

    const sql = "select content from todo_list ";
    connection.query(sql, function (err, data) {
        if (err) throw err;
        callback(null, data);
    });
};