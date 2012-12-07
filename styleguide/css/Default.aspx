<%@ Page Title="" Language="VB" MasterPageFile="~/masterpages/default-one-col.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="styleguide_css_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMeta" Runat="Server">
    <title>Select Interactive CSS Style Guide</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" Runat="Server">
    <section class="r pg-two-col clearfix">
        <div class="c f copy">
            <h2>Select Interactive CSS Style Guide</h2>
            <h3>Background</h3>
            <p>This document defines formatting and style rules for CSS. It aims to improve project collaboration and code quality.</p>
            <div class="style-section" id="general">
                <h4>General Formatting Rules</h4>
                <div class="style-topic first">
                    <h5>Declaration Order</h5>
                    <p>Put declarations in alphabetical order to achieve consistent code in a manner that is easy to remember and maintain.</p>
                    <pre class="good">#my-elem {<br />&nbsp;&nbsp;&nbsp;&nbsp;background: #fff;<br />&nbsp;&nbsp;&nbsp;&nbsp;border: 1px solid red;<br />&nbsp;&nbsp;&nbsp;&nbsp;color: #222;<br />&nbsp;&nbsp;&nbsp;&nbsp;margin: 0 auto;<br />&nbsp;&nbsp;&nbsp;&nbsp;padding: 20px;<br />&nbsp;&nbsp;&nbsp;&nbsp;width: 500px;<br />}</pre>
                </div>
                <div class="style-topic">
                    <h5>Whitespace</h5>
                    <p>Indent by 4 spaces at a time - use tab.</p>
                    <p>Space between braces and propertiess. No space between property and colon. Space after colon, before property value. No space between property value and semicolon.</p>
                    <pre class="good">html { height: 100%; overflow: auto; width: 100%; }<br />body {<br />&nbsp;&nbsp;&nbsp;&nbsp;background: #fff;<br />&nbsp;&nbsp;&nbsp;&nbsp;color: #222;<br />&nbsp;&nbsp;&nbsp;&nbsp;margin: 0;<br />}</pre>
                    <pre class="bad">body{<br />background:#fff;<br />color:#222;<br />margin : 0;<br />}</pre>
                </div>
                <div class="style-topic">
                    <h5>Capitalization</h5>
                    <p>All code has to be lower case -- tags, properties, values, selectors, etc...</p>
                    <pre class="good">body { background: red; color: white; }</pre>
                    <pre class="bad">BODY { BACKGROUND: RED; COLOR: WHITE; }</pre>
                </div>
                <div class="style-topic">
                    <h5>Block Content Indentation</h5>
                    <p>Indent all block content, rules within rules, to reflect hierarchy and help understanding.</p>
                    <pre class="good">@media screen and (max-width: 480px) {<br />&nbsp;&nbsp;&nbsp;&nbsp;.column {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;float: none;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;width: 100%;<br />&nbsp;&nbsp;&nbsp;&nbsp;}<br />}</pre>
                </div>
                <div class="style-topic">
                    <h5>Comments</h5>
                    <p>Comment style should be simple and consistent throughout the code base.</p>
                    <ul class="arrow">
                        <li>Place comments on a new line above their subject</li>
                        <li>Make liberal use of comments to break CSS code into sections</li>
                    </ul>
                    <pre class="good">/** Style Guide<br />&nbsp;------------------------------*/<br /><br />/* My Comment */</pre>
                </div>
                <div class="style-topic">
                    <h5>Type Selectors</h5>
                    <p>Avoid qualifying ID and class names with type selectors unless absolutely necessary.</p>
                    <pre class="good">#example { }<br />.error { }</pre>
                    <pre class="bad">ul#example { }<br />div.error { }</pre>
                </div>
                <div class="style-topic">
                    <h5>Shorthand Properties</h5>
                    <p>Use shorthand properties where possible.</p>
                    <pre class="good">margin: 10px auto; padding: 20px;</pre>
                    <pre class="bad">margin-top: 10px;<br />margin-right: auto;<br />margin-bottom: 10px;<br />margin-left: auto;<br />padding: 20px 20px 20px 20px;</pre>
                </div>
                <div class="style-topic">
                    <h5>0 Units and Leading 0s</h5>
                    <p>Omit unit specification after 0 values. Omit leading 0s in values</p>
                    <pre class="good">font-size: .8em;<br />margin: 0;<br />padding: 0;</pre>
                    <pre class="bad">font-size: 0.8em;<br />margin: 0px;<br />padding: 0px;</pre>
                </div>
            </div>
            <div class="style-section" id="naming">
                <h4>Naming Conventions</h4>
                <div class="style-topic first">
                    <h5>ID and Class Naming</h5>
                    <p>Use meaningful or generic ID and class names. Always use ID and class names that reflect the purpose of hte element.</p>
                    <pre class="good">/* Specific */<br />#gallery { }<br />#login { }<br />.col { }<br /><br />/* Generic */<br />.alt { }<br />.side-bar { }</pre>
                    <pre class="bad">/* Meaningless */<br />#aa-10 { }<br /><br />/* Presentational */<br />.button-red { }<br />.clear { }</pre>
                </div>
                <div class="style-topic">
                    <h5>ID and Class Name Style</h5>
                    <p>Use ID and class names that are as short as possible, but as long as necessary. Try to convey the meaning of the element while being as brief as possible.</p>
                    <pre class="good">#nav { }<br />.author {}</pre>
                    <pre class="bad">#navigation { }<br />.atr { }</pre>
                </div>
                <div class="style-topic">
                    <h5>ID and Class Name Delimiters</h5>
                    <p>Separate words in ID and class names by a hyphen.</p>
                    <pre class="good">#video-promo { }<br />.status-error { }</pre>
                    <pre class="bad">#videopromo { }<br />.status_error { }</pre>
                </div>
            </div>
        </div>
        <div class="c">
            <aside>
                <h4>In This Document</h4>
                <ul>
                    <li><a href="#general">General Formatting Rules</a></li>
                    <li><a href="#naming">Naming Conventions</a></li>
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