var assert = require('assert')

const elasticsearch = require('elasticsearch');

var client = new elasticsearch.Client();

var fshandler = require('./folder-handler.js');


var root = { name: 'root',
			 metadata: {},
			 contents: [],
			 subfolders: [
			  	{
			  		name: 'home',
			  		parent: 'root',
			  		metadata: { size: 100000, date: '01012017T000000GMT'},
			  		contents: [],
			  		subfolders: [ { 
			  			name: 'msilva',
			  			parent: 'home',
			  			metadata: {},
			  			contents: [  
			  			{ id: 'adfasdfasdfasdfas' , name:  'cv.pdf' },
			  			{ id: 'etrqwerqwerqerqas' , name: 'readme.txt'}],
			  			subfolders: []
			  		}]
			  	},
			  	{
			  		name: 'site',
			  		parent: 'root',
			  		metadata: {},
			  		contents: [],
			  		subfolders: []
			  	}
			  ] }




console.log(fshandler.listContents(root,'/home/msilva'));

var obj = { name: 'Test.txt',id: 'wertwertwet',metadata: {} }

fshandler.insertObjectInto(root,'/home/msilva',obj);
console.log(JSON.stringify(root,null,2));

fshandler.newFolder(root,'/site','arkho');
console.log(JSON.stringify(root,null,2));

fshandler.removeObject(root,'/home/msilva','adfasdfasdfasdfas');
console.log(JSON.stringify(root,null,2));


var root2 = fshandler.createRootFS();

console.log(root2);




client.indices.create({ index: 'vfs-entidad1'} , function(err,resp,status){
	if(err){
		console.log(err);
	}else{
		console.log(resp);
	}
});



/*
describe('FS',function(){
	it('Debe ser un objeto de tipo carpeta',function(){
		assert.equal('Object',fshandler.findFolder(root,'site'))
	})
})

describe('#Array',function(){
	it('Debe retornar un array',function(){
		assert.equal('Array',fshandler.listContents(root))
	});
});
*/