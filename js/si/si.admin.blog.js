/* si.util */
(function(b,h){window.si=window.si||{};si.ajax=function(b,e,l,a){return h.ajax({type:"POST",cache:!1,url:b,data:e,contentType:"application/json; charset=utf-8",dataType:"json",success:l,error:a})};si.loadingGif='<img src="/img/loading.gif" />';h(function(){var b=h("body").attr("id"),e=h("nav a");"home"!==b&&e.filter('[href*="'+b+'"]').addClass("selected");h(".logout").live("click",function(b){b.preventDefault();si.ajax("/webservices/wsUser.asmx/siUserLogout",{},function(a){a&&a.d&&"success"===a.d? window.location="/":alert("An error occured. "+(a&&a.d)?a.d:"Please try refreshing the page.")},function(){alert("An error occured. Please try refreshing the page.")})})})})(document,jQuery);window.log=function(){log.history=log.history||[];log.history.push(arguments);if(this.console){arguments.callee=arguments.callee.caller;var b=[].slice.call(arguments);"object"===typeof console.log?log.apply.call(console.log,console,b):console.log.apply(console,b)}}; (function(b){function h(){}for(var k="assert,clear,count,debug,dir,dirxml,error,exception,firebug,group,groupCollapsed,groupEnd,info,log,memoryProfile,memoryProfileEnd,profile,profileEnd,table,time,timeEnd,timeStamp,trace,warn".split(","),e;e=k.pop();)b[e]=b[e]||h})(function(){try{return console.log(),window.console}catch(b){return window.console={}}}());if(!this.JSON)this.JSON={}; (function(){function b(a){return 10>a?"0"+a:a}function h(a){l.lastIndex=0;return l.test(a)?'"'+a.replace(l,function(a){var f=p[a];return"string"===typeof f?f:"\\u"+("0000"+a.charCodeAt(0).toString(16)).slice(-4)})+'"':'"'+a+'"'}function k(b,e){var f,d,i,n,o=a,g,c=e[b];c&&"object"===typeof c&&"function"===typeof c.toJSON&&(c=c.toJSON(b));"function"===typeof j&&(c=j.call(e,b,c));switch(typeof c){case "string":return h(c);case "number":return isFinite(c)?""+c:"null";case "boolean":case "null":return""+ c;case "object":if(!c)return"null";a+=m;g=[];if("[object Array]"===Object.prototype.toString.apply(c)){n=c.length;for(f=0;f<n;f+=1)g[f]=k(f,c)||"null";i=0===g.length?"[]":a?"[\n"+a+g.join(",\n"+a)+"\n"+o+"]":"["+g.join(",")+"]";a=o;return i}if(j&&"object"===typeof j){n=j.length;for(f=0;f<n;f+=1)d=j[f],"string"===typeof d&&(i=k(d,c))&&g.push(h(d)+(a?": ":":")+i)}else for(d in c)Object.hasOwnProperty.call(c,d)&&(i=k(d,c))&&g.push(h(d)+(a?": ":":")+i);i=0===g.length?"{}":a?"{\n"+a+g.join(",\n"+a)+"\n"+ o+"}":"{"+g.join(",")+"}";a=o;return i}}if("function"!==typeof Date.prototype.toJSON)Date.prototype.toJSON=function(){return isFinite(this.valueOf())?this.getUTCFullYear()+"-"+b(this.getUTCMonth()+1)+"-"+b(this.getUTCDate())+"T"+b(this.getUTCHours())+":"+b(this.getUTCMinutes())+":"+b(this.getUTCSeconds())+"Z":null},String.prototype.toJSON=Number.prototype.toJSON=Boolean.prototype.toJSON=function(){return this.valueOf()};var e=/[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g, l=/[\\\"\x00-\x1f\x7f-\x9f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,a,m,p={"\u0008":"\\b","\t":"\\t","\n":"\\n","\u000c":"\\f","\r":"\\r",'"':'\\"',"\\":"\\\\"},j;if("function"!==typeof JSON.stringify)JSON.stringify=function(b,e,f){var d;m=a="";if("number"===typeof f)for(d=0;d<f;d+=1)m+=" ";else"string"===typeof f&&(m=f);if((j=e)&&"function"!==typeof e&&("object"!==typeof e||"number"!==typeof e.length))throw Error("JSON.stringify");return k("", {"":b})};if("function"!==typeof JSON.parse)JSON.parse=function(a,b){function f(a,e){var d,g,c=a[e];if(c&&"object"===typeof c)for(d in c)Object.hasOwnProperty.call(c,d)&&(g=f(c,d),void 0!==g?c[d]=g:delete c[d]);return b.call(a,e,c)}var d;e.lastIndex=0;e.test(a)&&(a=a.replace(e,function(a){return"\\u"+("0000"+a.charCodeAt(0).toString(16)).slice(-4)}));if(/^[\],:{}\s]*$/.test(a.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g,"@").replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g, "]").replace(/(?:^|:|,)(?:\s*\[)+/g,"")))return d=eval("("+a+")"),"function"===typeof b?f({"":d},""):d;throw new SyntaxError("JSON.parse");}})();

/* si.admin.blog */
(function( document, $ ) {
    
    var
        // form-options + elements
        _formOptions, _btnOptNewBlog, _btnOptEditBlog,

        // form-select-blog + elements
        _formSelectBlog, _ddlBlogs, _btnEditBlog, _btnCancelEditBlog, _statusEditBlog,

        // form-blog + elements
        _formBlog, _formBlogTitle, _tbBlogTitle,
        _tbBlogDescription, _tbBlogKeywords, _tbBlogProjURL,
        _taBlogBody, _ddlBlogTags, _ddlBlogCategory,
         _cbBlogIsActive, _btnSaveBlog, _btnDeleteBlog,
         _btnCancelBlog, _btnPreviewBlog, _statusBlog,

        // app vars
        tags = [], blogId = -1;

    function init() {
        initVars();
        loadBlogs();
        loadTags();
        loadCategories();
        initFormOptions();
        initFormSelectBlog();
        initFormBlog();
    }

    function initVars() {
        // form-options + elements
        _formOptions = $( '#form-options' );
        _btnOptNewBlog = $( '#btn-opt-new-blog' );
        _btnOptEditBlog = $( '#btn-opt-edit-blog' );

        // form-select-blog + elements
        _formSelectBlog = $( '#form-select-blog' );
        _ddlBlogs = $( '#ddl-blogs' );
        _btnEditBlog = $( '#btn-edit-blog' );
        _btnCancelEditBlog = $( '#btn-cancel-edit-blog' );
        _statusEditBlog = $( '#status-edit-blog' );

        // form-blog + elements
        _formBlog = $( '#form-blog' );
        _formBlogTitle = $( '#form-blog-title' );
        _tbBlogTitle = $( '#tb-blog-title' );
        _tbBlogDescription = $( '#tb-blog-description' );
        _tbBlogKeywords = $( '#tb-blog-keywords' );
        _tbBlogProjURL = $( '#tb-blog-projURL' );
        _taBlogBody = $( '#ta-blog-body' );
        _ddlBlogTags = $( '#ddl-blog-tags' );
        _ddlBlogCategory = $( '#ddl-blog-category' );
        _cbBlogIsActive = $( '#cb-blog-is-active' );
        _btnSaveBlog = $( '#btn-save-blog' );
        _btnDeleteBlog = $( '#btn-delete-blog' );
        _btnCancelBlog = $( '#btn-cancel-blog' );
        _btnPreviewBlog = $( '#btn-preview-blog' );
        _statusBlog = $( '#status-blog' );
    }

    function initFormOptions() {
        _btnOptNewBlog.on( 'click', function( e ) {
            e.preventDefault();

            blogId = -1;

            _formBlogTitle.html( 'Post a New Blog' );
            _btnPreviewBlog.hide();

            _formOptions.hide();
            _formBlog.show().find( 'input:text:first' ).focus();
        });

        _btnOptEditBlog.on( 'click', function( e ) {
            e.preventDefault();

            _formOptions.hide();
            _formSelectBlog.show();
        });
    }

    function initFormSelectBlog() {
        _btnEditBlog.on( 'click', function( e ) {
            e.preventDefault();

            var bid = parseInt( _ddlBlogs.val(), 10 );
            if ( bid > 0 ) {
                _statusEditBlog.html( '<p class="status-working">Loading blog details...&nbsp;' + si.loadingGif + '</p>' );
                blogId = bid;

                si.ajax( '/webservices/wsBlog.asmx/selectBlogs', JSON.stringify({ blogId: blogId, webUrl: '', tagId: -1, categoryId: -1 }), function( data ) {
                    if ( data && data.d ) {
                        var blog = data.d[0].cols;

                        // load the tags
                        si.ajax( '/webservices/wsBlog.asmx/loadTagsByBlog', JSON.stringify({ blogId: blogId }), function( data ) {
                            if ( data && data.d ) {
                                var tags = data.d;
                                for ( var i = 0, length = tags.length; i < length; i++ ) {
                                    var tagId = tags[i].cols.tagId;
                                    _ddlBlogTags.find( 'option[value="' + tagId + '"]' ).attr( 'selected', 'selected' );
                                }

                                // set the data in form-blog
                                _tbBlogTitle.val( blog.title || '' );
                                _tbBlogDescription.val( blog.metadesc || '' );
                                _tbBlogKeywords.val( blog.metakeywords || '' );
                                _tbBlogProjURL.val( blog.projectUrl || '' );
                                _taBlogBody.val( blog.body || '' );
                                _ddlBlogCategory.val( blog.categoryId || '-1' );
                                blog.isActive ? _cbBlogIsActive.attr( 'checked', 'checked' ) : _cbBlogIsActive.removeAttr( 'checked' );

                                _formBlogTitle.html( 'Edit Blog' );
                                _btnPreviewBlog.show().data( 'web-url', blog.webUrl );
                                _formSelectBlog.hide();
                                _formBlog.show();

                                _statusEditBlog.html( '' );
                            }
                            else {
                                _statusEditBlog.html( '<p class="status-error">An error has occured. Please try again or reload the page.</p>' );
                            }
                        }, function( err ) {
                            _statusEditBlog.html( '<p class="status-error">An error has occured. Please try again or reload the page.</p>' );
                        });

                        
                    }
                    else {
                        _statusEditBlog.html( '<p class="status-error">An error has occured. Please try again or reload the page.</p>' );
                    }
                }, function( err ) {
                    _statusEditBlog.html( '<p class="status-error">An error has occured. Please try again or reload the page.</p>' );
                });
            }
            else {
                _statusEditBlog.html( '<p class="status-error">You must select a blog to edit.</p>' );
            }   
        });

        _btnCancelEditBlog.on( 'click', function( e ) {
            e.preventDefault();

            _formOptions.show();
            _formSelectBlog.hide();
            _ddlBlogs.val( '-1' );
        });
    }

    function initFormBlog() {
        // Create the editor for the blog body
        _taBlogBody.ckeditor({ width: '598px', height: '450px' });

        _ddlBlogCategory.on( 'change', function() {
            if ( $( this ).val() !== '1' ) {
                _ddlBlogTags.find( 'option:selected' ).removeAttr( 'selected' );
            }
        });

        _btnSaveBlog.on( 'click', function( e ) {
            e.preventDefault();

            // valide the form
            var isError = false, errorMsg = '';

            // loop through all of the text inputs and trim the vals
            // check for required fields
            _formBlog.find( 'input:text, textarea' ).each(function() {
                var _this = $( this ),
                    v = $.trim( _this.val() );
                _this.val( v );

                if ( this.className.indexOf( 'req' ) !== -1 && v.length === 0 ) {
                    this.className.indexOf( 'error' ) === -1 && ( this.className = this.className + ' error' );
                    isError = true;
                    log( this.value );
                }
                else if ( this.className.indexOf( 'error' ) !== -1 ) {
                     this.className = this.className.replace( 'error', '' );
                }
            });

            isError && ( errorMsg = 'All fields marked with an * are required.<br />' );

            // if no category has been selected
            if ( _ddlBlogCategory.val() === '-1' ) {
                isError = true;
                errorMsg += 'You must select a category.';
            }
            
            // if the post is about a project and no tags have been selected
            if ( parseInt( _ddlBlogCategory.val(), 10 ) === 1 && !_ddlBlogTags.val() ) {
                isError = true;
                errorMsg += 'You must select at least one tag for a project.<br />';
            }
            
            // if there is an error
            if ( isError || errorMsg !== '' ) {
                _statusBlog.html( '<p class="status-error">' + errorMsg + '</p>' );
                _formBlog.find( '.error:first' ).focus();
            }

            // submit the blog
            else {
                _formBlog.find( 'input, textarea, button' ).attr( 'disabled', 'disabled' );
                _statusBlog.html( '<p class="status-working">Saving blog...&nbsp;' + si.loadingGif + '</p>' );

                var params = JSON.stringify({
                    blogId: blogId,
                    title: _tbBlogTitle.val(),
                    body: _taBlogBody.val(),
                    primaryPic: '',
                    thumbPic: '',
                    projectUrl: _tbBlogProjURL.val(),
                    metadesc: _tbBlogDescription.val(),
                    metakeywords: _tbBlogKeywords.val(),
                    isActive: _cbBlogIsActive.prop( 'checked' ),
                    tags: _ddlBlogTags.val() || ['-1'],
                    categoryId: parseInt( _ddlBlogCategory.val() )
                });

                si.ajax( '/webservices/wsBlog.asmx/saveBlog', params, function( data ) {
                    if ( data && data.d ) {
                        var msg = data.d;
                        if ( !isNaN( msg ) ) {
                            var theBlogId = parseInt( msg, 10 );
                            updateBlogsDdl( false, blogId === -1 ? theBlogId : -1 );
                            blogId = -1;

                            _statusBlog.html( '<p>The blog has been saved successfully.</p>' );

                            setTimeout(function() {
                                _formBlog.hide().find( 'input, textarea, button' ).removeAttr( 'disabled' );
                                _formOptions.show();
                                
                                clearBlogForm();
                            }, 1500 );
                        }
                        else {
                            _formBlog.find( 'input, textarea, button' ).removeAttr( 'disabled' );
                            _statusBlog.html( '<p class="status-error">' + msg + '</p>' );
                        }
                    }
                    else {
                        _formBlog.find( 'input, textarea, button' ).removeAttr( 'disabled' );
                        _statusBlog.html( '<p class="status-error">An error has occured. Please try again or reload the page.</p>' );
                    }
                }, function( err ) {
                    _formBlog.find( 'input, textarea, button' ).removeAttr( 'disabled' );
                    _statusBlog.html( '<p class="status-error">An error has occured. Please try again or reload the page.</p>' );
                });
            }
        });

        _btnDeleteBlog.on( 'click', function( e ) {
            e.preventDefault();

            if ( confirm( 'Are you sure you want to delete this blog?' ) ) {
                _formBlog.find( 'input, textarea, button' ).attr( 'disabled', 'disabled' );
                _statusBlog.html( '<p class="status-working">Deleting blog...&nbsp;' + si.loadingGif + '</p>' );
                si.ajax( '/webservices/wsBlog.asmx/deleteBlog', JSON.stringify({ blogId: blogId }), function( data ) {
                    if ( data && data.d ) {
                        var msg = data.d;
                        if ( msg.toLowerCase() === 'success' ) {
                            _statusBlog.html( '<p>The blog has been deleted.</p>' );
                            
                            updateBlogsDdl( true );
                            blogId = -1;

                            setTimeout(function() {
                                _formBlog.hide().find( 'input, textarea, button' ).removeAttr( 'disabled' );
                                _formOptions.show();

                               clearBlogForm();
                            }, 1500 );
                        }
                        else {
                            _statusBlog.html( '<p class="status-error">' + msg + '</p>' );
                            _formBlog.find( 'input, textarea, button' ).removeAttr( 'disabled' );
                        }
                    }
                    else {
                        _statusBlog.html( '<p class="status-error">' + msg + '</p>' );
                        _formBlog.find( 'input, textarea, button' ).removeAttr( 'disabled' );
                    }
                }, function( err ) {
                    _statusBlog.html( '<p class="status-error">' + msg + '</p>' );
                    _formBlog.find( 'input, textarea, button' ).removeAttr( 'disabled' );
                });
            }
        });

        _btnCancelBlog.on( 'click', function( e ) {
            e.preventDefault();

            _formBlog.hide();
            _formOptions.show();

            clearBlogForm();
        }); 

        _btnPreviewBlog.on( 'click', function( e ) {
            e.preventDefault();

            window.open( '/news/' + $( this ).data( 'web-url' ), '_blank' );
        }); 
    }

    function loadBlogs() {
        _ddlBlogs.html( '<option value="-1">Loading...</option>' );

        si.ajax( '/webservices/wsBLog.asmx/selectBlogs', JSON.stringify({ blogId: -1, webUrl: '', tagId: -1, categoryId: -1 }), function( data ) {
            if ( data && data.d ) {
                var blogs = data.d;
                if ( blogs.length > 0 ) {
                    var opts = '';
                    for ( var i = 0, length = blogs.length; i < length; i++ ) {
                        var blog = blogs[i].cols;
                        opts += '<option value="' + blog.blogId + '">' + blog.title + '</option>';
                    }
                    _ddlBlogs.html( opts );
                }
                else {
                    _ddlBlogs.html( '<option value="-1">No blogs available.</option>' );
                }
            }
            else {
                _ddlBlogs.html( '<option value="-1">No blogs available.</option>' );
            }
        }, function( err ) {
            _ddlBlogs.html( '<option value="-1">No blogs available.</option>' );
        });
    }

    function updateBlogsDdl( isDelete, newBlogId ) {
        // delete
        if ( isDelete ) {
            // find the option and delete the current one
            _ddlBlogs.find( 'option[value="' + blogId + '"]' ).remove();

            _ddlBlogs.find( 'option' ).length === 0 && _ddlBlogs.html( '<option value="-1">No blogs available.</option>' );
        }
        else {
            // insert
            if ( blogId === -1 ) {
                var newOpt = '<option value="' + newBlogId + '">' + _tbBlogTitle.val() + '</option>';

                if ( _ddlBlogs.find( 'option' ).length === 1 && _ddlBlogs.find( 'option:first' ).val() == '-1' ) {
                    _ddlBlogs.html( newOpt );
                }
                else {
                    _ddlBlogs.append( newOpt );
                }
            }

            // update
            else {
                _ddlBlogs.find( 'option[value="' + blogId + '"]' ).text( _tbBlogTitle.val() );
            }
        }
    }

    function loadTags() {
        _ddlBlogTags.html( '<option value="-1">Loading...</option>' );

        si.ajax( '/webservices/wsBlog.asmx/loadTags', JSON.stringify({ tagId: -1 }), function( data ) {
            if ( data && data.d ) {
                tags = data.d;
                if ( tags.length > 0 ) {
                    var opts = '';
                    for ( var i = 0, length = tags.length; i < length; i++ ) {
                        var tag = tags[i].cols;
                        opts += '<option value="' + tag.tagId + '">' + tag.tagName + '</option>';
                    }
                    _ddlBlogTags.html( opts );
                }
            }
            else {
                alert( 'No tags found. Please reload or check the database.' );    
            }
        }, function( err ) {
            alert( 'No tags found. Please reload or check the database.' );
        });
    }

    function loadCategories() {
        _ddlBlogCategory.html( '<option value="-1">Loading...</option>' );

        si.ajax( '/webservices/wsBlog.asmx/loadCategories', JSON.stringify({ categoryId: -1 }), function( data ) {
            if ( data && data.d ) {
                var categories = data.d;
                if ( categories.length > 0 ) {
                    var opts = '<option value="-1">Select a Category</option>';
                    for ( var i = 0, length = categories.length; i < length; i++ ) {
                        var category = categories[i].cols;
                        opts += '<option value="' + category.categoryId + '">' + category.categoryName + '</option>';
                    }
                    _ddlBlogCategory.html( opts );
                }
            }
            else {
                alert( 'No categories found. Please reload or check the database.' );    
            }
        }, function( err ) {
            alert( 'No categories found. Please reload or check the database.' );
        });
    }

    function clearBlogForm() {
        _formBlog.find( 'input:text, textarea' ).val( '' );
        _cbBlogIsActive.attr( 'checked', 'checked' );
        _ddlBlogTags.find( 'option:selected' ).removeAttr( 'selected' );
        _ddlBlogCategory.val( '-1' );
        _statusBlog.html( '' );
    }
    
    // helper method to remove an item/items from an array
    Array.prototype.remove = function( from, to ) {
        var rest = this.slice( ( to || from ) + 1 || this.length );
        this.length = from < 0 ? this.length + from : from;
        return this.push.apply( this, rest );
    };

    $(function(){init();});

})( document, jQuery );