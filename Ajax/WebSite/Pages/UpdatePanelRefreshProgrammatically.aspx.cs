using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_UpdatePanelRefreshProgrammatically : System.Web.UI.Page
{
    protected SortedList AnsweredQuestions
    {
        get { return (SortedList)(ViewState["AnsweredQuestions"] ?? new SortedList()); }
        set { ViewState["AnsweredQuestions"] = value; }        
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        ScriptManager.GetCurrent(Page).RegisterAsyncPostBackControl(SurveyDataList);
    }

    protected void ChoicesRadioButtonList_SelectedIndexChanged(object sender, EventArgs e)
    {
        SortedList answers = this.AnsweredQuestions;
        RadioButtonList r = (RadioButtonList)sender;
        answers[r.ToolTip] = r.SelectedValue;
        this.AnsweredQuestions = answers;

        ResultsList.DataSource = this.AnsweredQuestions;
        ResultsList.DataBind();

        if (this.AnsweredQuestions.Count == SurveyDataList.Items.Count)
            SubmitButton.Visible = true;

        UpdatePanel1.Update();
    }

    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        // Submit responses.
    }

}