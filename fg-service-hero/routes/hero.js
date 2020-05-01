const express = require('express');
const router = express.Router();
const reqlib = require('app-root-path').require;
const logger = reqlib('logger');

const jsf = require('json-schema-faker');
const util = require('util')
const chance = require('chance')
const faker = require('faker')
jsf.extend('chance', () => new chance.Chance());
jsf.extend('faker', () => faker);

var recentDays = 5;

var schema = {
	"type": "array",
	"minItems": 10,
	"maxItems": 20,
	"items": {
		"type": "object",
		"properties": {
		  "name": {
			"type": "string",
			"faker": "name.findName"
		  },
		  "sex": {
			"type": "string",
			"faker": "random.arrayElement(['male', 'female'])"
		  },
		  "race" : {
			"type": "string",
			"faker": "random.arrayElement(['human', 'elf','dvarf','ork'])"
		  },
		  "age" : {
			  "type": "string", 
			  "chance": {
				   "age": {
						"type": "adult"
				   }
			  }
		  },
		  "character" : {
			"type": "string",
			"faker": "random.arrayElement(['angry', 'playful', 'frowning', 'pensive'])"
		  },
			"phrases" : {
				"type": "array",
		  "minItems": 3,
		  "maxItems": 5,
		  "items": {
			"type": "string",
			"faker": "hacker.phrase"
					}
		  },
		   "story" : {
			"type": "string",
			"faker": "lorem.paragraph"
		  }
		},
		"required": [
		  "name",
		  "race", 
		  "sex",
		  "age",
		  "character",
		  "phrases",
		  "story"
		 ]
		}
  };
  
/* GET home page. */
router.get('/', (req, res) => {

  jsf.resolve(schema).then(sample => {
  	   logger.debug(util.inspect(sample, 
  	   	{showHidden: false, depth: null}));
	   
	   res.render('hero', 
	  	{   opinions:  sample });
  });

  
});

module.exports = router;