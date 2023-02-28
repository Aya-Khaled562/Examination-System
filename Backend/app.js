// // const sql = require('msnodesqlv8');
// // const config = {
// //     server: '.',
// //     database: 'Examination-System',
// //     driver:'msnodesqlv8',
// //     options: {
// //         encrypt: true // use this if you're on Windows Azure
// //     }
// // };

// // sql.connect(config, function(err) {
// //     if (err) console.log(err);

// //     sql.query('SELECT * FROM student', function(err, result) {
// //         if (err) console.log(err);
// //         console.log(result);
// //         sql.close();
// //     });
// // });


// // const config = {
// //     server: '.',
// //     database: 'Examination-System',
// //     port: 1433
// //   };
  
// // const sql = require('mssql');

// // sql.connect(config, (err) => {
// //   if (err) console.log(err);
// //   else{
// //       console.log('Connected to SQL Server');
// //   }
// // });


// // sql.connect(config, (err) => {
// //   if (err) console.log(err);
// //   else{
// //       console.log('Connected to SQL Server');
// //   }

// //   const request = new sql.Request();
// //   request.query('SELECT * FROM Department', (err, result) => {
// //     if (err) console.log(err);
// //     console.log(result);
// //   });
// // });



// const server = require( "./server" );

// const startServer = async () => {
//    try {
//        // todo: move configuration to separate config
//        const config = {
//            host: "localhost",
//            port: 8080
//        };

//        // create an instance of the server application
//        const app = await server( config );

//        // start the web server
//        await app.start();

//        console.log( `Server running at http://${ config.host }:${ config.port }...` );
//    } catch ( err ) {
//        console.log( "startup error:", err );
//    }
// };

// startServer();

// var express = require('express');
// var app = express();

// app.get('/', function (req, res) {
   
//     var sql = require("mssql");

//     // config for your database
//     var config = {
//         server: '.', 
//         database: 'Examination-System'
//     };

//     // connect to your database
//     sql.connect(config, function (err) {
    
//         if (err) console.log(err);

//         // create Request object
//         var request = new sql.Request();
           
//         // query to the database and get the records
//         request.query('select * from Student', function (err, recordset) {
            
//             if (err) console.log(err)

//             // send records as a response
//             res.send(recordset);
            
//         });
//     });
// });

// var server = app.listen(5000, function () {
//     console.log('Server is running..');
// });


var Connection = require('tedious').Connection;  
    var config = {  
        server: '.',  //update me
        authentication: {
            type: 'default',
            options: {
                userName: 'your_username', //update me
                password: 'your_password'  //update me
            }
        },
        options: {
            // If you are on Microsoft Azure, you need encryption:
            encrypt: true,
            database: 'Examination-System'  //update me
        }
    };  
    var connection = new Connection(config);  
    connection.on('connect', function(err) {  
        // If no error, then good to proceed.
        console.log("Connected");  
    });
    
    connection.connect();

    var connection = new Connection(config);  
    connection.on('connect', function(err) {  
        // If no error, then good to proceed.  
        console.log("Connected");  
        executeStatement1();  
    });
    
    connection.connect();
    
    var Request = require('tedious').Request  
    var TYPES = require('tedious').TYPES;  
  
    function executeStatement1() {  
        var request = new Request("INSERT SalesLT.Product (Name, ProductNumber, StandardCost, ListPrice, SellStartDate) OUTPUT INSERTED.ProductID VALUES (@Name, @Number, @Cost, @Price, CURRENT_TIMESTAMP);", function(err) {  
         if (err) {  
            console.log(err);}  
        });  
        request.addParameter('Name', TYPES.NVarChar,'SQL Server Express 2014');  
        request.addParameter('Number', TYPES.NVarChar , 'SQLEXPRESS2014');  
        request.addParameter('Cost', TYPES.Int, 11);  
        request.addParameter('Price', TYPES.Int,11);  
        request.on('row', function(columns) {  
            columns.forEach(function(column) {  
              if (column.value === null) {  
                console.log('NULL');  
              } else {  
                console.log("Product id of inserted item is " + column.value);  
              }  
            });  
        });

        // Close the connection after the final event emitted by the request, after the callback passes
        request.on("requestCompleted", function (rowCount, more) {
            connection.close();
        });
        connection.execSql(request);  
    }