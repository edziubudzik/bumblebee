if(!Bumblebee) {
	var Bumblebee = { };
}

Bumblebee.Block = Class.create({
	initialize: function(element) {
		this.element = $(element);
		
		this.settings = this.element.down('.settings');
		
		this.settingsToggler = this.element.down('.icon.edit');
		this.settingsToggler.observe('click', function(event) {
			event.stop();
			this.settings.toggle();
		}.bind(this));
	}
});