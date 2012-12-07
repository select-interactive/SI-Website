<%@ Page Title="" Language="VB" MasterPageFile="~/masterpages/default-one-col.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="login_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMeta" Runat="Server">
    <title>Select Interactive Employee Login</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" Runat="Server">    
    <form id="form-login" class="form">
        <h2>Employee Login</h2>
        <div class="r">
            <label for="tb-username">Username</label>
            <input type="text" id="tb-username" />
        </div>
        <div class="r">
            <label for="tb-password">Password</label>
            <input type="password" id="tb-password" />
        </div>
        <div class="r">
            <input type="checkbox" id="cb-remember" /><label for="cb-remember" class="cb">Remember me</label>
        </div>
        <div class="r">
            <input type="submit" id="btn-login" value="Login" />
        </div>
        <div id="status-login" class="status"></div>
    </form>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cphJS" Runat="Server">
    <script defer src="/js/si/si.login.v-1.0.min.js"></script>
</asp:Content>