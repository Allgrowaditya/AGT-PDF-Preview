pageextension 50203 PostedSalesInvext extends "Posted Sales Invoice"
{
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

    actions
    {
        // Add changes to page actions here
    }

    trigger OnAfterGetCurrRecord()
    begin
        ShowPdfInViewer();
    end;

    local procedure ShowPdfInViewer()
    var
        pdfViewerSetup: Codeunit PDFViewerSetup;
        DocumentAttachment: Record "Document Attachment";

    begin
        DocumentAttachment.Reset();
        DocumentAttachment.SetRange("No.", Rec."No.");
        if DocumentAttachment.FindSet() then begin
            if DocumentAttachment."File Type" <> DocumentAttachment."File Type"::PDF then
                exit;
            CurrPage.PDFViewer.Page.LoadPdfFromBase64(pdfViewerSetup.ToBase64String(Format(DocumentAttachment."Document Reference ID")));
        end else
            CurrPage.PDFViewer.Page.LoadPdfFromBase64(pdfViewerSetup.getBlankPageBase64());
    end;
}