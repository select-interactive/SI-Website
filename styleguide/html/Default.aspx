<%@ Page Title="" Language="VB" MasterPageFile="~/masterpages/default-one-col.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="styleguide_html_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMeta" Runat="Server">
    <title>Select Interactive HTML Style Guide</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" Runat="Server">
    <section class="r pg-two-col clearfix">
        <div class="c f copy">
            <h2>Select Interactive HTML Style Guide</h2>
            <h3>Background</h3>
            <p>This document defines formatting and style rules for HTML. It aims to improve project collaboration and code quality.</p>
            <div class="style-section" id="general">
                <h4>General Formatting Rules</h4>
                <div class="style-topic first">
                    <h5>Indentation</h5>
                    <p>Indent by 4 spaces at a time - use tab.</p>
                    <pre class="good">&lt;ul&gt;<br />&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;Great&lt;/li&gt;<br />&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;Awesome&lt;/li&gt;<br />&lt;/ul&gt;</pre>
                    <pre class="bad">&lt;ul&gt;<br />&lt;li&gt;Great&lt;/li&gt;<br />&lt;li&gt;Awesome&lt;/li&gt;<br />&lt;/ul&gt;</pre>
                </div>
                <div class="style-topic">
                    <h5>Capitalization</h5>
                    <p>All code has to be lower case -- element names, attributes, attribute values, selectors, properties, and property values (except for strings).</p>
                    <pre class="good">&lt;img src="myimg.jpg" alt="My Image" /&gt;</pre>
                    <pre class="bad">&lt;IMG SRC="myimg.jpg" ALT="My Image" /&gt;</pre>
                </div>
                <div class="style-topic">
                    <h5>General Line Formatting</h5>
                    <p>Use a new line entry for every block, list, or table element. Indent every such child element. Do not put inline elements (span, a, em, etc...) on a new line.</p>
                    <pre class="good">&lt;div&gt;<br />&nbsp;&nbsp;&nbsp;&nbsp;&lt;p&gt;This is the &lt;em&gt;best&lt;/em&gt website!&lt;/p&gt;<br />&nbsp;&nbsp;&nbsp;&nbsp;&lt;ul&gt;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;It is awesome!&lt;/li&gt;<br />&nbsp;&nbsp;&nbsp;&nbsp;&lt;/ul&gt;<br />&lt;/div&gt;</pre>
                    <pre class="bad">&lt;div&gt;&lt;p&gt;This is the &lt;em&gt;best&lt;/em&gt website!&lt;/p&gt;&lt;ul&gt;&lt;li&gt;It is awesome!&lt;/li&gt;&lt;/ul&gt;&lt;/div&gt;</pre>
                </div>
            </div>
            <div class="style-section" id="html-style">
                <h4>HTML Style Rules</h4>
                <div class="style-topic first">
                    <h5>Document Type</h5>
                    <p>Use HTML5</p>
                    <pre class="good no-mrg">&lt;!doctype html&gt;</pre>
                </div>
                <div class="style-topic">
                    <h5>Semantics</h5>
                    <p>Use HTML according to its purpose. Use elements for what they are created for. For example, heading elements for headings, p elements for paragraphs, a elements for anchors, etc...</p>
                    <p>Using HTML according to its purpose is important for accessibility, reuse, and code efficiency.</p>
                    <pre class="good">&lt;a href="/about/"&gt;About Us&lt;/a&gt;</pre>
                    <pre class="bad">&lt;div onclick="loadAboutUs();"&gt;About Us&lt;/div&gt;</pre>
                </div>
                <div class="style-topic">
                    <h5>Multimedia Fallback</h5>
                    <p>Provide alternate contents for multimedia. For multimedia such as images, videos, and canvas objects, make sure to offer alternative access. For images, use meaningful alternative text for the alt attribute.</p>
                    <p>Providing alternative content is important for accessibility reasons as well as SEO reasons.</p>
                    <pre class="good">&lt;img src="spreadsheet.png" alt="Spreadsheet screenshot" /&gt;</pre>
                    <pre class="bad">&lt;img src="spreadsheet.png" /&gt;</pre>
                </div>
                <div class="style-topic">
                    <h5>Type Attributes</h5>
                    <p>Omit type attributes for style sheets and scripts.</p>
                    <pre class="good">&lt;link rel="stylesheet" href="/css/styles.css"&gt;<br />&lt;script src="/js/myscript.js"&gt;&lt;/script&gt;</pre>
                    <pre class="bad">&lt;link rel="stylesheet" type="text/css" href="/css/styles.css"&gt;<br />&lt;script text="text/javascript" src="/js/myscript.js"&gt;&lt;/script&gt;</pre>
                </div>
                <div class="style-topic">
                    <h5>Separate Style from Presentation</h5>
                    <p>Keep structure (markup - HTML), presentation (CSS), and behavior (scripts) separate. Make sure your markup only contains HTML without any inline styles or scripts.</p>
                    <pre class="good">&lt;div class="error"&gt;Alert! All fields are required.&lt;/div&gt;</pre>
                    <pre class="bad">&lt;div style="border: 1px solid red; color: red;&gt;Alert! All fields are required.&lt;/div&gt;</pre><br />
                    <pre class="good">&lt;button id="btn-submit"&gt;Submit&lt;/button&gt;<br />&lt;script src="/js/myhandler.js"&gt;&lt/script&gt;</pre>
                    <pre class="bad">&lt;button onclick="alert("Hello World!");"&gt;Submit&lt;/button&gt;</pre>
                </div>
            </div>
            <div class="style-section" id="other">
                <h4>Other Style Rules</h4>
                <div class="style-topic first">
                    <h5>Protocol</h5>
                    <p>Omit the protocol (http:, https:) from embeded resources. Omitting the protocol—which makes the URL relative—prevents mixed content issues and results in minor file size savings.</p>
                    <pre class="good">&lt;script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"&gt;&lt;/script&gt;</pre>
                    <pre class="bad">&lt;script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"&gt;&lt;/script&gt;</pre>
                </div>
                <div class="style-topic">
                    <h5>Encoding</h5>
                    <p>Specify the encoding in HTML templates and documents to utf-8. Make sure your editor uses UTF-8 as character encoding, without a byte order mark.</p>
                    <pre class="good no-mrg">&lt;meta charset="utf-8"&gt;</pre>
                </div>
                <div class="style-topic">
                    <h5>TODO/Action Items</h5>
                    <p>Mark todos and action items with TODO.</p>
                    <pre class="good no-mrg">&lt;!-- TODO: Get copy from client --&gt;<br />&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit.&lt;/p&gt;</pre>
                </div>
            </div>
        </div>
        <div class="c">
            <aside>
                <h4>In This Document</h4>
                <ul>
                    <li><a href="#general">General Formatting Rules</a></li>
                    <li><a href="#html-style">HTML Style Rules</a></li>
                    <li><a href="#other">Other Style Rules</a></li>
                </ul>
            </aside>
            <aside>
                <h4>Style Guides</h3>
                <ul>
                    <li><a href="/styleguide/html/">HTML</a></li>
                    <li><a href="/styleguide/css/">CSS</a></li>
                    <li><a href="/styleguide/js/">JS</a></li>
                </ul>
            </aside>
        </div>
    </section>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cphJS" Runat="Server">
</asp:Content>