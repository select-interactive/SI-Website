<%@ Page Title="" Language="VB" MasterPageFile="~/masterpages/default-one-col.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="contact_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMeta" Runat="Server">
    <title>Contact Select Interactive - Website Development - Fort Worth, Texas</title>
    <meta name="description" content="Contact the Select Interactive development team. Innovative web developers, building a better web.">
    <meta name="keywords" content="contact, website development, web development, web design, interactive, select interactive, fort worth, dallas, texas">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" Runat="Server">
    <section class="r pg-two-col clearfix">
        <div class="c f copy">
            <h2>Get in touch.</h2>
            <p>
                Select Interactive is located just west of downtown Fort Worth off of IH-30 and University on Locke Avenue between Vickery Boulevard and the access road.
            </p>
            <div id="form-contact" class="form">
                <h2>Say Hello.</h2>
                <div id="contact-opts" class="r clearfix">
                    <input type="checkbox" id="cb-ga" value="General Information." /><label class="cb" for="cb-ga">General Information.</label>
                    <input type="checkbox" id="cb-meeting" value="Request a meeting." /><label class="cb" for="cb-meeting">Request a meeting.</label>
                    <input type="checkbox" id="cb-media" value="Media Relations." /><label class="cb" for="cb-media">Media Relations.</label>
                </div>
                <div class="r">
                    <label for="tb-name">Your Name:</label>
                    <input type="text" id="tb-name" />
                </div>
                <div class="r">
                    <label for="tb-email">Your Email Address:</label>
                    <input type="text" id="tb-email" />
                </div>
                <div class="r">
                    <label for="tb-phone">Your Phone #:</label>
                    <input type="text" id="tb-phone" />
                </div>
                <div class="r">
                    <label for="ta-message">What can we do for you?</label>
                    <textarea id="ta-message"></textarea>
                </div>
                <div class="r">
                    <button id="btn-submit">Send</button>
                </div>
                <div id="status-contact" class="status"></div>
            </div>
        </div>
        <div class="c">
            <aside>
                <h4>Connect</h4>
                <p>
                    <span class="contact phone"></span>817-810-0021<br />
                    <span class="contact email"></span><a href="mailto:contact@select-interactive.com">contact@select-interactive.com</a><br />
                    <span class="contact twitter"></span><a href="http://twitter.com/sel_interactive" target="_blank">@Sel_Interactive</a><br />
                    <span class="contact fb"></span><a href="https://www.facebook.com/pages/Select-Interactive/365668433446732" target="_blank">Like Us on Facebook</a><br />
                    <span class="contact google"></span><a href="https://plus.google.com/106726509160059301827/about" target="_blank">Add Us to a Google+ Circle</a><br />
                    <span class="contact rss"></span><a href="http://feeds.feedburner.com/SelectInteractive" rel="alternate" type="application/rss+xml">Subscribe</a><br />
                    <span class="contact map"></span><a href="http://g.co/maps/529t3" target="_blank">Get Directions</a>
                </p>
                <p class="nm"><strong class="orange">Select Interactive</strong><br />3343 Locke Ave.<br />Suite 107<br />Fort Worth, TX 76107</p>
            </aside>
            <aside>
                <h4>Directory</h4>
                <h5>Jeremy Burton</h5>
                <p>
                    <span class="contact phone"></span>817-210-4303<br />
                    <span class="contact email"></span><a href="mailto:jeremy@select-interactive.com">jeremy@select-interactive.com</a>
                </p>
                <h5>Dan Harris</h5>
                <p class="nm">
                    <span class="contact phone"></span>817-810-0021<br />
                    <span class="contact email"></span><a href="mailto:danh@select-interactive.com">danh@select-interactive.com</a>
                </p>
            </aside>
        </div>
    </section>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cphJS" Runat="Server">
    <script defer src="/js/si/si.contact.v-1.0.min.js"></script>
</asp:Content>