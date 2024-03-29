import DS from 'ember-data';

export default DS.Model.extend({

  name: 				DS.attr("string"),
  cookTime: 		DS.attr("string"),
  recipePath: 	DS.attr("string"),
  servings: 	  DS.attr("string"),
  
  ingredients: DS.hasMany("ingredient"),
  images: 		 DS.hasMany("image")
  
});
