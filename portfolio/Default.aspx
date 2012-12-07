<%@ Page Title="" Language="VB" MasterPageFile="~/masterpages/default-one-col.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="portfolio_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMeta" Runat="Server">
    <title>Our Portfolio - Select Interactive - Website Development - Fort Worth, Texas</title>
    <meta name="description" content="Our projects, client list and examples of work. Innovative web developers, building a better web.">
    <meta name="keywords" content="portfolio, website development, web development, web design, interactive, select interactive, fort worth, dallas, texas">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" Runat="Server">
    <section id="gallery">
        <div class="r clearfix">
            <div class="c" data-url="http://streamrealty.com">
                <img src="/img/portfolio/gallery/stream-a.jpg" alt="Stream Realty Partners, L.P." width="159" height="150" class="in" />
                <img src="/img/portfolio/gallery/stream-b.jpg" alt="Stream Realty Partners, L.P." width="159" height="150" class="b" />
            </div>
            <div class="c lowpad" data-url="http://williamstrew.com">
                <img src="/img/portfolio/gallery/williamstrew-a.jpg" alt="WilliamsTrew Real Estate Services" width="159" height="150" class="in" />
                <img src="/img/portfolio/gallery/williamstrew-b.jpg" alt="WilliamsTrew Real Estate Services" width="159" height="150" class="b" />
            </div>
            <div class="c" data-url="http://sidrichardson.org">
                <img src="/img/portfolio/gallery/swrf-a.jpg" alt="Sid W. Richardson Foudnation" width="159" height="150" class="in" />
                <img src="/img/portfolio/gallery/swrf-b.jpg" alt="Sid W. Richardson Foudnation" width="159" height="150" class="b" />
            </div>
            <div class="c" data-url="http://baker-aviation.com">
                <img src="/img/portfolio/gallery/baker-aviation-a.jpg" alt="Baker Aviation" width="159" height="150"class="in" />
                <img src="/img/portfolio/gallery/baker-aviation-b.jpg" alt="Baker Aviation" width="159" height="150" class="b" />
            </div>
            <div class="c" data-url="http://jewelcharity.org">
                <img src="/img/portfolio/gallery/jewelcharity-a.jpg" alt="Jewel Charity" width="159" height="150" class="in" />
                <img src="/img/portfolio/gallery/jewelcharity-b.jpg" alt="Jewel Charity" width="159" height="150" class="b" />
            </div>
            <div class="c last" data-url="http://www.bluerockmarketing.net">
                <img src="/img/portfolio/gallery/bluerock-a.jpg" alt="BlueRock Marketing" width="159" height="150" class="in" />
                <img src="/img/portfolio/gallery/bluerock-b.jpg" alt="BlueRock Marketing" width="159" height="150" class="b" />
            </div>
            <%--<div class="c lowpad last" data-url="http://united-protective.com">
                <img src="/img/portfolio/gallery/united-protective-a.jpg" alt="United Protective Services" width="159" height="150" class="in" />
                <img src="/img/portfolio/gallery/united-protective-b.jpg" alt="United Protective Services" width="159" height="150" class="b" />
            </div>--%>
        </div>
    </section>

    <section id="projects" class="copy">
        <div class="r clearfix">
            <div id="srp" class="c">
                <article class="project clearfix">
                    <div class="c"><img src="/img/portfolio/projects/stream-realty.png" alt="Stream Realty Partners, L.P." width="125" height="59" /></div>
                    <div class="c">
                        <h3>Stream Realty Partners, L.P.</h3>
                        <div class="url"><a href="http://streamrealty.com" target="_blank">www.streamrealty.com</a></div>
                        <p>
                            In collaboration with the Stream&rsquo;s creative team, we updated Stream&rsquo;s website with a modern, simplified design.
                        </p>
                        <p>
                            Enhancements included the development of an online property database application, online contact distribution list management, a 
                            custom <a href="http://blog.streamrealty.com" target="_blank">blog interface</a>, and a mobile web app for iPhones/iPods.
                        </p>
                        <h4>Tools &mdash;</h4>
                        <p class="tags">
                            <a href="#" data-tag-id="4">HTML5</a>, <a href="#" data-tag-id="5">CSS3</a>, <a href="#" data-tag-id="1">jQuery</a>, <a href="#" data-tag-id="6" >Modernizr</a>, <a href="#" data-tag-id="3">jQueryMobile</a>, <a href="#" data-tag-id="7">ASP.NET</a>, Content Management.
                        </p>
                    </div>
                </article>
            </div>
            <div id="wt" class="c">
                <article class="project clearfix">
                    <div class="c"><img src="/img/portfolio/projects/williamstrew.png" alt="WilliamsTrew Real Estate Services" width="125" height="52" /></div>
                    <div class="c">
                        <h3> WilliamsTrew Real Estate</h3>
                        <div class="url"><a href="http://williamstrew.com" target="_blank">www.williamstrew.com</a></div>
                        <p>
                            To keep WilliamsTrew's online web services at the top of their industy, our goal has been to develop and maintain an online search engine built on top of the 
                            <a href="http://www.ntreis.net" target="_blank">NTREIS</a> property database.
                        </p>
                        <p>
                            A complete site overhaul took place in 2008 to implement full Ajax search capabilities, for quicker search results. Enhancements included the ability to browse
                            embedded Google Maps for listings within a defined, mapped area.
                        </p>
                        <h4>Tools &mdash;</h4>
                        <p class="tags">
                            <a href="#" data-tag-id="7">ASP.NET</a>, Google Maps.
                        </p>
                    </div>
                </article>
            </div>
        </div>
        <div class="r clearfix">
            <div id="swrf" class="c">
                <article class="project clearfix">
                    <div class="c"><img src="/img/portfolio/projects/swrf.png" alt="Sid W. Richardson Foundation" width="125" height="65" /></div>
                    <div class="c">
                        <h3>Sid W. Richardson Foundation</h3>
                        <div class="url"><a href="http://sidrichardson.org" target="_blank">www.sidrichardson.org</a></div>
                        <p>
                            The Sid W. Richardson Foundation staff presented us with the opportunity to redesign and redevelop their site. They wanted a site with an up-to-date look and feel to communicate a 
                            positive and professional image for the Foundation and to provide an efficient online grant application system and an option to download the Foundation&rsquo;s reports.
                        </p>
                        <p>
                            With guidance from the Foundation staff and Lawrence &amp; Associates of Fort Worth, Texas, we developed a user-friendly site with a clean, minimalistic design concept. We worked quickly to meet
                            a turnaround requirement of less than 45 days from project approval to site launch.
                        </p>
                        <h4>Tools &mdash;</h4>
                        <p class="tags">
                            <a href="#" data-tag-id="4">HTML5</a>, <a href="#" data-tag-id="5">CSS3</a>, <a href="#" data-tag-id="1">jQuery</a>, <a href="#" data-tag-id="6" >Modernizr</a>, <a href="#" data-tag-id="7">ASP.NET</a>, Content Management.
                        </p>
                    </div>
                </article>
            </div>
            <div id="jcb" class="c">
                <article class="project clearfix">
                    <div class="c"><img src="/img/portfolio/projects/jewel-charity.png" alt="Jewel Charity" width="125" height="81" /></div>
                    <div class="c">
                        <h3>Jewel Charity</h3>
                        <div class="url"><a href="http://jewelcharity.org" target="_blank">www.jewelcharity.org</a></div>
                        <p>
                            Jewel Charity was in need of an online web presence and solution for maximizing orders/donations. 
                        </p>
                        <p>
                            We worked closely with a local design studio to implement a warm, welcoming look for the organization.
                        </p>
                        <p>
                            To achieve our goal of maximizing donations, online order/donation forms were created to process transactions directly through the site vs routing visitors away to third party donation forms or web sites.
                        </p>
                        <h4>Tools &mdash;</h4>
                        <p class="tags">
                            <a href="#" data-tag-id="4">HTML5</a>, <a href="#" data-tag-id="5">CSS3</a>, <a href="#" data-tag-id="1">jQuery</a>, <a href="#" data-tag-id="7">ASP.NET</a>, Authorize.NET Online Merchant, SSL Certificate.
                        </p>
                    </div>
                </article>
            </div>
        </div>

        <div class="r clearfix">
            <div id="dt" class="c">
                <article class="project clearfix">
                    <div class="c"><img src="/img/portfolio/projects/duotype.png" alt="DuoType Studio" width="125" height="64" /></div>
                    <div class="c">
                        <h3>DuoType Studio</h3>
                        <div class="url"><a href="http://www.duotypestudio.com" target="_blank">www.duotypestudio.com</a></div>
                        <p>
                            DuoType Studio, the agency behind our branding, was established in 2012 by two creatives with a genuine passion for ﬂawlessly executed design.
                        </p>
                        <p> 
                            Ready to create their online web presence, DuoType reached out to us to develop a website that would allow them to share their excitement for design. The site would need to provide information for potential clients,
                            highlight their past work, and provide a forum (blog) for DuoType to share their experiences as they continue to work and grow as an agency.
                        </p>
                        <p>
                            After we received their design (AI files), we started work in 2 phases. Phase 1 -- implement the frontend design and work with DuoType to test all major features. Phase 2 -- implement the backend
                            management system to allow DuoType to add/edit/delete blog postings and project photos.
                        </p>
                        <h4>Tools &mdash;</h4>
                        <p class="tags">
                            <a href="#" data-tag-id="4">HTML5</a>, <a href="#" data-tag-id="5">CSS3</a>, <a href="#" data-tag-id="1">jQuery</a>, <a href="#" data-tag-id="6" >Modernizr</a>, <a href="#" data-tag-id="7">ASP.NET</a>, Content Management.
                        </p>
                    </div>
                </article>
            </div>
            <div id="br" class="c">
                <article class="project clearfix">
                    <div class="c"><img src="/img/portfolio/projects/bluerock.png" alt="BlueRock Marketing" width="125" height="25" /></div>
                    <div class="c">
                        <h3>BlueRock Marketing</h3>
                        <div class="url"><a href="http://www.bluerockmarketing.net" target="_blank">www.bluerockmarketing.nett</a></div>
                        <p>
                            BlueRock Marketing, LLC is a DFW based marketing agency that specializes in a variety of fields such as Strategy &amp; Planning, Branding, Media Buying, PR, Web, Social Media, and Events.
                        </p>
                        <p>
                            BlueRock was ready to upgrade their existing website and contacted us to redevelop it. They handled the entire design phase, so our job was easy &mdash; use their PSD files as the basis for our development.
                        </p>
                        <h4>Project Features</h4>
                        <ul class="arrow">
                            <li>Quick turnaround - less than a week from start of development to launch</li>
                            <li>CSS3 transitions to animate the images on the <a href="http://www.bluerockmarketing.net/creative/" target="_blank">Create Page</a></li>
                            <li>Dynamic sizing of pages for widescreen laptops and older desktop monitors</li>
                            <li>Minification and compression of all static files to optimize site speed and improve user experience</li>
                        </ul>
                        </p>
                        <h4>Tools &mdash;</h4>
                        <p class="tags">
                            <a href="#" data-tag-id="4">HTML5</a>, <a href="#" data-tag-id="5">CSS3</a>, <a href="#" data-tag-id="1">jQuery</a>, <a href="#" data-tag-id="6" >Modernizr</a>, <a href="#" data-tag-id="7">ASP.NET</a>.
                        </p>
                    </div>
                </article>
            </div>
        </div>

        <div class="r clearfix">
            <div id="pc" class="c">
                <article class="project clearfix">
                    <div class="c"><img src="/img/portfolio/projects/patients-connect.png" alt="PatientsConnect" width="125" height="48" /></div>
                    <div class="c">
                        <h3>PatientsConnect</h3>
                        <div class="url"><a href="http://patients-connect.com" target="_blank">www.patients-connect.com</a></div>
                        <p>
                            PatientsConnect contacted us to create an online social network that would connect people with similar illnesses and injuries together in order to provide support for each other.
                        </p>
                        <p> 
                            To create the best possible user experience, we used cutting-edge development techniques to create a rich user interface in order to give users the easiest ability to interact 
                            with others, share information and receive real-time notifications.</p>
                        <p>
                            This project required the development of both desktop and mobile devices to give users the ability to stay in contact from anywhere.
                        </p>
                        <h4>Tools &mdash;</h4>
                        <p class="tags">
                            <a href="#" data-tag-id="4">HTML5</a>, <a href="#" data-tag-id="5">CSS3</a>, <a href="#" data-tag-id="1">jQuery</a>, <a href="#" data-tag-id="6" >Modernizr</a>, <a href="#" data-tag-id="3">jQueryMobile</a>, <a href="#" data-tag-id="7">ASP.NET</a>, Content Management.
                        </p>
                    </div>
                </article>
            </div>
            <div id="adoptalert" class="c">
                <article class="project clearfix">
                    <div class="c"><img src="/img/portfolio/projects/adopt-alert.png" alt="Adopt Alert" width="125" height="40" /></div>
                    <div class="c">
                        <h3>Adopt Alert</h3>
                        <div class="url"><a href="https://www.adoptalert.com">www.adoptalert.com</a></div>
                        <p>Adopt Alert, a new company in Houston, TX, provides vital information to adoption agencies and families to use throughout the adoption process.</p>
                        <p>
                            We were contacted by Adopt Alert and their design team, <a href="http://www.designatwork.com" target="_blank">Design At Work</a>, to turn their idea into an online web 
                            community. The site features many front-end landing pages detailing Adopt Alert&rsquo;s objectives and features.
                        </p>
                        <p>
                            The development process included the implementation of entry and search forms to interact with Adopt Alert&rsquo;s database. To achieve optimal speed and user experience, 
                            we used jQuery ajax requests to return compressed data, processed on our web server.
                        </p>
                        <h4>Tools &mdash;</h4>
                        <p class="tags">
                            <a href="#" data-tag-id="4">HTML5</a>, <a href="#" data-tag-id="5">CSS3</a>, <a href="#" data-tag-id="1">jQuery</a>, <a href="#" data-tag-id="6" >Modernizr</a>, <a href="#" data-tag-id="3">jQueryMobile</a>, <a href="#" data-tag-id="7">ASP.NET</a>, Authorize.NET Online Merchant, SSL Certificate.
                        </p>
                    </div>
                </article>
            </div>
        </div>
        <div class="r clearfix">
            <div id="tcc" class="c">
                <article class="project clearfix">
                    <div class="c"><img src="/img/portfolio/projects/tcc.png" alt="Trammell Crow Center" width="125" height="22" /></div>
                    <div class="c">
                        <h3>Trammell Crow Center</h3>
                        <div class="url"><a href="http://www.trammellcrowcenter.com" target="_blank">www.trammellcrowcenter.com</a></div>
                        <p>
                            Designed by <a href="http://www.streamrealty.com/dallas" target="_blank">Stream Realty Dallas</a>, our job was to quickly implement the design into a cross platform, cross browser website. Interactive
                            features include a photo gallery of both interior and exterior pictures, an up-to-date stacking plan of suite availabilities, and a corporate concierge ticket order form.
                        </p>
                        <p>
                            Development time for both desktop and mobile was 3 weeks from artwork approval to project launch.
                        </p>
                        <p>
	                        For the first time in a live project, we used <a href="http://borismus.github.com/device.js/" target="_blank">device.js</a> to redirect users on mobile devices based on the dimensions of the device rather than server side device detection.
                        </p>
                        <h4>Tools &mdash;</h4>
                        <p class="tags">
                            <a href="#" data-tag-id="4">HTML5</a>, <a href="#" data-tag-id="5">CSS3</a>, <a href="#" data-tag-id="1">jQuery</a>, <a href="#" data-tag-id="6" >Modernizr</a>, <a href="#" data-tag-id="3">jQueryMobile</a>, <a href="#" data-tag-id="7">ASP.NET</a>.
                        </p>
                    </div>
                </article>
            </div>
            <div id="bbva" class="c">
                <article class="project clearfix">
                    <div class="c"><img src="/img/portfolio/projects/bbva.png" alt="BBVA Compass Plaza" width="125" height="33" /></div>
                    <div class="c">
                        <h3>BBVA Compass Plaza</h3>
                        <div class="url"><a href="http://www.bbvacompassplaza.com" target="_blank">www.bbvacompassplaza.com</a></div>
                        <p>
                            To complete this project we worked closely with <a href="http://www.streamrealty.com/houston" target="_blank">Stream Realty Houston</a>. Their marketing team provided approved artwork (Adobe Illustrator files) from both BBVA Compass and the 
                            Redstone Companies. We used the provided AI files as our blueprint for site development.
                        </p>
                        <p>
                            To create the splash page and page title animations, we used CSS3 Transitions in browsers that support them and fallback to jQuery fade in/out for older browsers.
                        </p>
                        <p>
                            With a fixed width design in place, we needed to create a solution for mobile devices. We were able to accomplish this by using the jQuery Mobile framework. We took the same content from the desktop version and dropped it into our mobile layout 
                            to create a fully functional mobile site for phones and tablets!
                        </p>
                        <h4>Tools &mdash;</h4>
                        <p class="tags">
                            <a href="#" data-tag-id="4">HTML5</a>, <a href="#" data-tag-id="5">CSS3</a>, <a href="#" data-tag-id="1">jQuery</a>, <a href="#" data-tag-id="6" >Modernizr</a>, <a href="#" data-tag-id="3">jQueryMobile</a>, <a href="#" data-tag-id="7">ASP.NET</a>.
                        </p>
                    </div>
                </article>
            </div>
        </div>
        <div class="r clearfix">
            <div class="c">
                <article class="project clearfix">
                    <div class="c"><img src="/img/portfolio/projects/oilgas-startelegram.png" alt="Oil & Gas/Star-Telegram Building" width="125" height="90" /></div>
                    <div class="c">
                        <h3>Oil &amp; Gas/Star-Telgram Building</h3>
                        <div class="url"><a href="http://www.oilgas-startelegram.com" target="_blank">www.oilgas-startelegram.com</a></div>
                        <p>With the marketing team of <a href="http://www.streamrealty.com/dallas/" target="_blank">Stream Realty Dallas</a>, we quickly implemented a design update and new content branding for the Oil &amp; Gas/Star-Telegram Building (previously known as the Oil & Gas Commerce Building).</p>
                        <p>The updates included a new logo, media, copy, and design modifications.</p>
                        <p>Along with these updates, we also reenngineered the website’s code base. The original project was developed 3 years ago and the code had become somewhat outdated. We upgraded the site to HTML5 and current web standards to provide better cross platform, cross browser support. We also moved the site to a new server that supports Gzip compression and optimized caching for faster site performance and download times.</p>
                        <h4>Tools &mdash;</h4>
                        <p class="tags">
                            <a href="#" data-tag-id="4">HTML5</a>, <a href="#" data-tag-id="5">CSS3</a>, <a href="#" data-tag-id="1">jQuery</a>, <a href="#" data-tag-id="6" >Modernizr</a>.
                        </p>
                    </div>
                </article>
            </div>
            <div class="c">
                <article class="project clearfix">
                    <div class="c"><img src="/img/portfolio/projects/lenox-towers.png" alt="Lenox Towers" width="125" height="73" /></div>
                    <div class="c">
                        <h3>Lenox Towers</h3>
                        <div class="url"><a href="http://www.lenoxtowersbuckhead.com" target="_blank">www.lenoxtowersbuckhead.com</a></div>
                        <p>Branded and designed by <a href="http://www.streamrealty.com/atlanta/">Stream Realty Atlanta</a>, we needed to quickly implement the artwork into a website. Accomplished in under 48 hours, we went from a blank canvas to a launched project! Our fastest turnaround yet!</p>
                        <p>Development included implemention of a custom Google Site Search and a custom search form to &ldquo;Find the Perfect Suite&rdquo; by searching current availabilities of the property.</p>
                        <h4>Tools &mdash;</h4>
                        <p class="tags">
                            <a href="#" data-tag-id="4">HTML5</a>, <a href="#" data-tag-id="5">CSS3</a>, <a href="#" data-tag-id="1">jQuery</a>, <a href="#" data-tag-id="6" >Modernizr</a>, <a href="#" data-tag-id="7">ASP.NET</a>.
                        </p>
                    </div>
                </article>
            </div>
        </div>
        <div class="r clearfix">
            <div id="sp" class="c">
                <article class="project clearfix">
                    <div class="c"><img src="/img/portfolio/projects/satellite-place.png" alt="Satellite Place" width="125" height="60" /></div>
                    <div class="c">
                        <h3>Satellite Place</h3>
                        <div class="url"><a href="http://satellite-place.com" target="_blank">www.satellite-place.com</a></div>
                        <p>
                            Designed by <a href="http://streamrealty.com/atlanta/" target="_blank">Stream Realty Atlanta</a>, our objective was to efficiently implement the provided design along with an 
                            interactive amenities map. Connected to Stream Realty&rsquo;s property database, the site loads real-time availabilities and suite information.
                        </p>
                        <h4>Tools &mdash;</h4>
                        <p class="tags">
                            <a href="#" data-tag-id="4">HTML5</a>, <a href="#" data-tag-id="5">CSS3</a>, <a href="#" data-tag-id="1">jQuery</a>, <a href="#" data-tag-id="6" >Modernizr</a>, <a href="#" data-tag-id="3">jQueryMobile</a>, Google Maps.
                        </p>
                    </div>
                </article>
            </div>
            <div id="peachtree" class="c">
                <article class="project clearfix">
                    <div class="c"><img src="/img/portfolio/projects/peachtree.png" alt="34 Peachtree" width="125" height="46" /></div>
                    <div class="c">
                        <h3>34 Peachtree</h3>
                        <div class="url"><a href="http://34peachtree.com" target="_blank">www.34peachtree.com</a></div>
                        <p>
                            <p>
                            Designed by <a href="http://streamrealty.com/atlanta/" target="_blank">Stream Realty Atlanta</a>, we needed to quickly implement the design along with an interactive amenities 
                            map. Connected to Stream Realty&rsquo;s property database, the site loads real-time availabilities and suite information.
                        </p>
                        </p>
                        <h4>Tools &mdash;</h4>
                        <p class="tags">
                            <a href="#" data-tag-id="4">HTML5</a>, <a href="#" data-tag-id="5">CSS3</a>, <a href="#" data-tag-id="1">jQuery</a>, <a href="#" data-tag-id="6" >Modernizr</a>.
                        </p>
                    </div>
                </article>
            </div>
        </div>
        <div class="r clearfix">
            <div id="baker-aviation" class="c">
                <article class="project clearfix">
                    <div class="c"><img src="/img/portfolio/projects/baker-aviation.png" alt="Baker Aviation" width="125" height="38" /></div>
                    <div class="c">
                        <h3>Baker Aviation</h3>
                        <div class="url"><a href="http://baker-aviation.com" target="_blank">www.baker-aviation.com</a></div>
                        <p>
                            Our main objective for Baker Aviation was to provide an aesthetically appealing, easy-to-navigate web experience for end users.
                        </p>
                        <p>
                            
                        </p>
                        <h4>Tools &mdash;</h4>
                        <p class="tags">
                            <a href="#" data-tag-id="4">HTML5</a>, <a href="#" data-tag-id="5">CSS3</a>, <a href="#" data-tag-id="1">jQuery</a>, <a href="#" data-tag-id="6" >Modernizr</a>. 
                        </p>
                    </div>
                </article>
            </div>
            <div id="ups" class="c">
                <article class="project clearfix">
                    <div class="c"><img src="/img/portfolio/projects/united-protective.png" alt="United Protective Services" width="125" height="109" /></div>
                    <div class="c">
                        <h3>United Protective Services</h3>
                        <div class="url"><a href="http://united-protective.com" target="_blank">www.united-protective.com</a></div>
                        <p>
                            Our goal was to modernize the look of United Protective Services&rsquo; website and provide prospective client and employee inquiry capabilities.
                        </p>
                        <h4>Tools &mdash;</h4>
                        <p class="tags">
                            <a href="#" data-tag-id="4">HTML5</a>, <a href="#" data-tag-id="5">CSS3</a>, <a href="#" data-tag-id="1">jQuery</a>, Custom jQuery Plugins, <a href="#" data-tag-id="7">ASP.NET</a>, Content Management.
                        </p>
                    </div>
                </article>
            </div>
        </div>
        <div class="r clearfix">
            <div id="historic-fw" class="c">
                <article class="project clearfix">
                    <div class="c"><img src="/img/portfolio/projects/historic-fw.png" alt="Historic Fort Worth" width="125" height="43" /></div>
                    <div class="c">
                        <h3>Historic Fort Worth</h3>
                        <div class="url"><a href="http://historicfortworth.org" target="_blank">www.historicfortworth.org</a></div>
                        <p>
                            We were approached by Historic Fort Worth to create an online web presence that allows for users to submit donations, shop for historic collector&rsquo;s items and search a 
                            managed database of historic properties.
                        </p>
                        <h4>Tools &mdash;</h4>
                        <p class="tags">
                            <a href="#" data-tag-id="7">ASP.NET</a>, DotNetNuke CMS, E-Commerce, PayPal Online Merchant.
                        </p>
                    </div>
                </article>
            </div>
            <div id="camp-fire" class="c">
                <article class="project clearfix">
                    <div class="c"><img src="/img/portfolio/projects/camp-fire.png" alt="Camp Fire FW" width="125" height="83" /></div>
                    <div class="c">
                        <h3>Camp Fire Fort Worth</h3>
                        <div class="url"><a href="http://campfirefw.org" target="_blank">www.campfirefw.org</a></div>
                        <p>
                            To help Camp Fire FW keep their site up to date at all times, we created a fully customized content management system. The goal was to give them the ability to add pages, content,
                            events and photos the moment they needed to.
                        </p>
                        <h4>Tools &mdash;</h4>
                        <p class="tags">
                            <a href="#" data-tag-id="7">ASP.NET</a>, DotNetNuke CMS.
                        </p>
                    </div>
                </article>
            </div>
        </div>
        <div class="r clearfix">
            <div id="lal" class="c">
                <article class="project clearfix">
                    <div class="c"><img src="/img/portfolio/projects/lewis-and-lambert.png" alt="Lewis & Lambert" width="125" height="45" /></div>
                    <div class="c">
                        <h3>Lewis &amp; Lambert Duct</h3>
                        <div class="url"><a href="http://lewisandlambertduct.com" target="_blank">www.lewisandlambertduct.com</a></div>
                        <p>
                            Designed by <a href="http://bluerockmarketing.net" target="_blank">BlueRock Marketing</a>, our task was to quickly implement the design from PSD to HTML. Along with the website, 
                            we were also tasked with creating a HTML email to send out announcing the launch of the project.                            
                        </p>
                        <h4>Tools &mdash;</h4>
                        <p class="tags">
                            <a href="#" data-tag-id="4">HTML5</a>, <a href="#" data-tag-id="5">CSS3</a>, <a href="#" data-tag-id="6">Modernizr</a>, <a href="#" data-tag-id="1">jQuery</a>, <a href="#" data-tag-id="7">ASP.NET</a>.
                        </p>
                    </div>
                </article>
            </div>
            <div id="tld" class="c">
                <article class="project clearfix">
                    <div class="c"><img src="/img/portfolio/projects/tld.png" alt="Texas Legal Docs" width="125" height="69" /></div>
                    <div class="c">
                        <h3>Texas Legal Docs</h3>
                        <div class="url"><a href="http://texaslegaldocs.com" target="_blank">www.texaslegaldocs.com</a></div>
                        <p>
                            With the desire to provide cost-effective, customized legal documents specifically for residents of the state of Texas, Texas Legal Docs contacted us to develop an easy-to-use
                            online storefront. To meet this goal, we developed an interactive site providing real-time communication between Texas Legal Docs and their clients.
                        </p>
                        <h4>Tools &mdash;</h4>
                        <p class="tags">
                            <a href="#" data-tag-id="4">HTML5</a>, <a href="#" data-tag-id="5">CSS3</a>, <a href="#" data-tag-id="1">jQuery</a>, <a href="#" data-tag-id="7">ASP.NET</a>, E-Commerce, Authorize.NET Online Merchant, SSL Certificate.
                        </p>
                    </div>
                </article>
            </div>
        </div>
        <div class="r clearfix">
            <div id="braswell" class="c">
                <article class="project clearfix">
                    <div class="c"><img src="/img/portfolio/projects/braswell.jpg" alt="The Braswell Company" width="125" height="58" /></div>
                    <div class="c">
                        <h3>The Braswell Company</h3>
                        <div class="url"><a href="http://thebraswellcompany.com" target="_blank">www.thebraswellcompany.com</a></div>
                        <p>
                            While rebranding itself, The Braswell Company asked us to create a new website illustrating the tremendous work of home builder, Bryan Braswell. To accomplish this goal, we used 
                            high quality photographs of his work for page backgrounds throughout the site.
                        </p>
                        <h4>Tools &mdash;</h4>
                        <p class="tags">
                            <a href="#" data-tag-id="4">HTML5</a>, <a href="#" data-tag-id="5">CSS3</a>, <a href="#" data-tag-id="1">jQuery</a>, <a href="#" data-tag-id="7">ASP.NET</a>.
                        </p>
                    </div>
                </article>
            </div>
            <div id="ctq" class="c">
                <article class="project clearfix">
                    <div class="c"><img src="/img/portfolio/projects/cross-timbers.png" alt="Cross Timbers Quail Coalition" width="125" height="119" /></div>
                    <div class="c">
                        <h3>Cross Timbers Quail Coalition</h3>
                        <div class="url"><a href="http://www.crosstimbersquail.org" target="_blank">www.crosstimbersquail.org</a></div>
                        <p>
                            A Texas Chapter of the Quail Coalition, Cross Timbers Quail was in need of an online web presence for members and interested parties. The primary goal was to provide a 
                            user-friendly experience, allowing visitors quick access to organization information and events.
                        </p>
                        <h4>Tools &mdash;</h4>
                        <p class="tags">
                            <a href="#" data-tag-id="5">CSS3</a>, <a href="#" data-tag-id="1">jQuery</a>, <a href="#" data-tag-id="7">ASP.NET</a>.
                        </p>
                    </div>
                </article>
            </div>
        </div>
    </section>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cphJS" Runat="Server">
    <script defer src="/js/si/si.portfolio.v-1.0.min.js"></script>
</asp:Content>