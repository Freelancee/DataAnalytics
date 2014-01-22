﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Site.Master" AutoEventWireup="true"
    CodeBehind="Borehole.aspx.cs" Inherits="DAnalytics.Web.Report.Borehole" %>

<%@ Register Src="../UserControls/BoreHoleChart.ascx" TagName="BoreHoleChart" TagPrefix="uc1" %>
<%@ Register Src="../UserControls/BoreHoleTree.ascx" TagName="BoreHoleTree" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/Autocomplete.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="float_div_right_wide">
        <div class="inner_content_holder">
            <div class="transcripts_details_header">
                <div class="template_head">
                    <span>Borehole</span></div>
                <div class="button_holder">
                    <asp:Button ID="btnView" runat="server" CommandName="Print" Text="View" OnClick="btnView_Click"
                        OnClientClick="return ValidateBorehole();" />
                </div>
            </div>
            <div class="cls">
            </div>
            <div class="inner_float_div">
                <uc2:BoreHoleTree ID="BoreHoleTree1" runat="server" />
            </div>
            <div class="multi_row_elements">
                <label>
                    Date From:</label>
                <asp:TextBox ID="txtDtFrom" runat="server" CssClass="input_text input_small"></asp:TextBox>
                <label>
                    Date To:</label>
                <asp:TextBox ID="txtDtTo" runat="server" CssClass="input_text input_small"></asp:TextBox>
                <label>
                    Borehole:</label>
                <asp:TextBox ID="txtSearchBoreHole" runat="server" CssClass="input_text input_small"></asp:TextBox>
                <div class="cls">
                    <input type="hidden" runat="server" id="hdnUserID" />
                    <input type="hidden" runat="server" id="hdnBoreHoleID" />
                </div>
                <%--<script language="javascript" type="text/javascript" src="../Jquery/jquery.autocomplete.js"></script>--%>
                <script language="javascript" type="text/javascript" src="../Scripts/dailyreport.js"></script>
                <script language="javascript" type="text/javascript">

                    function ValidateBorehole() {
                        if ($("[id$='hdnBoreHoleID']").val() == "0" || $("[id$='hdnBoreHoleID']").val() == "") {
                            alert("Select valid borehole");
                            return false;
                        }
                        else
                            return true;
                    }

                    function PrintReport() {
                        var From = $("[id$='txtDtFrom']").val();
                        var To = $("[id$='txtDtTo']").val();
                        var BoreHole = $("[id$='hdnBoreHoleID']").val();
                        //return CallReport("MinMaxRpt", "&From=" + From + "&To=" + To + "&BoreHole=" + BoreHole); // + "&Sort=" + SortExp);
                    }

                </script>
            </div>
            <div class="cls">
            </div>
            <div class="grid">
                <asp:GridView ID="gvBoreHole" runat="server" AutoGenerateColumns="false" Width="100%"
                    EmptyDataText="No records to display">
                    <Columns>
                        <asp:TemplateField HeaderText="Borehole">
                            <ItemTemplate>
                                <span title="Borehole">
                                    <%#Eval("BoreHoleName")%></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date and Time">
                            <ItemTemplate>
                                <span title="Reading Date and Time">
                                    <%# String.Format("{0:dd-MMM-yyyy HH:mm}", Eval("ReadingDateTime"))%></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Device">
                            <ItemTemplate>
                                <span title="DeviceID">
                                    <%#Eval("DeviceID")%></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="CH4">
                            <ItemTemplate>
                                <span title="CH4">
                                    <%#Eval("CH4")%></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="CO2">
                            <ItemTemplate>
                                <span title="CO2">
                                    <%#Eval("CO2")%></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="O2">
                            <ItemTemplate>
                                <span title="O2">
                                    <%#Eval("O2")%></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="VOC">
                            <ItemTemplate>
                                <span title="VOC">
                                    <%#Eval("VOC")%></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="H2S">
                            <ItemTemplate>
                                <span title="H2S">
                                    <%#Eval("H2S")%></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="CO">
                            <ItemTemplate>
                                <span title="CO">
                                    <%#Eval("CO")%></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Borehole Pressure">
                            <ItemTemplate>
                                <span title="Borehole Pressure">
                                    <%#Eval("Borehole_Pressure")%></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Atmospheric Pressure">
                            <ItemTemplate>
                                <span title="Atmospheric Pressure">
                                    <%#Eval("Atmospheric_Pressure")%></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Pressure Diff">
                            <ItemTemplate>
                                <span title="Pressure Diff">
                                    <%#Eval("Pressure_Diff")%></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Temperature">
                            <ItemTemplate>
                                <span title="Temperature">
                                    <%#Eval("Temperature")%></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Water Level">
                            <ItemTemplate>
                                <span title="Water Level">
                                    <%#Eval("Water_Level")%></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Battery">
                            <ItemTemplate>
                                <span title="Battery">
                                    <%#Eval("Battery")%></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="grid_header" />
                    <AlternatingRowStyle CssClass="alt" />
                </asp:GridView>
                <div class="cls">
                </div>
                <uc1:BoreHoleChart ID="BoreHoleChart1" runat="server" />
            </div>
        </div>
    </div>
</asp:Content>
