﻿<xsl:stylesheet xmlns:x="http://www.w3.org/2001/XMLSchema" xmlns:dsp="http://schemas.microsoft.com/sharepoint/dsp" version="1.0" exclude-result-prefixes="xsl msxsl ddwrt" xmlns:ddwrt="http://schemas.microsoft.com/WebParts/v2/DataView/runtime" xmlns:asp="http://schemas.microsoft.com/ASPNET/20" xmlns:__designer="http://schemas.microsoft.com/WebParts/v2/DataView/designer" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:SharePoint="Microsoft.SharePoint.WebControls" xmlns:ddwrt2="urn:frontpage:internal">
  <xsl:output method="html" indent="no"/>
  <xsl:decimal-format NaN=""/>
  <xsl:param name="dvt_apos">'</xsl:param>
  <xsl:param name="ManualRefresh"></xsl:param>
  <xsl:variable name="dvt_1_automode">0</xsl:variable>
  <xsl:template match="/" xmlns:x="http://www.w3.org/2001/XMLSchema" xmlns:dsp="http://schemas.microsoft.com/sharepoint/dsp" xmlns:asp="http://schemas.microsoft.com/ASPNET/20" xmlns:__designer="http://schemas.microsoft.com/WebParts/v2/DataView/designer" xmlns:SharePoint="Microsoft.SharePoint.WebControls">
    <xsl:choose>
      <xsl:when test="($ManualRefresh = 'True')">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top">
              <xsl:call-template name="dvt_1"/>
            </td>
            <td width="1%" class="ms-vb" valign="top">
              <img src="/_layouts/15/images/staticrefresh.gif" id="ManualRefresh" border="0" onclick="javascript: {ddwrt:GenFireServerEvent('__cancel')}" alt="Click here to refresh the dataview."/>
            </td>
          </tr>
        </table>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="dvt_1"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="dvt_1">
    <xsl:variable name="dvt_StyleName">ListForm</xsl:variable>
    <xsl:variable name="Rows" select="/dsQueryResponse/Rows/Row"/>
    <div>
      <span id="part1">
        <table border="0" width="100%">
          <xsl:call-template name="dvt_1.body">
            <xsl:with-param name="Rows" select="$Rows"/>
          </xsl:call-template>
        </table>
      </span>
      <SharePoint:AttachmentUpload runat="server" ControlMode="Edit"/>
      <SharePoint:ItemHiddenVersion runat="server" ControlMode="Edit"/>
    </div>
  </xsl:template>
  <xsl:template name="dvt_1.body">
    <xsl:param name="Rows"/>
    <tr>
      <td class="ms-toolbar" nowrap="nowrap">
        <table>
          <tr>
            <td width="99%" class="ms-toolbar" nowrap="nowrap">
              <IMG SRC="/_layouts/15/images/blank.gif" width="1" height="18"/>
            </td>
            <td class="ms-toolbar" nowrap="nowrap">
              <SharePoint:SaveButton runat="server" ControlMode="Edit" id="savebutton1"/>
            </td>
            <td class="ms-separator"> </td>
            <td class="ms-toolbar" nowrap="nowrap" align="right">
              <SharePoint:GoBackButton runat="server" ControlMode="Edit" id="gobackbutton1"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td class="ms-toolbar" nowrap="nowrap">
        <SharePoint:FormToolBar runat="server" ControlMode="Edit"/>
        <SharePoint:ItemValidationFailedMessage runat="server" ControlMode="Edit"/>
      </td>
    </tr>
    <xsl:for-each select="$Rows">
      <xsl:call-template name="dvt_1.rowedit"/>
    </xsl:for-each>
    <tr>
      <td class="ms-toolbar" nowrap="nowrap">
        <table>
          <tr>
            <td class="ms-descriptiontext" nowrap="nowrap">
              <SharePoint:CreatedModifiedInfo ControlMode="Edit" runat="server"/>
            </td>
            <td width="99%" class="ms-toolbar" nowrap="nowrap">
              <IMG SRC="/_layouts/15/images/blank.gif" width="1" height="18"/>
            </td>
            <td class="ms-toolbar" nowrap="nowrap">
              <SharePoint:SaveButton runat="server" ControlMode="Edit" id="savebutton2"/>
            </td>
            <td class="ms-separator"> </td>
            <td class="ms-toolbar" nowrap="nowrap" align="right">
              <SharePoint:GoBackButton runat="server" ControlMode="Edit" id="gobackbutton2"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>
  <xsl:template name="dvt_1.rowedit">
    <xsl:param name="Pos" select="position()"/>
    <script id="uploadedFileTmpl" type="text/html">
      <div>
        <label for="uploadTextId">File:</label>
        <span id="uploadTextId">
          <a id="hrefDownloadId" target="_blank">
            <xsl:attribute name="data-bind">attr: { href: serverUrl, title: name}, text: name</xsl:attribute>
          </a>
        </span> (<span id="fileId">
          <xsl:attribute name="data-bind">text: size</xsl:attribute>
        </span>kB) <span id="uploadRemoveId">
          (<a id="removeDoc" href="#">Remove</a>)
        </span>
      </div>
    </script>
    <tr>
      <td>
        <table border="0" cellspacing="0" width="100%">
          <tr id="topBannerMsgId" style="display:none">
            <td colspan="2">
              <div id="TopBannerDivId" class="ms-formvalidation"></div>
            </td>
          </tr>          
          <tr>
            <td width="190px" valign="top" class="ms-formlabel">
              <H3 class="ms-standardheader">
                <nobr>
                  Title<span class="ms-formvalidation"> *</span>
                </nobr>
              </H3>
            </td>
            <td width="400px" valign="top" class="ms-formbody">
              <SharePoint:FormField runat="server" id="ff1{$Pos}" ControlMode="Edit" FieldName="Title" __designer:bind="{ddwrt:DataBind('u',concat('ff1',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Title')}"/>
              <SharePoint:FieldDescription runat="server" id="ff1description{$Pos}" FieldName="Title" ControlMode="Edit"/>
            </td>
          </tr>
          <tr>
            <td width="190px" valign="top" class="ms-formlabel">
              <H3 class="ms-standardheader">
                <nobr>Description</nobr>
              </H3>
            </td>
            <td width="400px" valign="top" class="ms-formbody">
              <SharePoint:FormField runat="server" id="ff2{$Pos}" ControlMode="Edit" FieldName="SampleCSRDescription" __designer:bind="{ddwrt:DataBind('u',concat('ff2',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@SampleCSRDescription')}"/>
              <SharePoint:FieldDescription runat="server" id="ff2description{$Pos}" FieldName="SampleCSRDescription" ControlMode="Edit"/>
            </td>
          </tr>

          <tr id="idAttachmentsUploadModel">
            <td colspan="2">
              <div class="col-xs-10 col-sm-10 col-md-10">
                <xsl:attribute name="data-bind">with: uploadViewModel</xsl:attribute>
                <div class="text-center">
                  <xsl:attribute name="data-bind">visible: $root.isUploading</xsl:attribute>
                  <h3>
                    Uploading <span>
                      <xsl:attribute name="data-bind">text: $root.numberOfFiles</xsl:attribute>
                    </span> files....
                    Please wait while the system uploads your files....
                  </h3>
                  <h3 class='fa fa-refresh fa-spin fa-3x'></h3>
                </div>
                <div>
                  <xsl:attribute name="data-bind">visible: $root.uploadError</xsl:attribute>
                  Error uploading file(s): <span>
                    <xsl:attribute name="data-bind">text: $root.uploadErrorMessage</xsl:attribute>
                  </span>
                </div>
              </div>
            </td>
          </tr>          
          <tr>
            <td width="190px" valign="top" class="ms-formlabel">
              <H3 class="ms-standardheader">
                <nobr>Description Attachments</nobr>
              </H3>
            </td>
            <td width="400px" valign="top" class="ms-formbody">
              <div id="SampleCSRDescAttachmentsRow" style="display:none">
              <SharePoint:FormField runat="server" id="ff3{$Pos}" ControlMode="Edit" FieldName="SampleCSRDescAttachments" __designer:bind="{ddwrt:DataBind('u',concat('ff3',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@SampleCSRDescAttachments')}"/>
              <SharePoint:FieldDescription runat="server" id="ff3description{$Pos}" FieldName="SampleCSRDescAttachments" ControlMode="Edit"/>
              </div>
              <div id="SampleCSRDescAttachmentsUploadBox" class="alert alert-info idUploadBox" style="min-height: 50px">
                <xsl:attribute name="data-bind">event: { dragenter: dragEnter, dragleave: dragLeave, drop: drop, dragover: dragOver }</xsl:attribute>
                <span>Drop your files here...</span>
              </div>
              <div id="SampleCSRDescAttachmentsListing" class="">
                <xsl:attribute name="data-bind">with: uploadViewModel</xsl:attribute>
                <div id="SampleCSRDescAttachmentsId">
                  <xsl:attribute name="data-bind">
                    visible:hasContent, template: { name: "uploadedFileTmpl", foreach: ko.utils.arrayFilter(uploads(), function (elementItem) {
                    return elementItem.targetId() == "SampleCSRDescAttachments";  })}
                  </xsl:attribute>
                </div>
              </div>
              </td>
          </tr>
          <tr>
            <td width="190px" valign="top" class="ms-formlabel">
              <H3 class="ms-standardheader">
                <nobr>Secondary Attachments</nobr>
              </H3>
            </td>
            <td width="400px" valign="top" class="ms-formbody">
              <div id="SampleCSRSecondaryAttachmentsRow" style="display:none">
              <SharePoint:FormField runat="server" id="ff4{$Pos}" ControlMode="Edit" FieldName="SampleCSRSecondaryAttachments" __designer:bind="{ddwrt:DataBind('u',concat('ff4',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@SampleCSRSecondaryAttachments')}"/>
              <SharePoint:FieldDescription runat="server" id="ff4description{$Pos}" FieldName="SampleCSRSecondaryAttachments" ControlMode="Edit"/>
              </div>
              <div id="SampleCSRSecondaryAttachmentsUploadBox" class="alert alert-info idUploadBox" style="min-height: 50px">
                <xsl:attribute name="data-bind">event: { dragenter: dragEnter, dragleave: dragLeave, drop: drop, dragover: dragOver }</xsl:attribute>
                <span>Drop your files here...</span>
              </div>
              <div id="SampleCSRSecondaryAttachmentsListing" class="">
                <xsl:attribute name="data-bind">with: uploadViewModel</xsl:attribute>
                <div id="SampleCSRSecondaryAttachmentsId">
                  <xsl:attribute name="data-bind">
                    visible:hasContent, template: { name: "uploadedFileTmpl", foreach: ko.utils.arrayFilter(uploads(), function (elementItem) {
                    return elementItem.targetId() == "SampleCSRSecondaryAttachments";  }) }
                  </xsl:attribute>
                </div>
              </div>            
              </td>
          </tr>
          <tr>
            <td width="190px" valign="top" class="ms-formlabel">
              <H3 class="ms-standardheader">
                <nobr>Cover Letter Attachments</nobr>
              </H3>
            </td>
            <td width="400px" valign="top" class="ms-formbody">
              <div id="SampleCSRCoverLetterAttachmentsRow" style="display:none">
              <SharePoint:FormField runat="server" id="ff5{$Pos}" ControlMode="Edit" FieldName="SampleCSRCoverLetterAttachments" __designer:bind="{ddwrt:DataBind('u',concat('ff5',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@SampleCSRCoverLetterAttachments')}"/>
              <SharePoint:FieldDescription runat="server" id="ff5description{$Pos}" FieldName="SampleCSRCoverLetterAttachments" ControlMode="Edit"/>
              </div>
              <div id="SampleCSRCoverLetterAttachmentsUploadBox" class="alert alert-info idUploadBox" style="min-height: 50px">
                <xsl:attribute name="data-bind">event: { dragenter: dragEnter, dragleave: dragLeave, drop: drop, dragover: dragOver } </xsl:attribute>
                <span>Drop your files here...</span>
              </div>
              <div id="SampleCSRCoverLetterAttachmentsListing" class="">
                <xsl:attribute name="data-bind">with: uploadViewModel</xsl:attribute>
                <div id="SampleCSRCoverLetterAttachmentsId">
                  <xsl:attribute name="data-bind">
                    visible:hasContent, template: { name: "uploadedFileTmpl", foreach: ko.utils.arrayFilter(uploads(), function (elementItem) {
                    return elementItem.targetId() == "SampleCSRCoverLetterAttachments";  }) }
                  </xsl:attribute>
                </div>
              </div>            
              </td>
          </tr>
          <tr>
            <td width="190px" valign="top" class="ms-formlabel">
              <H3 class="ms-standardheader">
                <nobr>Last Updated<span class="ms-formvalidation"> *</span></nobr>
              </H3>
            </td>
            <td width="400px" valign="top" class="ms-formbody">
              <SharePoint:FormField runat="server" id="ff6{$Pos}" ControlMode="Edit" FieldName="SampleCSRLastUpdated" __designer:bind="{ddwrt:DataBind('u',concat('ff6',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@SampleCSRLastUpdated')}"/>
              <SharePoint:FieldDescription runat="server" id="ff6description{$Pos}" FieldName="SampleCSRLastUpdated" ControlMode="Edit"/>
            </td>
          </tr>
          <tr>
            <td width="190px" valign="top" class="ms-formlabel">
              <H3 class="ms-standardheader">
                <nobr>Comments</nobr>
              </H3>
            </td>
            <td width="400px" valign="top" class="ms-formbody">
              <SharePoint:FormField runat="server" id="ff7{$Pos}" ControlMode="Edit" FieldName="SampleCSRComments" __designer:bind="{ddwrt:DataBind('u',concat('ff7',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@SampleCSRComments')}"/>
              <SharePoint:FieldDescription runat="server" id="ff7description{$Pos}" FieldName="SampleCSRComments" ControlMode="Edit"/>
            </td>
          </tr>
          <tr id="idAttachmentsRow">
            <td nowrap="true" valign="top" class="ms-formlabel" width="20%">
              <SharePoint:FieldLabel ControlMode="Edit" FieldName="Attachments" runat="server"/>
            </td>
            <td valign="top" class="ms-formbody" width="80%">
              <SharePoint:FormField runat="server" id="AttachmentsField" ControlMode="Edit" FieldName="Attachments" __designer:bind="{ddwrt:DataBind('u','AttachmentsField','Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Attachments')}"/>
              <script>
                var elm = document.getElementById(&quot;idAttachmentsTable&quot;);
                if (elm == null || elm.rows.length == 0)
                document.getElementById(&quot;idAttachmentsRow&quot;).style.display=&apos;none&apos;;
              </script>
            </td>
          </tr>
          <xsl:if test="$dvt_1_automode = '1'" ddwrt:cf_ignore="1">
            <tr>
              <td colspan="99" class="ms-vb">
                <span ddwrt:amkeyfield="ID" ddwrt:amkeyvalue="ddwrt:EscapeDelims(string(@ID))" ddwrt:ammode="view"></span>
              </td>
            </tr>
          </xsl:if>
        </table>
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>