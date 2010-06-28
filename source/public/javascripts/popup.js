if(!Bumblebee) {
	var Bumblebee = { };
}

Bumblebee.Popup = Class.create({
	defaultOptions: {
		width: 200,
		autoShow: false
	},
	
	initialize: function(x, y, content, options) {
		this.x = parseInt(x);
		this.y = parseInt(y);
		this.content = content;
		
		this.options = Object.extend(Object.extend({ }, this.defaultOptions), options || { });
		this.createElement();
	},
	
	createElement: function() {
		this.element = new Element('div', {
			className: 'popup'
		});
		this.element.setStyle({
			position: 'absolute',
			display: 'none',
			left: (this.x - this.options.width/2) + 'px',
			top: (this.y + 10) + 'px',
			width: this.options.width + 'px'
		});
		this.element.update(this.content);
		this.element.insert(new Element('div', {
			className: 'triangle top white'
		}));
		this.element.insert(new Element('div', {
			className: 'triangle top black'
		}));
		
		document.body.insert(this.element);
		
		if(this.options.autoShow) {
			this.show();
		}
	},
	
	show: function() {
		this.element.show();
	},
	
	hide: function() {
		this.element.hide();
	},
	
	toggle: function() {
		if(this.element.style.display == 'none') {
			this.show();
		} else {
			this.hide();
		}
	}
});