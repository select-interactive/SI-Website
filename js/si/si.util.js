/*!
 * si.util.js
 *
 * A utility file that provides helper methods for error mesages, ajax calls, logging, etc...
 * Ajax function has been updated to return the jXHR object available in jQuery 1.5+
 * Provides a window.log default function to prevent errors in browsers without a console.
 *
 * @author: Jeremy Burton (jeremy@select-interactive.com)
 * @copyright: 2011 Select Interactive.
 */
(function( document, $ ) {
    window.si = window.si || {};
    si.viewportmeta = document.querySelector && document.querySelector('meta[name="viewport"]');
    si.ua = navigator.userAgent;
    si.mq = window.matchMedia ? window.matchMedia( '(max-width: 500px)' ).matches : false;

    si.scaleFix = function () {
        if ( si.viewportmeta && /iPhone|iPad/.test( si.ua ) && !/Opera Mini/.test( si.ua ) ) {
            si.viewportmeta.content = 'width=device-width, minimum-scale=1.0, maximum-scale=1.0';
            document.addEventListener( 'gesturestart', si.gestureStart, false );
        }
    };

    si.gestureStart = function () {
        si.viewportmeta.content = 'width=device-width, minimum-scale=0.25, maximum-scale=1.6';
    };

    si.hideUrlBar = function () {
        var win = window, doc = win.document;
 
        // If there's a hash, or addEventListener is undefined, stop here
        if( !location.hash || !win.addEventListener ){
 
            //scroll to 1
            window.scrollTo( 0, 1 );
            var scrollTop = 1,
 
            //reset to 0 on bodyready, if needed
            bodycheck = setInterval(function() {
                if( doc.body ){
                    clearInterval( bodycheck );
                    scrollTop = 'scrollTop' in doc.body ? doc.body.scrollTop : 1;
                    win.scrollTo( 0, scrollTop === 1 ? 0 : 1 );
                }  
            }, 15 );
 
            win.addEventListener( 'load', function(){
                setTimeout(function(){
                    //reset to hide addr bar at onload
                    win.scrollTo( 0, scrollTop === 1 ? 0 : 1 );
                }, 0 );
            }, false );
        }
    };

    si.loadingGif = '<img src="/img/loading.gif" />';

    si.ajax = function( wsUrl, wsData, callSuccess, callFailure ) {
        return $.ajax({
            type: 'POST',
            cache: false,
            url: wsUrl,
            data: wsData,
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: callSuccess,
            error: callFailure
        });
    };

    si.cms = function() {
        var canEdit = true, _link, _parent, contentId, content, editor = null;

        $( '.cms-edit' ).live( 'click', function( e ) {
            // prevent postback
            e.preventDefault();

            var _this = $( this );
            _link = _this;

            function doClick() {
                // set the parent
                _parent = _this.parent();
                
                // remove the edit link
                _this.remove();

                // cache everything
                contentId = parseInt( _parent.data( 'content-id' ), 10 );
                content = _parent.html();
                
                // set the content and add it
                _parent.empty().append( '<textarea id="edit-content-id-' + contentId + '" class="ta-edit">' + content + '</textarea>' );

                // convert the textarea to a text editor
                CKEDITOR.config.width = _parent.width();
                editor = CKEDITOR.replace( document.getElementById( 'edit-content-id-' + contentId ) );
                log( CKEDITOR.config.width );
                
                // create save button and add it
                _parent.append( '<button class="btn-save-content">Save</button>' );
            }

            // if a different edit is open, wait 10 milliseconds for the save to occur
            if ( $( '.btn-save-content' ).length > 0 ) {
                canEdit = false;
                $( '.btn-save-content' ).click();
            }
            else {
                doClick();
            }
        });

        $( '.btn-save-content' ).live( 'click', function( e ) {
            // prevent postback
            e.preventDefault();
            
            var _this = $( this ),
                
                // get the content
                newContent = $.trim( editor.getData() );
            
            // remove the button
            _this.remove();

            // remove the editor instanct
            editor && editor.destroy();
            
            // if the content has been updated, save it
            if ( content !== newContent ) {
                _parent.html( '<p>Saving...&nbsp;' + si.loadingGif + '</p>' );

                si.ajax( '/webservices/wsContent.asmx/savePageContentAndGetHTML', JSON.stringify({ contentId: contentId, pageContent: newContent }), function( data ) {
                    if ( data && data.d ) {
                        var newEl = $( data.d );
                        _parent.before( newEl ).remove();

                        contentId = -1;
                        _parent = null;
                        content = '';
                        editor = null;
                        if ( !canEdit ) {
                            canEdit = true;
                            _link.click();
                        }
                    }
                }, function( err ) {

                });
            }

            // if the content is not new, show the old content
            else {
                _parent.empty().html( '<a href="#" class="cms-edit">Edit</a>' + content );
                contentId = -1;
                _parent = null;
                content = '';
                editor = null;
                if ( !canEdit ) {
                    canEdit = true;
                    _link.click();
                }
            }
        });
    };

    si.projectTools = function() {
        var _tags = $( '.tags' );

        if ( _tags.length > 0 ) {
            // add the overlay
            $( document.body ).append( '<div class="modal-overlay overlay" style="display: none;"></div>' );
            
            _tags.on( 'click', 'a', function( e ) {
                e.preventDefault();

                // we don't want to do this for mobile
                if ( !si.mq ) {
                    var _this = $( this ),
                        tagId = parseInt( _this.data( 'tag-id' ), 10 );

                    si.ajax( '/webservices/wsBlog.asmx/loadTagDetails', JSON.stringify({ tagId: tagId }), function( data ) {
                        if ( data && data.d ) {
                            var response = ''
                            try {
                                response = JSON.parse( data.d );
                            }
                            catch( err ) {
                                response = 'error';
                            } 

                            if ( response.status && response.status === 'success' ) {
                                var _div = $( response.msg ),
                                    p = _this.position(),
                                    bWidth = $( document.body ).width(),
                                    bHeight = $( document.body ).height(),
                                    wHeight = $( window ).height(),
                                    oHeight = wHeight > bHeight ? wHeight : bHeight;

                                $( document.body ).find( '.modal-overlay' ).show().height( oHeight );

                                _this.parent().parent().append( _div );
                            
                                _div.css({
                                    top: p.top - _div.outerHeight(),
                                    left: p.left + _this.width()
                                });

                                if ( $( document ).width() > bWidth ) {
                                    _div.css( 'left', p.left - ( $( document ).width() - bWidth - 20 ) + 'px' );
                                }
                            }   
                            else {
                                    // if an error, don't do anything
                            // we just won't show any data
                            }
                        }
                    }, function( err ) {
                            // if an error, don't do anything
                    // we just won't show any data
                    });
                }
            });

            $( '.tag-close' ).live( 'click', function( e ) {
                e.preventDefault();

                var _this = $( this ),
                    _parent = _this.parent();

                _parent.remove();
                $( document.body ).find( '.modal-overlay:visible' ).hide();
            });
        }
    };

    $(function() {
        var pageId = $( 'body' ).attr( 'id' ),
                links = $( 'nav a' );

        pageId !== 'home' && links.filter( '[href*="' + pageId + '"]' ).addClass( 'selected' );
        
        if ( document.URL.indexOf( 'admin' ) > 0 ) {
            var adminLinks = $( '#admin-nav' ).find( 'a' ),
                url = document.URL,
                dir = url.substring( url.indexOf( '/admin/' ) + 7 );

            dir === '' 
                ? adminLinks.first().addClass( 'selected' )
                : adminLinks.filter( '[href*="' + dir + '"]' ).addClass( 'selected' );
        }   

        //si.cms();
        si.projectTools();

        $( '.logout' ).live( 'click', function( e ) {
            e.preventDefault();

            si.ajax( '/webservices/wsUser.asmx/siUserLogout', {}, function( data ) {
                if ( data && data.d && data.d === 'success' ) {
                    window.location = '/';
                }
                else {
                    alert( 'An error occured. ' + ( data && data.d ) ? data.d : 'Please try refreshing the page.' );
                }
            }, function( err ) {
                alert( 'An error occured. Please try refreshing the page.' );
            });
        });

        // for mobile
        if ( /iPhone|iPad/.test( si.ua ) ) {
            si.scaleFix();
            si.hideUrlBar();
        }
    });

})( document, jQuery );

