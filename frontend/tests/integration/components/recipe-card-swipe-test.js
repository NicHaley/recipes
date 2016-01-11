import { moduleForComponent, test } from 'ember-qunit';
import hbs from 'htmlbars-inline-precompile';

moduleForComponent('recipe-card-swipe', 'Integration | Component | recipe card swipe', {
  integration: true
});

test('it renders', function(assert) {
  
  // Set any properties with this.set('myProperty', 'value');
  // Handle any actions with this.on('myAction', function(val) { ... });" + EOL + EOL +

  this.render(hbs`{{recipe-card-swipe}}`);

  assert.equal(this.$().text().trim(), '');

  // Template block usage:" + EOL +
  this.render(hbs`
    {{#recipe-card-swipe}}
      template block text
    {{/recipe-card-swipe}}
  `);

  assert.equal(this.$().text().trim(), 'template block text');
});
