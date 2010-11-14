// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

document.observe("dom:loaded", function() {
	$$('.thumbnail').each(function(element){
		element.observe('click', function(event){ alert("hello"); });
	});
});