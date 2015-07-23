<%@ Page Title="" Language="C#" MasterPageFile="~/Styles/Site.Master" AutoEventWireup="true" CodeBehind="DetalhePAC.aspx.cs" Inherits="Medusa.PAC.Paginas.DetalhePAC" %>


<%@ Register src="../Controles/ControlePACDetalhe.ascx" tagname="ControlePACDetalhe" tagprefix="uc1" %>


<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lblMsg" runat="server"></asp:Label>
    <uc1:ControlePACDetalhe ID="ControlePACDetalhe1" runat="server" />
</asp:Content>
