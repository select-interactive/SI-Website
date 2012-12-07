(function( document, $ ) {
    window.si = window.si || {};
        
    function init() {
        // initialize the portfolio gallery
        initGallery();
    }

    function initGallery() {
        var isOldIe = $( 'html' ).is( '.oldie' ),
            gallery = $( '#gallery' ),

            cells = gallery.find( '.c' )
            
                // add overlays to each column
                .each(function() {
                    if ( !isOldIe ) {
                        var _this = $( this ),
                            _overlay = $( '<div class="overlay"></div>' );
                    
                        _overlay.html( '<span>' + _this.find( 'img' ).attr( 'alt' ) + '</span>' );
                        _this.is( '.lowpad' ) && _overlay.addClass( 'lowpad' );
                        _this.append( _overlay )

                        !Modernizr.csstransitions && _overlay.fadeOut( 0 );
                    }
                })

                // mouseover event
                .on( 'mouseenter', function() {
                    if ( !isOldIe ) {
                        cycleTimeout && clearTimeout( cycleTimeout );
                        cells.filter( '.active' ).trigger( 'mouseout' );

                        var _this = $( this ),
                            _imgA = _this.find( 'img:eq(0)' ),
                            _imgB = _this.find( 'img:eq(1)' ),
                            _over = $( this ).find( '.overlay' );

                        _this.addClass( 'active' );

                        if ( Modernizr.csstransitions ) {
                            _imgA.removeClass( 'in' );
                            _imgB.addClass( 'in' );
                            _over.addClass( 'in' );
                        }
                        else {
                            _over.fadeIn( 750 );
                        }
                    }
                })

                // mouseout event
                .on( 'mouseleave', function() {
                    if ( !isOldIe ) {
                        var _this = $( this ),
                            _imgA = _this.find( 'img:eq(0)' ),
                            _imgB = _this.find( 'img:eq(1)' ),
                            _over = $( this ).find( '.overlay' );

                        _over
                            .data( 'no-delay', 'true' )
                            .addClass( 'small-delay' );

                        _this.removeClass( 'active' );

                        if ( Modernizr.csstransitions ) {
                            _imgA.addClass( 'in' );
                            _imgB.removeClass( 'in' );
                            _over.removeClass( 'in' );
                        }
                        else {
                            _over.fadeOut( 750 );
                        }
                    }
                })

                // click event
                .on( 'click', function() {
                    var url = $( this ).data( 'url' );
                    window.open( url, '_blank' );
                }),

            // select a random cell to start with
            index = Math.floor( Math.random() * cells.length ), 
            cycleTimeout = null,
            started = false;

        // function to check the transition delay 
        // and add the delay back after an overlay 
        // has gone out of view
        function checkTransitionDelay( e ) {
            var _this = $( this );
            if ( _this.data( 'no-delay' ) === 'true' ) {
                _this
                    .data( 'no-delay', 'false' )
                    .removeClass( 'small-delay' );
            }
        }

        // if we are using css transitions, attach
        // a transition end event to check for correct delays
        Modernizr.csstransitions && 
            gallery.find( '.overlay' )
                .bind( 'webkitTransitionEnd', checkTransitionDelay )
                .bind( 'transitionend' , checkTransitionDelay );

        // function to automatically rotate throug the cells
        function rotate() {
            started ? $( cells[index] ).trigger( 'mouseout' ) : started = true;
            ++index === cells.length && ( index = 0 );
            cycleTimeout = setTimeout(function() {
                $( cells[index] ).trigger( 'mouseenter' );
                cycleTimeout = setTimeout( rotate, 4500 );
            }, 1000 );
        }

        // set initial timeout for first cell selection
        !isOldIe && ( cycleTimeout = setTimeout( rotate, 2000 ) );
    }

    $(function(){init();});
})( document, jQuery );