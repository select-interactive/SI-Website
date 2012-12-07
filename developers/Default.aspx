<%@ Page Title="" Language="VB" MasterPageFile="~/masterpages/default-one-col.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="developers_Default" %>
<%@ Register TagPrefix="uc" TagName="toolsAndResource" Src="~/controls/devToolsAndResources.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMeta" Runat="Server">
    <title>Select Interactive Developer Resources</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" Runat="Server">
    <section class="r pg-two-col clearfix">
        <div id="news" class="c f copy">
            <article>
                <h2>Select Interactive Developer Resources</h2>
                <p>SI developer resources will provide documentation, examples, and lists of tools and resources for modern front-end web development.</p>
                <h3 class="orange">SI Development Work Flow</h3>
                <p>There have been many new tools (boilerplates, CSS prepoccessors, frameworks, etc...) popping up in the last 3-6 months that have helped to improve development time. However, adding these items requires some changes to our development environment and workflow. Below is a list of my current development tools and workflow from initial development to project launch.</p>
                <h4>Development Tools</h4>
                <ul class="arrow">
                    <li><a href="http://www.microsoft.com/visualstudio/11/en-us" target="_blank">VS 2012 RC</a></li>
                    <li>Extensions: <a href="http://www.mindscapehq.com/products/web-workbench">Mindscape Web Workbench</a></li>
                    <li><a href="http://livereload.com/">LiveReload</a></li>
                    <li>CSS Authoring: <a href="http://www.sass-lang.com" target="_blank">SASS</a> and <a href="http://compass-style.org/" target="_blank">Compass</a></li>
                    <li>JavaScript Libraries: Modernizr, jQuery</li>
                    <li>ASP.NET 4</li>
                    <li>MS SQL Server 2008 R2</li>
                    <li>Hosting on Windows Server 2008, IIS7</li>
                    <li>Development in Google Chrome (both <a href="http://www.google.com/chrome" target="_blank">Stable</a> and <a href="https://tools.google.com/dlpage/chromesxs" target="_blank">Canary</a>) using the <a href="https://developers.google.com/chrome-developer-tools/docs/overview" target="_blank">Chrome Dev Tools</a></li>
                    <li>Adobe Photoshop &amp; Illustrator</li>
                </ul>
                <h4>Workflow</h4>
                <ul class="arrow">
                    <li><a href="https://github.com/jermbo002/SI-Project-Template" target="_blank">SI Project Boilerplate</a></li>
                    <li>Design implementation - HTML, CSS, JavaScript</li>
                    <li>Functionality implementation - JavaScipt, .NET Webservices, SQL</li>
                    <li>Iteration Workflow &amp; Performance Tuning - Browser devtools, functionality testing, UX optimization</li>
                    <li>Build &amp; Optimization - CSS &amp; JS minification, Image compression</li>
                    <li>Publish</li>
                </ul>
                <h3 class="orange">SI Style Guides</h3>
                <p>The following documents define best practice formatting and style rules for HTML, CSS, and JavaScript. These rules are in place for all Select Interactive projects to help improve collaboration and code quality.</p>
                <ul class="arrow">
                    <li><a href="/styleguide/html/">HTML Style Guide</a></li>
                    <li><a href="/styleguide/css/">CSS Style Guide</a></li>
                    <li><a href="/styleguide/js/">JavaScript Style Guide</a></li>
                </ul>
            </article>
        </div>
        <div class="c">
            <uc:toolsAndResource runat="server" ID="toolsAndResources" />
        </div>
    </section>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cphJS" Runat="Server">
</asp:Content>