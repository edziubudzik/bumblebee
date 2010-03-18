if(!Bumblebee) {
	var Bumblebee = { }
}

Bumblebee.Timeline = Class.create({
	initialize: function(element, options) {
		this.element = $(element);
		this.options = Object.extend(Object.extend({ }, Bumblebee.Timeline.DefaultOptions), options || { });
		
		this.canvas = this.element.down('.canvas');
		
		if(!this.canvas) {
			throw("Nie odnaleziono płótna.");
		}
		
		if(!this.options.sourceUrl) {
			throw("Nie podano źródła wydarzeń.");
		}
		
		this.events = [ ];
		this.loadData();
	},
	
	loadData: function() {
		new Ajax.Request(this.options.sourceUrl, {
			method: 'get',
			onSuccess: this.parseData.bind(this)
		})
	},
	
	parseData: function(transport) {
		var xml = transport.responseXML;
		
		xml.select('event').each(function(eventNode) {
			this.addEvent(this.parseEvent(eventNode));
		}.bind(this));
	},
	
	parseEvent: function(eventNode) {
		var time = new Date(eventNode.down('time'));
		var type = eventNode.down('eventable_type');

		return new Bumblebee.Timeline.Event(time, type);
	},
	
	addEvent: function(event) {
		this.events[this.events.length] = event;
	}
});

Bumblebee.Timeline.DefaultOptions = {
	pixelsPerDay: 20
}

Bumblebee.Timeline.Event = Class.create({
	initialize: function(time, type, data) {
		this.time = time;
		this.type = type;
		this.data = data || { };
	}
}); 