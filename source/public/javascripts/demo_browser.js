if(!Bumblebee) {
	var Bumblebee = { };
}


Element.addMethods('iframe', {
document: function(element) {
  element = $(element);
  if (element.contentWindow)
      return element.contentWindow.document;
  else if (element.contentDocument)
      return element.contentDocument;
  else
      return null;
},
$: function(element, frameElement) { 
  element = $(element);
  var frameDocument = element.document();
  if (arguments.length > 2) {
      for (var i = 1, frameElements = [], length = arguments.length; i < length; i++)
          frameElements.push(element.$(arguments[i]));
      return frameElements;
  }
  if (Object.isString(frameElement))
      frameElement = frameDocument.getElementById(frameElement);
  return frameElement || element;
}
});

Bumblebee.DemoBrowser = {
	init: function(projectId, demoId) {
		Jester.Resource.model('Demo', { prefix: '/projects/' + projectId });

		this.demo = Demo.find(demoId);

		Jester.Resource.model('DemoActivity', {
			prefix: '/projects/' + projectId + '/demos/' + this.demo.id + '/', 
			singular: 'demo_activity', 
			plural: 'demo_activities'
		});
		
		this.content = $('content');
		
		this.content.document().observe('dom:loaded', function() {
			alert('test');
			this.content.select('a').invoke('observe', 'click', this.onContentLinkClicked.bind(this));
			this.content.select('form').invoke('observe', 'submit', this.onFormSubmittedClicked.bind(this));
		}.bind(this));
	},
	
	onContentLinkClicked: function(event) {
		var a = event.findElement('a');
		alert(a.href)
		// this.demo.create_demo_activity({ 
		// 	url: a.href,
		// 	method: "get"
		// })
	},
	
	onFormSubmittedClicked: function(event) {
		var form = event.findElement('form');
		
		// this.demo.create_demo_activity({ 
		// 	url: form.action,
		// 	method: form.method
		// })
	}
}