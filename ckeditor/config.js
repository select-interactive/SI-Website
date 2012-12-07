/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
    config.toolbar = 'SRP';
    config.toolbar_SRP = 
    [
	    ['Source']
    ];

    config.toolbar_BLOG = [
        ['Bold', 'Italic', 'Underline', ]
    ]
};

CKEDITOR.on( 'instanceReady', function( ev ) {
    var tags = ['p', 'ol', 'ul', 'li', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'div'];

    for (var key in tags) {
        ev.editor.dataProcessor.writer.setRules(tags[key],
            {
                indent : false,
                breakBeforeOpen : true,
                breakAfterOpen : false,
                breakBeforeClose : false,
                breakAfterClose : true
            });
    }
});