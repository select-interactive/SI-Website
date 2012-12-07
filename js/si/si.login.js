﻿/* si.util */
(function(c,b){window.si=window.si||{};si.viewportmeta=c.querySelector&&c.querySelector('meta[name="viewport"]');si.ua=navigator.userAgent;si.mq=window.matchMedia?window.matchMedia("(max-width: 500px)").matches:!1;si.scaleFix=function(){if(si.viewportmeta&&/iPhone|iPad/.test(si.ua)&&!/Opera Mini/.test(si.ua))si.viewportmeta.content="width=device-width, minimum-scale=1.0, maximum-scale=1.0",c.addEventListener("gesturestart",si.gestureStart,!1)};si.gestureStart=function(){si.viewportmeta.content="width=device-width, minimum-scale=0.25, maximum-scale=1.6"}; si.hideUrlBar=function(){var b=window,a=b.document;if(!location.hash||!b.addEventListener){window.scrollTo(0,1);var d=1,e=setInterval(function(){a.body&&(clearInterval(e),d="scrollTop"in a.body?a.body.scrollTop:1,b.scrollTo(0,1===d?0:1))},15);b.addEventListener("load",function(){setTimeout(function(){b.scrollTo(0,1===d?0:1)},0)},!1)}};si.loadingGif='<img src="/img/loading.gif" />';si.ajax=function(c,a,d,e){return b.ajax({type:"POST",cache:!1,url:c,data:a,contentType:"application/json; charset=utf-8", dataType:"json",success:d,error:e})};si.cms=function(){var g=!0,a,d,e,j,i=null;b(".cms-edit").live("click",function(h){h.preventDefault();a=h=b(this);0<b(".btn-save-content").length?(g=!1,b(".btn-save-content").click()):(d=h.parent(),h.remove(),e=parseInt(d.data("content-id"),10),j=d.html(),d.empty().append('<textarea id="edit-content-id-'+e+'" class="ta-edit">'+j+"</textarea>"),CKEDITOR.config.width=d.width(),i=CKEDITOR.replace(c.getElementById("edit-content-id-"+e)),log(CKEDITOR.config.width),d.append('<button class="btn-save-content">Save</button>'))}); b(".btn-save-content").live("click",function(c){c.preventDefault();var c=b(this),n=b.trim(i.getData());c.remove();i&&i.destroy();j!==n?(d.html("<p>Saving...&nbsp;"+si.loadingGif+"</p>"),si.ajax("/webservices/wsContent.asmx/savePageContentAndGetHTML",JSON.stringify({contentId:e,pageContent:n}),function(c){c&&c.d&&(c=b(c.d),d.before(c).remove(),e=-1,d=null,j="",i=null,g||(g=!0,a.click()))},function(){})):(d.empty().html('<a href="#" class="cms-edit">Edit</a>'+j),e=-1,d=null,j="",i=null,g||(g=!0,a.click()))})}; si.projectTools=function(){var g=b(".tags");0<g.length&&(b(c.body).append('<div class="modal-overlay overlay" style="display: none;"></div>'),g.on("click","a",function(a){a.preventDefault();if(!si.mq){var d=b(this),a=parseInt(d.data("tag-id"),10);si.ajax("/webservices/wsBlog.asmx/loadTagDetails",JSON.stringify({tagId:a}),function(e){if(e&&e.d){var a="";try{a=JSON.parse(e.d)}catch(g){a="error"}if(a.status&&"success"===a.status){var e=b(a.msg),a=d.position(),h=b(c.body).width(),n=b(c.body).height(), p=b(window).height();b(c.body).find(".modal-overlay").show().height(p>n?p:n);d.parent().parent().append(e);e.css({top:a.top-e.outerHeight(),left:a.left+d.width()});b(c).width()>h&&e.css("left",a.left-(b(c).width()-h-20)+"px")}}},function(){})}}),b(".tag-close").live("click",function(a){a.preventDefault();b(this).parent().remove();b(c.body).find(".modal-overlay:visible").hide()}))};b(function(){var g=b("body").attr("id"),a=b("nav a");"home"!==g&&a.filter('[href*="'+g+'"]').addClass("selected");if(0< c.URL.indexOf("admin"))g=b("#admin-nav").find("a"),a=c.URL,a=a.substring(a.indexOf("/admin/")+7),""===a?g.first().addClass("selected"):g.filter('[href*="'+a+'"]').addClass("selected");si.projectTools();b(".logout").live("click",function(a){a.preventDefault();si.ajax("/webservices/wsUser.asmx/siUserLogout",{},function(a){a&&a.d&&"success"===a.d?window.location="/":alert("An error occured. "+(a&&a.d)?a.d:"Please try refreshing the page.")},function(){alert("An error occured. Please try refreshing the page.")})}); /iPhone|iPad/.test(si.ua)&&(si.scaleFix(),si.hideUrlBar())})})(document,jQuery);window.log=function(){log.history=log.history||[];log.history.push(arguments);if(this.console){arguments.callee=arguments.callee.caller;var c=[].slice.call(arguments);"object"===typeof console.log?log.apply.call(console.log,console,c):console.log.apply(console,c)}}; (function(c){function b(){}for(var g="assert,clear,count,debug,dir,dirxml,error,exception,firebug,group,groupCollapsed,groupEnd,info,log,memoryProfile,memoryProfileEnd,profile,profileEnd,table,time,timeEnd,timeStamp,trace,warn".split(","),a;a=g.pop();)c[a]=c[a]||b})(function(){try{return console.log(),window.console}catch(c){return window.console={}}}());if(!this.JSON)this.JSON={}; (function(){function c(a){return 10>a?"0"+a:a}function b(a){d.lastIndex=0;return d.test(a)?'"'+a.replace(d,function(a){var b=i[a];return"string"===typeof b?b:"\\u"+("0000"+a.charCodeAt(0).toString(16)).slice(-4)})+'"':'"'+a+'"'}function g(a,c){var d,l,m,i,o=e,k,f=c[a];f&&"object"===typeof f&&"function"===typeof f.toJSON&&(f=f.toJSON(a));"function"===typeof h&&(f=h.call(c,a,f));switch(typeof f){case "string":return b(f);case "number":return isFinite(f)?""+f:"null";case "boolean":case "null":return""+ f;case "object":if(!f)return"null";e+=j;k=[];if("[object Array]"===Object.prototype.toString.apply(f)){i=f.length;for(d=0;d<i;d+=1)k[d]=g(d,f)||"null";m=0===k.length?"[]":e?"[\n"+e+k.join(",\n"+e)+"\n"+o+"]":"["+k.join(",")+"]";e=o;return m}if(h&&"object"===typeof h){i=h.length;for(d=0;d<i;d+=1)l=h[d],"string"===typeof l&&(m=g(l,f))&&k.push(b(l)+(e?": ":":")+m)}else for(l in f)Object.hasOwnProperty.call(f,l)&&(m=g(l,f))&&k.push(b(l)+(e?": ":":")+m);m=0===k.length?"{}":e?"{\n"+e+k.join(",\n"+e)+"\n"+ o+"}":"{"+k.join(",")+"}";e=o;return m}}if("function"!==typeof Date.prototype.toJSON)Date.prototype.toJSON=function(){return isFinite(this.valueOf())?this.getUTCFullYear()+"-"+c(this.getUTCMonth()+1)+"-"+c(this.getUTCDate())+"T"+c(this.getUTCHours())+":"+c(this.getUTCMinutes())+":"+c(this.getUTCSeconds())+"Z":null},String.prototype.toJSON=Number.prototype.toJSON=Boolean.prototype.toJSON=function(){return this.valueOf()};var a=/[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g, d=/[\\\"\x00-\x1f\x7f-\x9f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,e,j,i={"\u0008":"\\b","\t":"\\t","\n":"\\n","\u000c":"\\f","\r":"\\r",'"':'\\"',"\\":"\\\\"},h;if("function"!==typeof JSON.stringify)JSON.stringify=function(a,b,c){var d;j=e="";if("number"===typeof c)for(d=0;d<c;d+=1)j+=" ";else"string"===typeof c&&(j=c);if((h=b)&&"function"!==typeof b&&("object"!==typeof b||"number"!==typeof b.length))throw Error("JSON.stringify");return g("", {"":a})};if("function"!==typeof JSON.parse)JSON.parse=function(b,c){function d(a,b){var e,g,f=a[b];if(f&&"object"===typeof f)for(e in f)Object.hasOwnProperty.call(f,e)&&(g=d(f,e),void 0!==g?f[e]=g:delete f[e]);return c.call(a,b,f)}var e;a.lastIndex=0;a.test(b)&&(b=b.replace(a,function(a){return"\\u"+("0000"+a.charCodeAt(0).toString(16)).slice(-4)}));if(/^[\],:{}\s]*$/.test(b.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g,"@").replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g, "]").replace(/(?:^|:|,)(?:\s*\[)+/g,"")))return e=eval("("+b+")"),"function"===typeof c?d({"":e},""):e;throw new SyntaxError("JSON.parse");}})();

/* si.login */
(function( document, $ ) {
    
    function init() {
        var _formLogin = $( '#form-login' ),
            _tbUsername = $( '#tb-username' ),
            _tbPassword = $( '#tb-password' ),
            _cbRemember = $( '#cb-remember' ),
            _btnLogin = $( '#btn-login' ),
            _status = $( '#status-login' );

        _formLogin.on( 'submit', function( e ) {
            // prevent postback
            e.preventDefault();

            // disable the inputs
            _formLogin.find( 'input' ).attr( 'disabled', 'disabled' );

            // validate the form
            var un = $.trim( _tbUsername.val() ),
                pwd = $.trim( _tbPassword.val() );

            if ( un === '' || pwd === '' ) {
                _status.html( '<p class="status-error">Both username and password are required.</p>' );
                _formLogin.find( 'input' ).removeAttr( 'disabled' );
                un === '' ? _tbUsername.focus() : _tbPassword.focus();
                return;
            }

            // attempt login
            _status.html( '<p class="status-working">Attemping login...' + si.loadingGif + '</p>' );
            si.ajax( '/webservices/wsUser.asmx/siUserLogin', JSON.stringify({ username: un, password: pwd, remember: _cbRemember.prop( 'checked' ) }), function( data ) {
                if ( data && data.d ) {
                    var msg = data.d;
                    if ( msg.toLowerCase() === 'success' ) {
                        _status.html( '<p class="status-complete">Login successful. Redirecting.</p>' );
                        window.location = '/admin/';
                    }
                    else {
                        _status.html( '<p class="status-error">' + msg + '</p>' );
                        _formLogin.find( 'input' ).removeAttr( 'disabled' );
                    }   
                }
            }, function( err ) {
                _status.html( '<p class="status-error">An error has occured. Please try again or reload the page.</p>' );
                _formLogin.find( 'input' ).removeAttr( 'disabled' );
            });
        });
    }   

    $(function(){init();});

})( document, jQuery );