// Set a defualt window.log function to prevent error in browsers without a console - IE.
window.log = function(){
    log.history = log.history || [];
    log.history.push( arguments );
    if ( this.console ) {
        arguments.callee = arguments.callee.caller;
        var newarr = [].slice.call( arguments );
        ( typeof console.log === 'object' ? log.apply.call( console.log, console, newarr ) : console.log.apply( console, newarr ) );
    }
};

// make it safe to use console.log always
(function(b){function c(){}for(var d="assert,clear,count,debug,dir,dirxml,error,exception,firebug,group,groupCollapsed,groupEnd,info,log,memoryProfile,memoryProfileEnd,profile,profileEnd,table,time,timeEnd,timeStamp,trace,warn".split(","),a;a=d.pop();){b[a]=b[a]||c}})((function(){try
{console.log();return window.console;}catch(err){return window.console={};}})());

/*!
 * Include Douglas Crockford's JSON2.js minified.
 * This allows us to use json.stringify() in IE7
 */
if(!this.JSON){this.JSON={};}(function(){function f(n){return n<10?'0'+n:n;}if(typeof Date.prototype.toJSON!=='function'){Date.prototype.toJSON=function(key){return isFinite(this.valueOf())?this.getUTCFullYear()+'-'+f(this.getUTCMonth()+1)+'-'+f(this.getUTCDate())+'T'+f(this.getUTCHours())+':'+f(this.getUTCMinutes())+':'+f(this.getUTCSeconds())+'Z':null;};String.prototype.toJSON=Number.prototype.toJSON=Boolean.prototype.toJSON=function(key){return this.valueOf();};}var cx=/[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,escapable=/[\\\"\x00-\x1f\x7f-\x9f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,gap,indent,meta={'\b':'\\b','\t':'\\t','\n':'\\n','\f':'\\f','\r':'\\r','"':'\\"','\\':'\\\\'},rep;function quote(string){escapable.lastIndex=0;return escapable.test(string)?'"'+string.replace(escapable,function(a){var c=meta[a];return typeof c==='string'?c:'\\u'+('0000'+a.charCodeAt(0).toString(16)).slice(-4);})+'"':'"'+string+'"';}function str(key,holder){var i,k,v,length,mind=gap,partial,value=holder[key];if(value&&typeof value==='object'&&typeof value.toJSON==='function'){value=value.toJSON(key);}if(typeof rep==='function'){value=rep.call(holder,key,value);}switch(typeof value){case'string':return quote(value);case'number':return isFinite(value)?String(value):'null';case'boolean':case'null':return String(value);case'object':if(!value){return'null';}gap+=indent;partial=[];if(Object.prototype.toString.apply(value)==='[object Array]'){length=value.length;for(i=0;i<length;i+=1){partial[i]=str(i,value)||'null';}v=partial.length===0?'[]':gap?'[\n'+gap+partial.join(',\n'+gap)+'\n'+mind+']':'['+partial.join(',')+']';gap=mind;return v;}if(rep&&typeof rep==='object'){length=rep.length;for(i=0;i<length;i+=1){k=rep[i];if(typeof k==='string'){v=str(k,value);if(v){partial.push(quote(k)+(gap?': ':':')+v);}}}}else{for(k in value){if(Object.hasOwnProperty.call(value,k)){v=str(k,value);if(v){partial.push(quote(k)+(gap?': ':':')+v);}}}}v=partial.length===0?'{}':gap?'{\n'+gap+partial.join(',\n'+gap)+'\n'+mind+'}':'{'+partial.join(',')+'}';gap=mind;return v;}}if(typeof JSON.stringify!=='function'){JSON.stringify=function(value,replacer,space){var i;gap='';indent='';if(typeof space==='number'){for(i=0;i<space;i+=1){indent+=' ';}}else if(typeof space==='string'){indent=space;}rep=replacer;if(replacer&&typeof replacer!=='function'&&(typeof replacer!=='object'||typeof replacer.length!=='number')){throw new Error('JSON.stringify');}return str('',{'':value});};}if(typeof JSON.parse!=='function'){JSON.parse=function(text,reviver){var j;function walk(holder,key){var k,v,value=holder[key];if(value&&typeof value==='object'){for(k in value){if(Object.hasOwnProperty.call(value,k)){v=walk(value,k);if(v!==undefined){value[k]=v;}else{delete value[k];}}}}return reviver.call(holder,key,value);}cx.lastIndex=0;if(cx.test(text)){text=text.replace(cx,function(a){return'\\u'+('0000'+a.charCodeAt(0).toString(16)).slice(-4);});}if(/^[\],:{}\s]*$/.test(text.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g,'@').replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g,']').replace(/(?:^|:|,)(?:\s*\[)+/g,''))){j=eval('('+text+')');return typeof reviver==='function'?walk({'':j},''):j;}throw new SyntaxError('JSON.parse');};}}());