import DS from 'ember-data';

export default DS.Model.extend({

	imageMain: 		DS.attr(),

	recipe: DS.belongsTo("recipe"),
  
});
