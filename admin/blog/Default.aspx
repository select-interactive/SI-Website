<%@ Page Title="" Language="VB" MasterPageFile="~/masterpages/admin.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="admin_blog_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMeta" Runat="Server">
    <title>Select Interactive - Manage Blogs</title>
    <link rel="Stylesheet" href="/css/chosen-plugin/chosen.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphLeft" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cphRight" Runat="Server">
    <div id="form-options" class="form">
        <h2>Manage Blogs</h2>
        <p>You may post a new blog or edit/delte an existing one.</p>
        <button id="btn-opt-new-blog">Create a New Blog</button>
        <button id="btn-opt-edit-blog">Edit/Delete a Blog</button>
    </div>

    <div id="form-select-blog" class="form" style="display: none;">
        <h3> Select a Blog to Edit/Delete </h3>
        <div class="r">
            <select id="ddl-blogs"></select>
        </div>
        <div class="r">
            <button id="btn-edit-blog">Edit Selected Blog</button>
            <button id="btn-cancel-edit-blog">Cancel</button>
        </div>
        <div id="status-edit-blog" class="status"></div>
    </div>

    <div id="form-blog" class="form lbl-block" style="display: none;">
        <h3 id="form-blog-title">Post a New Blog</h3>
        <div class="r">
            <label for="tb-blog-title">*Blog Title:</label>
            <input type="text" id="tb-blog-title" class="req" />
        </div>
        <div class="r">
            <label for="tb-blog-description">*Meta Description <span>(No more than 155 characters)</span>:</label>
            <input type="text" id="tb-blog-description" class="req" />
        </div>
        <div class="r">
            <label for="tb-blog-keywords">*Meta Keywords <span>(No more than 10. Separate by comma)</span>:</label>
            <input type="text" id="tb-blog-keywords" class="req" />
        </div>
        <div class="r">
            <label for="tb-blog-projURL">Project URL:</label>
            <input type="text" id="tb-blog-projURL" />
        </div>
        <div class="r">
            <label for="ta-blog-body">*Blog Post:</label>
            <textarea id="ta-blog-body" name="ta-blog-body" rows="5" cols="5" class="req"></textarea>
        </div>
        <div class="r">
            <label for="ddl-blog-tags">*Tags:</label>
            <select id="ddl-blog-tags" multiple></select>
        </div>
        <div class="r">
            <label for="ddl-blog-category">*Category</label>
            <select id="ddl-blog-category"></select>
        </div>
        <div class="r">
            <input type="checkbox" id="cb-blog-is-active" checked />
            <label for="cb-blog-is-active" class="cb">Is Active</label>
        </div>
        <div class="r">
            <button id="btn-save-blog">Save Blog</button>
            <button id="btn-delete-blog">Delete Blog</button>
            <button id="btn-cancel-blog">Back</button>
            <button id="btn-preview-blog">Preview</button>
        </div>
        <div id="status-blog" class="status"></div>
    </div>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="cphJS" Runat="Server">
    <script defer src="/ckeditor/ckeditor.js"></script>
    <script defer src="/ckeditor/adapters/jquery.js"></script>
    <script defer src="/js/si/si.admin.blog.v-1.0.min.js"></script>
</asp:Content>