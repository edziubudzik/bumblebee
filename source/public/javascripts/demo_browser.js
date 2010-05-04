if(!Bumblebee) {
	var Bumblebee = { };
}

// if(!Cookie) {
	document.write('<script type="text/javascript" src="http://localhost:3000/javascripts/cookie.js"></script>');
	document.write('<script type="text/javascript" src="http://localhost:3000/javascripts/popup.js"></script>');
	document.write('<link rel="stylesheet" href="http://localhost:3000/stylesheets/demo_browser.css" type="text/css" />');
	document.write('<link rel="stylesheet" href="http://localhost:3000/stylesheets/popup.css" type="text/css" />');
// }

document.observe('dom:loaded', function() {
	Bumblebee.DemoBrowser.init();
});

Bumblebee.DemoBrowser = {
	bugReportPopups: [],
	projectId: false,
	demoId: false,
	userId: false,
	
	init: function() {
		Cookie.init({ name: 'bumblebee', path: '/' }, { projectId: false, demoId: false, enabled: false, userId: false });
		
		if(this.getRequestParam('_bumblebee_enabled')) {
			this.enable();
		} else {
			this.enabled = Cookie.getData('enabled');
			this.projectId = Cookie.getData('projectId');
			this.demoId = Cookie.getData('demoId');
			this.userId = Cookie.getData('userId');
		}

		if(!this.enabled) {
			return false;
		}
		
		var script = new Element('script', {
			type: 'text/javascript',
			src: 'http://localhost:3000/projects/' + this.projectId + '/demos/' + this.demoId + '/bug_reports.js?url='+escape(document.location)
		})
		document.body.insert(script);
		
		$$('*').invoke('observe', 'click', this.onElementClicked.bind(this));
		
		this.showBar();
		
		this.submitTarget = new Element('iframe', {
			name: 'bumblebee_submit_target'
		}).setStyle({ display: 'none' });
		
		this.form = new Element('form', {
			method: 'post',
			action: 'http://localhost:3000/projects/' + this.projectId + '/demos/' + this.demoId + '/demo_activities',
			target: 'bumblebee_submit_target'
		}).setStyle({ display: 'none' });
		
		this.urlElement = new Element('input', {
			type: 'text',
			name: 'demo_activity[url]'
		});
		
		this.methodElement = new Element('input', {
			type: 'text',
			name: 'demo_activity[method]'
		});
		
		this.userElement = new Element('input', {
			type: 'text',
			name: 'demo_activity[user_id]',
			value: this.userId
		});
		
		this.form.insert(this.urlElement);
		this.form.insert(this.methodElement);
		this.form.insert(this.userElement);

		document.body.insert(this.submitTarget);
		document.body.insert(this.form);
	
		$$('a').invoke('observe', 'click', this.onContentLinkClicked.bind(this));
		// this.content.select('form').invoke('observe', 'submit', this.onFormSubmittedClicked.bind(this));

		this.onBugReportsLoaded();
	},
	
	initBar: function() {
		if(!this.bar) {
			this.barSpacer = new Element('div', {
				id: 'demo_browser_spacer'
			});
			
			document.body.insert({ top: this.barSpacer });
			
			this.bar = new Element('div', {
				id: 'demo_browser'
			});
			
			this.links = new Element('div', { 
				className: 'links'
			});
			
			this.closeLink = new Element('a', {
				href: '#'
			});
			this.closeLink.update('[x] zamknij');
			this.closeLink.observe('click', function(event) {
				event.stop();
				this.disable();
			}.bind(this));
			
			this.reportLink = new Element('a', {
				href: '#'
			});
			this.reportLink.update('zgłoś błąd');
			this.reportLink.observe('click', function(event) {
				event.stop();
				
				if(this.mode == 'pointing') {
					this.mode = false;
					document.body.removeClassName('bumblebee_pointing');
				} else {
					this.mode = 'pointing';
					document.body.addClassName('bumblebee_pointing');
				}
			}.bind(this));
			
			this.links.insert(this.reportLink);
			this.links.insert(this.closeLink);
			this.bar.update('<a class="logo">Bumble<strong>bee</strong></a>');
			this.bar.insert(this.links);
			
			document.body.insert(this.bar);
		}
	},
	
	showBar: function() {
		this.initBar();
		
		this.bar.show();
		this.barSpacer.show();
	},
	
	hideBar: function() {
		if(this.bar) {
			this.bar.hide();
			this.barSpacer.hide();
		}
	},
	
	enable: function() {
		this.enabled = true;
		this.showBar();
		
		this.projectId = this.getRequestParam('_bumblebee_project_id');
		this.demoId = this.getRequestParam('_bumblebee_demo_id');

		Cookie.setData('enabled', true);
		Cookie.setData('projectId', this.projectId);
		Cookie.setData('demoId', this.demoId);
		Cookie.setData('userId', this.userId);
	},
	
	disable: function() {
		this.enabled = false;
		this.hideBar();
		Cookie.setData('enabled', false);
		Cookie.setData('projectId', false);
		Cookie.setData('demoId', false);
		Cookie.setData('userId', false);
	},
	
	loadBugReports: function(bugReports) {
		this.bugReportRecords = bugReports;
	},
	
	onBugReportsLoaded: function() {
		if(!this.bugReportRecords) {
			setTimeout("Bumblebee.DemoBrowser.onBugReportsLoaded()", 100);
			return false;
		}

		this.bugReportRecords.each(function(record) {
			this.bugReportPopups[this.bugReportPopups.length] = new Bumblebee.Popup(
				record.x, record.y, record.content, { autoShow: true }
			);
		}.bind(this));
	},
	
	onElementClicked: function(event) {
		if(this.mode != 'pointing') {
			return false;
		}
		
		event.stop();
		
		this.mode = false;
		document.body.removeClassName('bumblebee_pointing');
		
		var element = event.findElement();
		var position = element.cumulativeOffset();
		var x = position.left + element.getWidth()/2;
		var y = position.top + element.getHeight()

		new Bumblebee.Popup(
			x,
			y,
			'<h3>Zgłoszenie błędu</h3>' +
			'<form action="http://localhost:3000/projects/' + this.projectId + '/demos/' + this.demoId + '/bug_reports" method="post" target="bumblebee_submit_target" onsubmit="document.location = document.location">' +
				'<textarea name="bug_report[content]"></textarea><br/>' +
				'<input type="hidden" name="bug_report[user_id]" value="' + this.userId + '" />' +
				'<input type="hidden" name="bug_report[x]" value="' + x + '" />' +
				'<input type="hidden" name="bug_report[y]" value="' + y + '" />' +
				'<input type="hidden" name="bug_report[url]" value="' + document.location + '" />' +
				'<input type="submit" value="Zgłoś" /> lub <a href="#" class="cancel">anuluj</a>' +
			'</form>',
			{
				autoShow: true
			}
		);
	},
	
	onContentLinkClicked: function(event) {
		var a = event.findElement('a');
		
		this.submitActivity(a.href, 'get');
	},
	
	onFormSubmittedClicked: function(event) {
		var form = event.findElement('form');
		
		this.submitActivity(form.action, form.method);
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