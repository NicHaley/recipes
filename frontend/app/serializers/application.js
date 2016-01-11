import DS from 'ember-data';

let underscore = Ember.String.underscore;

export default DS.JSONAPISerializer.extend({
  keyForAttribute(key) {
    return underscore(key);
  },

  keyForRelationship(rawKey) {
    return underscore(rawKey);
  }
});
