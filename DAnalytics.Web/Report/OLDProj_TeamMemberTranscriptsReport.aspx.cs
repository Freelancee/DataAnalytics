﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DAnalytics.Web.Report
{
    /// <summary>
    /// Webform to view team members transcripts
    /// </summary>
    public partial class TeamMemberTranscriptsReport : BasePage.DAnalBase
    {
        /// <summary>
        /// Handles the Init event of the Page control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The instance containing the event data.</param>
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            this.MenuID = 17;
        }

        /// <summary>
        /// Handles the Pre render event of the Page control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The instance containing the event data.</param>
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            this.SetAccessRoles();
        }

        /// <summary>
        /// Handles the Load event of the Page control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The instance containing the event data.</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            txtDtFrom.Attributes.Add("readonly", "readonly");
            txtDtTo.Attributes.Add("readonly", "readonly");
            hdnUserID.Value = UserID.ToString();
            if (!IsPostBack)
            {
                txtDtFrom.Text = UTIL.DAnalHelper.FirstDayOfMonth(System.DateTime.Now).ToString("MM/dd/yyyy");
                txtDtTo.Text = UTIL.DAnalHelper.LastDayOfMonth(System.DateTime.Now).ToString("MM/dd/yyyy");
            }
        }
    }
}