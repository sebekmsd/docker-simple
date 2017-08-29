var express = require("express"),  
    app = express(),
    bodyParser  = require("body-parser"),
    methodOverride = require("method-override");


var AWS = require('aws-sdk');
AWS.config.update({region:'us-east-2'});
var router = express.Router();

app.use(bodyParser.urlencoded({
    extended: true
}));

/**bodyParser.json(options)
 * Parses the text as JSON and exposes the resulting object on req.body.
 */
app.use(bodyParser.json());

router.post('/callback_receiver',function(req,res){
  //console.log(req);
  var lambda = new AWS.Lambda();
 console.log(req.body);
  var params = {
    FunctionName: 'simpleSlackMessage', // the lambda function we are going to invoke
    InvocationType: 'RequestResponse',
    LogType: 'Tail',
    Payload: '{ "message" : "Resultados Callback SIMPLE",' +
              ' "payload" :'+  JSON.stringify(req.body) + ',' +
              ' "status":  "SUCCEEDED" }'
  };

  lambda.invoke(params, function (err, data) {
      if (err) console.log(err, err.stack); // an error occurred
      else     console.log(data);           // successful response
  });
 
  var response = {"response": "ok"};
  res.json(response);
});
                                                                                           
app.use(router);

app.listen(8080, function() {  
  console.log("Node server running on http://localhost:8080");
});

var writeFile = function(name,data){

	var fs = require('fs');
    fs.writeFile(name,data,function(err){
    	if(err)
     				res.send("Error al scribir buffer");

     		})
}

