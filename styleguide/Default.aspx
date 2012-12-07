<%@ Page Title="" Language="VB" MasterPageFile="~/masterpages/default-one-col.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="styleguide_Default" %>
<%@ Register TagPrefix="uc" TagName="toolsAndResource" Src="~/controls/devToolsAndResources.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMeta" Runat="Server">
    <title>Select Interactive CSS Style Guide</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" Runat="Server">
    <section class="r pg-two-col clearfix">
        <div class="c f copy">
            <h2>Select Interactive Developer Style Guides</h2>
            <h3>Background</h3>
            <p>The following documents define best practice formatting and style rules for HTML, CSS, and JavaScript. These rules are in place for all Select Interactive projects to help improve collaboration and code quality.</p>
            <ul class="arrow">
                <li><a href="/styleguide/html/">HTML Style Guide</a></li>
                <li><a href="/styleguide/css/">CSS Style Guide</a></li>
                <li><a href="/styleguide/js/">JavaScript Style Guide</a></li>
            </ul>
        </div>
        <div class="c">
            <uc:toolsAndResource runat="server" ID="toolsAndResources" />
        </div>
    </section>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cphJS" Runat="Server">
</asp:Content>