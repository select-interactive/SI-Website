(function(b,h){window.si=window.si||{};si.ajax=function(b,e,l,a){return h.ajax({type:"POST",cache:!1,url:b,data:e,contentType:"application/json; charset=utf-8",dataType:"json",success:l,error:a})};si.loadingGif='<img src="/img/loading.gif" />';h(function(){var b=h("body").attr("id"),e=h("nav a");"home"!==b&&e.filter('[href*="'+b+'"]').addClass("selected");h(".logout").live("click",function(b){b.preventDefault();si.ajax("/webservices/wsUser.asmx/siUserLogout",{},function(a){a&&a.d&&"success"===a.d? window.location="/":alert("An error occured. "+(a&&a.d)?a.d:"Please try refreshing the page.")},function(){alert("An error occured. Please try refreshing the page.")})})})})(document,jQuery);window.log=function(){log.history=log.history||[];log.history.push(arguments);if(this.console){arguments.callee=arguments.callee.caller;var b=[].slice.call(arguments);"object"===typeof console.log?log.apply.call(console.log,console,b):console.log.apply(console,b)}}; (function(b){function h(){}for(var k="assert,clear,count,debug,dir,dirxml,error,exception,firebug,group,groupCollapsed,groupEnd,info,log,memoryProfile,memoryProfileEnd,profile,profileEnd,table,time,timeEnd,timeStamp,trace,warn".split(","),e;e=k.pop();)b[e]=b[e]||h})(function(){try{return console.log(),window.console}catch(b){return window.console={}}}());if(!this.JSON)this.JSON={}; (function(){function b(a){return 10>a?"0"+a:a}function h(a){l.lastIndex=0;return l.test(a)?'"'+a.replace(l,function(a){var f=p[a];return"string"===typeof f?f:"\\u"+("0000"+a.charCodeAt(0).toString(16)).slice(-4)})+'"':'"'+a+'"'}function k(b,e){var f,d,i,n,o=a,g,c=e[b];c&&"object"===typeof c&&"function"===typeof c.toJSON&&(c=c.toJSON(b));"function"===typeof j&&(c=j.call(e,b,c));switch(typeof c){case "string":return h(c);case "number":return isFinite(c)?""+c:"null";case "boolean":case "null":return""+ c;case "object":if(!c)return"null";a+=m;g=[];if("[object Array]"===Object.prototype.toString.apply(c)){n=c.length;for(f=0;f<n;f+=1)g[f]=k(f,c)||"null";i=0===g.length?"[]":a?"[\n"+a+g.join(",\n"+a)+"\n"+o+"]":"["+g.join(",")+"]";a=o;return i}if(j&&"object"===typeof j){n=j.length;for(f=0;f<n;f+=1)d=j[f],"string"===typeof d&&(i=k(d,c))&&g.push(h(d)+(a?": ":":")+i)}else for(d in c)Object.hasOwnProperty.call(c,d)&&(i=k(d,c))&&g.push(h(d)+(a?": ":":")+i);i=0===g.length?"{}":a?"{\n"+a+g.join(",\n"+a)+"\n"+ o+"}":"{"+g.join(",")+"}";a=o;return i}}if("function"!==typeof Date.prototype.toJSON)Date.prototype.toJSON=function(){return isFinite(this.valueOf())?this.getUTCFullYear()+"-"+b(this.getUTCMonth()+1)+"-"+b(this.getUTCDate())+"T"+b(this.getUTCHours())+":"+b(this.getUTCMinutes())+":"+b(this.getUTCSeconds())+"Z":null},String.prototype.toJSON=Number.prototype.toJSON=Boolean.prototype.toJSON=function(){return this.valueOf()};var e=/[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g, l=/[\\\"\x00-\x1f\x7f-\x9f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,a,m,p={"\u0008":"\\b","\t":"\\t","\n":"\\n","\u000c":"\\f","\r":"\\r",'"':'\\"',"\\":"\\\\"},j;if("function"!==typeof JSON.stringify)JSON.stringify=function(b,e,f){var d;m=a="";if("number"===typeof f)for(d=0;d<f;d+=1)m+=" ";else"string"===typeof f&&(m=f);if((j=e)&&"function"!==typeof e&&("object"!==typeof e||"number"!==typeof e.length))throw Error("JSON.stringify");return k("", {"":b})};if("function"!==typeof JSON.parse)JSON.parse=function(a,b){function f(a,e){var d,g,c=a[e];if(c&&"object"===typeof c)for(d in c)Object.hasOwnProperty.call(c,d)&&(g=f(c,d),void 0!==g?c[d]=g:delete c[d]);return b.call(a,e,c)}var d;e.lastIndex=0;e.test(a)&&(a=a.replace(e,function(a){return"\\u"+("0000"+a.charCodeAt(0).toString(16)).slice(-4)}));if(/^[\],:{}\s]*$/.test(a.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g,"@").replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g, "]").replace(/(?:^|:|,)(?:\s*\[)+/g,"")))return d=eval("("+a+")"),"function"===typeof b?f({"":d},""):d;throw new SyntaxError("JSON.parse");}})();

(function( document, $ ) {
    window.si = window.si || {};

    si.contact = (function() {
        
        function init() {
            // initialize the contact form
            initContactForm();
        }

        function initContactForm() {
            var _formContact = $( '#form-contact' ),
                _cbs = $( '#contact-opts' ).find( ':input:checkbox' ),
                _tbName = $( '#tb-name' ),
                _tbEmail = $( '#tb-email' ),
                _tbPhone = $( '#tb-phone' ),
                _taMessage = $( '#ta-message' ),
                _btnSubmit = $( '#btn-submit' ),
                _status = $( '#status-contact' );

            // submit button onclick
            _btnSubmit.on( 'click', function( e ) {
                // prevent postback
                e.preventDefault();
                
                var isError = false, contactReason = '';
                
                // validate the form
                // check for contact options
                _cbs.each(function() {
                    if ( this.checked ) {
                        contactReason !== '' && ( contactReason += '&nbsp;&nbsp;' );
                        contactReason += this.value;
                    }
                });
                contactReason === '' && ( isError = true );
                
                // Loop through all text inputs
                _formContact.find( ':input:text, textarea' ).each(function() {
                    if ( $.trim( this.value ).length === 0 ) {
                        this.className = 'error';
                        isError = true;
                    }
                    else {
                        this.className = '';
                    }
                });

                // if there is an error, show the usre
                if ( isError ) {
                    _formContact.find( '.error' ).first().focus();
                    _status.html( '<p class="status-error">' + ( contactReason === '' ? 'You must select a contact reason. ' : '' ) + 'All fields are required.</p>' );
                }

                // else submit the data 
                else { 
                    _formContact.find( 'input, textarea, button' ).attr( 'disabled', 'disabled' );
                    _status.html( '<p class="status-working">Submitting form...&nbsp;' + si.loadingGif + '</p>' );

                    var params = JSON.stringify({
                        reason: contactReason,
                        name: $.trim( _tbName.val() ),
                        email: $.trim( _tbEmail.val() ),
                        phone: $.trim( _tbPhone.val() ),
                        message: $.trim( _taMessage.val() )
                    });

                    si.ajax( '/webservices/wsContact.asmx/sendContactMessage', params, function( data ) {
                        if ( data && data.d ) {
                            var msg = data.d;
                            if ( msg.toLowerCase() === 'success' ) {
                                _formContact.html( '<p class="nm">Thank you for contacting us. A member of the Select Interactive team will be in touch with you as quickly as possible!</p>' );
                            }
                            else {
                                _formContact.find( 'input, textarea, button' ).removeAttr( 'disabled' );
                                _status.html( '<p class="status-error">' + msg + '</p>' );
                            }
                        }
                        else {
                            _formContact.find( 'input, textarea, button' ).removeAttr( 'disabled' );
                            _status.html( '<p class="status-error">An error has occured. Please try again or reload the page.</p>' );
                        }
                    }, function( err ) {
                        _formContact.find( 'input, textarea, button' ).removeAttr( 'disabled' );
                        _status.html( '<p class="status-error">An error has occured. Please try again or reload the page.</p>' );
                    });
                }
            });
        }

        $(function(){init();});
    })();

})( document, jQuery );