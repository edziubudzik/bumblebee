if(!Bumblebee) {
	var Bumblebee = { };
}

// if(!Cookie) {
	document.write('<script type="text/javascript" src="http://localhost:3000/javascripts/cookie.js"></script>');
// }

document.observe('dom:loaded', function() {
	Bumblebee.DemoBrowser.init();
});

Bumblebee.DemoBrowser = {
	init: function(projectId, demoId) {
		Cookie.init({ name: 'bumblebee' }, { enabled: false });
		
		if(this.getRequestParam('_bumblebee_enabled')) {
			this.enable();
		} else {
			this.enabled = Cookie.getData('enabled');
		}
		
		if(!this.enabled) {
			// alert('Bumblebee browsing inactive.')
			return false;
		}
		
		// Jester.Resource.model('Demo', { prefix: '/projects/' + projectId });

		// this.demo = Demo.find(demoId);
		// 
		// Jester.Resource.model('DemoActivity', {
		// 	prefix: '/projects/' + projectId + '/demos/' + this.demo.id + '/', 
		// 	singular: 'demo_activity', 
		// 	plural: 'demo_activities'
		// });
		// 
		// this.content = $('content');
		
		this.submitTarget = new Element('iframe', {
			name: 'bumblebee_submit_target'
		});
		
		this.form = new Element('form', {
			method: 'post',
			action: 'http://localhost:3000/projects/3/demos/1/demo_activities',
			target: 'bumblebee_submit_target'
		});
		
		this.urlElement = new Element('input', {
			type: 'text',
			name: 'demo_activity[url]'
		});
		
		this.methodElement = new Element('input', {
			type: 'text',
			name: 'demo_activity[method]'
		});
		
		this.form.insert(this.urlElement);
		this.form.insert(this.methodElement);

		document.body.insert(this.submitTarget);
		document.body.insert(this.form);
	
		$$('a').invoke('observe', 'click', this.onContentLinkClicked.bind(this));
		// this.content.select('form').invoke('observe', 'submit', this.onFormSubmittedClicked.bind(this));
	},
	
	enable: function() {
		this.enabled = true;
		Cookie.setData('enabled', true);
	},
	
	disable: function() {
		this.enabled = false;
		Cookie.setData('enabled', false);
	},
	
	onContentLinkClicked: function(event) {
		var a = event.findElement('a');
		
		this.submitActivity(a.href, 'get');
		// this.demo.create_demo_activity({ 
		// 	url: a.href,
		// 	method: "get"
		// })
	},
	
	onFormSubmittedClicked: function(event) {
		var form = event.findElement('form');
		
		this.submitActivity(form.action, form.method);
		// this.demo.create_demo_activity({ 
		// 	url: form.action,
		// 	method: form.method
		// })
	},
	
	submitActivity: function(url, method) {
		this.urlElement.value = url;
		this.methodElement.value = method;
		
		this.form.submit();
	},
	
	getRequestParam: function(name) {
		name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
		var regexS = "[\\?&]"+name+"=([^&#]*)";
		var regex = new RegExp( regexS );
		var results = regex.exec( window.location.href );
		if( results == null ) {
			return false;
		} else {
			return results[1];
		}
	}
}