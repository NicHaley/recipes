import DS from 'ember-data';

export default DS.Model.extend({

	imageThumb: 	DS.attr(),
	imageMain: 		DS.attr(),

	recipe: DS.belongsTo("recipe"),
  
});
