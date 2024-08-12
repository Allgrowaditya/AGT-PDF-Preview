pageextension 50202 DocumentAttachmentDetailsExt extends "Document Attachment Details"
{
    //AGT_MD_122123 ++
    layout
    {
        addfirst(FactBoxes)
        {
            part(PDFViewer; PDFViewerPart)
            {
                Caption = 'PDF Viewer';
                ApplicationArea = All;
            }
        }
    }
    //AGT_MD_122123 --
    actions
    {
        addlast(Processing)
        {
            action(ViewPDF)
            {
                ApplicationArea = All;
                Caption = 'View';
                Image = View;
                Enabled = Rec."File Type" = Rec."File Type"::PDF;
                Scope = "Repeater";

                trigger OnAction()
                begin
                    Rec.ViewAttachment(false);
                end;
            }
            action(ViewPDFPopup)
            {
                ApplicationArea = All;
                Caption = 'View in new window';
                Image = View;
                Enabled = Rec."File Type" = Rec."File Type"::PDF;
                Scope = "Repeater";

                trigger OnAction()
                begin
                    Rec.ViewAttachment(true);
                end;
            }
        }
    }



    trigger OnAfterGetCurrRecord()
    begin
        ShowPdfInViewer();
    end;

    local procedure ShowPdfInViewer()
    var
        pdfViewerSetup: Codeunit PDFViewerSetup;
    begin

        if Rec."File Type" <> Rec."File Type"::PDF then
            exit;
        CurrPage.PDFViewer.Page.LoadPdfFromBase64(pdfViewerSetup.ToBase64String(Format(Rec."Document Reference ID")));
    end;

}