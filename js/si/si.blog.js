(function( document, $ ) {
    
    var 
        // DOM elements
        // comments wrapper
        _comments,

        // form comment
        _formComment,
        _taComment,
        _tbName,
        _tbEmail,
        _btnSubmit,
        _statusComment;

    function init() {
        initVars();
        initEvents();
    }

    function initVars() {
        // DOM elements
        // comments wraper
        _comments = $( '#comments' );

        // form comment
        _formComment = $( '#form-comment' );
        _taComment = $( '#ta-comment' );
        _taComment.ckeditor({ toolbar: 'BLOG', width: '95%', height: '200px', resize: false });
        _tbName = $( '#tb-name' );
        _tbEmail = $( '#tb-email' );
        _btnSubmit = $( '#btn-submit-comment' );
        _statusComment = $( '#status-comment' );
    }

    function initEvents() {
        _comments
            // delete button onclick event
            .on( 'click', '.delete', function( e  ) {
                e.preventDefault();

                var _this = $( this ),
                    _parent = _this.parent(),
                    commentId = parseInt( _parent.data( 'commentId' ), 10 ),
                    tempHTML = _parent.html();

                if ( confirm( 'Are you sure you want to delete this comment?' ) ) {
                    _parent.html( '<p>Deleting, please wait...&nbsp;<img src="/img/loading.gif" /></p>' );

                    si.ajax( '/webservices/wsBlog.asmx/deleteComment', JSON.stringify({ commentId: commentId }), function( data ) {
                        if ( data && data.d ) {
                            var msg = data.d;

                            if ( msg === 'success' ) {
                                _parent.html( '<p>The comment has been deleted.</p>' );
                                setTimeout(function() {
                                    _parent.fadeOut( 500, function() { _parent.remove(); } );
                                }, 1000 );
                            }   
                            else {
                                _parent.html( '<p>Unable to delete comment, please try again.</p>' );
                                setTimeout(function() { _parent.html( tempHTML ); }, 1000);
                            }
                        }
                        else {
                            _parent.html( '<p>Unable to delete comment, please try again.</p>' );
                            setTimeout(function() { _parent.html( tempHTML ); }, 1000);
                        }
                    }, function( err ) {
                        _parent.html( '<p>Unable to delete comment, please try again.</p>' );
                        setTimeout(function() { _parent.html( tempHTML ); }, 1000);
                    });
                }
            });

        _formComment.on( 'keydown', 'input', function( e ) {
            if ( e.keyCode === 13 ) {
                _btnSubmit.click();
            }
        });

        // btn-submit-comment onclick event
        _btnSubmit.on( 'click', function( e ) {
            e.preventDefault();
            
            // validate the form
            var isError = false,
                comment = $.trim( _taComment.val() );

            if ( comment === '' ) {
                _statusComment.html( '<p class="status-error">All fields are required.</p>' );
                _taComment.focus();
                return;
            }
                        
            _formComment.find( 'input:text' ).each(function( e ) {
                var _this = $( this ),
                    val = $.trim( _this.val() );

                if ( val === '' ) {
                    isError = true;
                    _this.addClass( 'error' );
                }
                else {
                    _this.val( val ).removeClass( 'error' );
                }
            });

            if ( isError ) {
                _statusComment.html( '<p class=""status-error"">All fields are required.</p>' );
                _formComment.find( '.error').first().focus();
            }
            else {
                _formComment.find( 'input, button' ).attr( 'disabled', 'disabled' );
                _statusComment.html( '<p>Submitting comment, please wait...&nbsp;<img src="/img/loading.gif" /></p>' );

                si.ajax( '/webservices/wsBlog.asmx/insertComment', JSON.stringify({
                    blogId: si.blogId,
                    commentBy: _tbName.val(),
                    email: _tbEmail.val(),
                    comment: _taComment.val()
                }), function( data ) {
                    if ( data && data.d ) {
                        var result = data.d;
                        
                        if ( result.indexOf( 'Error') === -1 ) {
                            var _result = $( result );
                            _formComment.before( _result );
                            
                            if ( Modernizr.csstransitions ) {
                                setTimeout( function() { _result.removeClass( 'out' ).addClass( 'in' ); }, 10 );
                            }
                            else {
                                setTimeout( function() { _result.removeClass( 'out' ).hide().fadeIn( 1000 ); }, 10 );
                            }

                            _formComment
                                .find( 'input' ).removeAttr( 'disabled' ).val( '' ).end()
                                .find( 'button' ).removeAttr( 'disabled' );
                            _taComment.val( '' );
                            _statusComment.html( '' );
                        }
                        else {
                            _formComment.find( 'input, button' ).removeAttr( 'disabled' );
                            _statusComment.html( '<p class="status-error">' + result + '</p>' );
                        }
                    }
                    else {
                        _formComment.find( 'input, button' ).removeAttr( 'disabled' );
                        _statusComment.html( '<p class="status-error">An error has occured. Please try again.</p>' );
                    }
                }, function( err ) {
                    _formComment.find( 'input, button' ).removeAttr( 'disabled' );
                    _statusComment.html( '<p class="status-error">An error has occured. Please try again.</p>' );
                });
            }
        });
    }

    $(function(){init();});
}( document, jQuery ) );