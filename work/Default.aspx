<%@ Page Title="" Language="VB" MasterPageFile="~/masterpages/default-one-col.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="work_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMeta" Runat="Server">
    <title>What We Do - Website Development & Innovative Web Application Development - Select Interactive</title>
    <meta name="description" content="Select Interactive offers web design and development, mobile site development, web application development and content management.">
    <meta name="keywords" content="servies, our work, website development, web development, web design, interactive, select interactive, fort worth, dallas, texas">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" Runat="Server">
    <section class="r pg-two-col clearfix">
        <div class="c f copy">
            <%--<asp:Literal runat="server" ID="ltrlWorkCopy" />--%>
            <h2>Make Your Business Count.</h2>
            <p>
                It&rsquo;s estimated that up to 50 percent of visitors to landing pages will bail in the first eight seconds. It&rsquo;s our job to make those seconds count. How do we accomplish
                this for you? By creating a site that engages visitors from the very beginning &mdash; a site that&rsquo;s visually appealing, highly functional and clearly communicates what your
                services are all about.
            </p>
            <h3>Web Applications</h3>
            <p>
                Not only <em>websites</em> &ndash; we develop <strong>web applications</strong>, software that runs online in a web browser, to help businesses function better and more efficiently.
            </p>
            <h3>Be Mobile</h3>
            <p>
                Today, everything is going mobile. Everyone has a smartphone or a tablet or both! So obviously, your site needs to be fully functional on these devices. We develop websites using a technique 
                called responsive web design. That is, your site design will respond to the device accessing it and present itself as necessary for maximum usability.
            </p>
            <h3>Search Engine Optimization (SEO)</h3>
            <p>
                In order to get your brand and product more attention, it&rsquo;s important that people can find you when they search the web. That&rsquo;s why with every website, we include optimal SEO best practices to help prospective clients discover your business online.
            </p>
            <h3>Content Management</h3>
            <p class="nm">
                Does your site need to be kept up-to-date at a moment&rsquo;s notice? We can provide you with a custom Content Management System (CMS) designed uniquely for you. No need to email content updates
                or call for changes. Our goal is to provide you the tools to be successful, with or without our input.
            </p>
            <div id="process">
                <div class="r clearfix">
                    <div class="c">
                        <span class="process strategize"></span>
                        <h4>Strategize</h4>
                        Discuss Your Idea.<br />
                        Product Analysis.<br />
                        Market Research.<br />
                        Build a Strategy.
                    </div>
                    <div class="c">
                        <span class="process innovate"></span>
                        <h4>Innovate</h4>
                        Design for Audience.<br />
                        Implement Strategy.<br />
                        Test. Test. Test.
                    </div>
                    <div class="c">
                        <span class="process launch"></span>
                        <h4>Publish</h4>
                        Client Review.<br />
                        Launch.<br />
                        Celebrate.
                    </div>
                    <div class="c">
                        <span class="process results"></span>
                        <h4>See Results</h4>
                        Watch Progress.<br />
                        Evaluate Feedback.<br />
                        Enhance as Needed.
                    </div>
                </div>
            </div>
        </div>
        <div class="c">
            <aside>
                <%--<asp:Literal runat="server" ID="ltrlWorkEmailDesc" />--%>
                <h4>Email Hosting</h4>
                <p class="nm">
                    E-mail, an integral business tool, allows you to communicate efficiently with your associates and clients with the touch of a button. To minimize all security risks, 
                    Select Interactive e-mail hosting offers the highest quality SPAM and virus filters available.
                </p>
            </aside>
            <aside>
                <h4>Contact Us</h4>
                <p>
                    <span class="contact phone"></span>817-810-0021<br />
                    <span class="contact twitter"></span><a href="http://twitter.com/sel_interactive" target="_blank">@Sel_Interactive</a>
                </p>
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
    <script defer src="/js/si/si.util.v-1.0.min.js"></script>
    <asp:Literal runat="server" ID="ltlrJS" />
</asp:Content>